//go:build ignore

// Compiles the Java sources in readinggoals/java into smali in
// readinggoals/smali, then checks that every reference to an app or library
// class resolves against the original Lithium APK (R8 may have stripped
// unused library methods, which javac can't know about since it compiles
// against stubs).
//
// Requires javac (JDK 11+), an Android platform android.jar, d8.jar (from the
// Android build-tools), and the Lithium APK (see app/app.go).
//
//	ANDROID_JAR=.../platforms/android-35/android.jar \
//	D8_JAR=.../build-tools/34.0.0/lib/d8.jar \
//	go generate ./patches
package main

import (
	"archive/zip"
	"bufio"
	"errors"
	"flag"
	"fmt"
	"io/fs"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"slices"
	"strings"
)

var (
	AndroidJar = flag.String("android-jar", os.Getenv("ANDROID_JAR"), "Path to android.jar (default: $ANDROID_JAR)")
	D8Jar      = flag.String("d8", os.Getenv("D8_JAR"), "Path to d8.jar (default: $D8_JAR)")
	Apktool    = flag.String("apktool", "../lib/apktool-3.0.3.jar", "Path to apktool.jar")
	APK        = flag.String("apk", "../app/Lithium_0.25.0.apk", "Path to the original Lithium APK (for verifying references)")
	NoVerify   = flag.Bool("no-verify", false, "Skip verifying references against the APK")
)

const (
	srcDir  = "readinggoals/java"
	stubDir = "readinggoals/stubs"
	outDir  = "readinggoals/smali"
	ownPkg  = "com/faultexception/reader/goals/"
)

func main() {
	flag.Parse()
	if err := run(); err != nil {
		fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(1)
	}
}

func run() error {
	if *AndroidJar == "" {
		return fmt.Errorf("android.jar not specified (set ANDROID_JAR or --android-jar)")
	}
	if *D8Jar == "" {
		return fmt.Errorf("d8.jar not specified (set D8_JAR or --d8)")
	}

	td, err := os.MkdirTemp("", "readinggoals")
	if err != nil {
		return err
	}
	defer os.RemoveAll(td)

	fmt.Printf("info: compiling stubs\n")
	stubClasses := filepath.Join(td, "stubs")
	if err := javac(stubClasses, *AndroidJar, stubDir); err != nil {
		return fmt.Errorf("compile stubs: %w", err)
	}
	stubJar := filepath.Join(td, "stubs.jar")
	if err := zipDir(stubJar, stubClasses); err != nil {
		return fmt.Errorf("package stubs: %w", err)
	}

	fmt.Printf("info: compiling sources\n")
	classes := filepath.Join(td, "classes")
	if err := javac(classes, *AndroidJar+string(os.PathListSeparator)+stubJar, srcDir); err != nil {
		return fmt.Errorf("compile sources: %w", err)
	}

	fmt.Printf("info: dexing\n")
	smali, err := disassemble(td, "classes", classes, stubJar)
	if err != nil {
		return err
	}

	if !*NoVerify {
		fmt.Printf("info: verifying references against %s\n", *APK)
		orig := filepath.Join(td, "orig")
		if err := command("java", "-jar", *Apktool, "d", "-f", "-r", "-o", orig, *APK); err != nil {
			return fmt.Errorf("decode apk: %w", err)
		}
		stubSmali, err := disassemble(td, "stubs", stubClasses, "")
		if err != nil {
			return err
		}
		if err := verify(smali, stubSmali, orig); err != nil {
			return err
		}
	}

	fmt.Printf("info: writing %s\n", outDir)
	if err := os.RemoveAll(outDir); err != nil {
		return err
	}
	return os.CopyFS(outDir, os.DirFS(smali))
}

// disassemble converts the class files in dir to smali, returning the
// directory containing it.
func disassemble(td, name, dir, classpath string) (string, error) {
	classFiles, err := findFiles(dir, ".class")
	if err != nil {
		return "", err
	}
	out := filepath.Join(td, name+"-smali")
	if len(classFiles) == 0 {
		return out, os.MkdirAll(out, 0777)
	}
	dex := filepath.Join(td, name+"-dex")
	if err := os.Mkdir(dex, 0777); err != nil {
		return "", err
	}
	args := []string{
		"-cp", *D8Jar, "com.android.tools.r8.D8",
		"--release",
		"--min-api", "26",
		"--lib", *AndroidJar,
		"--output", dex,
	}
	if classpath != "" {
		args = append(args, "--classpath", classpath)
	}
	if err := command("java", append(args, classFiles...)...); err != nil {
		return "", fmt.Errorf("d8 %s: %w", name, err)
	}
	dexAPK := filepath.Join(td, name+".apk")
	if err := zipDir(dexAPK, dex); err != nil {
		return "", fmt.Errorf("package %s dex: %w", name, err)
	}
	dec := filepath.Join(td, name+"-dec")
	if err := command("java", "-jar", *Apktool, "d", "-f", "-r", "-o", dec, dexAPK); err != nil {
		return "", fmt.Errorf("baksmali %s: %w", name, err)
	}
	return out, os.Rename(filepath.Join(dec, "smali"), out)
}

func javac(out, classpath, dir string) error {
	srcs, err := findFiles(dir, ".java")
	if err != nil {
		return err
	}
	if len(srcs) == 0 {
		return os.MkdirAll(out, 0777)
	}
	return command("javac", append([]string{
		"--release", "8",
		"-Xlint:-options",
		"-encoding", "UTF-8",
		"-cp", classpath,
		"-d", out,
	}, srcs...)...)
}

func command(name string, args ...string) error {
	cmd := exec.Command(name, args...)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	return cmd.Run()
}

func findFiles(dir, ext string) ([]string, error) {
	var files []string
	err := filepath.WalkDir(dir, func(path string, d fs.DirEntry, err error) error {
		if path == dir && errors.Is(err, fs.ErrNotExist) {
			return nil
		}
		if err == nil && !d.IsDir() && strings.HasSuffix(path, ext) {
			files = append(files, path)
		}
		return err
	})
	slices.Sort(files)
	return files, err
}

func zipDir(dst, dir string) error {
	f, err := os.Create(dst)
	if err != nil {
		return err
	}
	defer f.Close()

	zw := zip.NewWriter(f)
	if err := zw.AddFS(os.DirFS(dir)); err != nil {
		return err
	}
	if err := zw.Close(); err != nil {
		return err
	}
	return f.Close()
}

// smaliClass is the subset of a smali class needed to resolve references.
type smaliClass struct {
	iface   bool
	super   string
	ifaces  []string
	members map[string]bool // "name(args)ret" for methods, "name:type" for fields
}

var (
	reClass  = regexp.MustCompile(`^\.class ((?:[a-z-]+ )*)(L[^;]+;)$`)
	reSuper  = regexp.MustCompile(`^\.super (L[^;]+;)$`)
	reIface  = regexp.MustCompile(`^\.implements (L[^;]+;)$`)
	reMethod = regexp.MustCompile(`^\.method (?:[a-z-]+ )*([^ ]+\(.*)$`)
	reField  = regexp.MustCompile(`^\.field (?:[a-z-]+ )*([^ ]+:[^ ]+)`)
	reInvoke = regexp.MustCompile(`^(invoke-[a-z]+)(?:/range)? \{[^}]*\}, (L[^;]+;)->([^ ]+\(.*)$`)
	reAccess = regexp.MustCompile(`^[is](?:get|put)(?:-[a-z]+)? [^,]+, (?:[^,]+, )?(L[^;]+;)->([^ ]+:[^ ]+)$`)
)

func parseClasses(dir string) (map[string]*smaliClass, error) {
	files, err := findFiles(dir, ".smali")
	if err != nil {
		return nil, err
	}
	classes := map[string]*smaliClass{}
	for _, file := range files {
		f, err := os.Open(file)
		if err != nil {
			return nil, err
		}
		var name string
		c := &smaliClass{members: map[string]bool{}}
		sc := bufio.NewScanner(f)
		sc.Buffer(nil, 1024*1024)
		for sc.Scan() {
			line := strings.TrimSpace(sc.Text())
			if m := reClass.FindStringSubmatch(line); m != nil {
				name = m[2]
				c.iface = strings.Contains(m[1], "interface ")
			} else if m := reSuper.FindStringSubmatch(line); m != nil {
				c.super = m[1]
			} else if m := reIface.FindStringSubmatch(line); m != nil {
				c.ifaces = append(c.ifaces, m[1])
			} else if m := reMethod.FindStringSubmatch(line); m != nil {
				c.members[m[1]] = true
			} else if m := reField.FindStringSubmatch(line); m != nil {
				c.members[m[1]] = true
			}
		}
		f.Close()
		if err := sc.Err(); err != nil {
			return nil, fmt.Errorf("read %s: %w", file, err)
		}
		if name != "" {
			classes[name] = c
		}
	}
	return classes, nil
}

// resolve reports whether member is declared on cls or one of its ancestors
// in classes.
func resolve(classes map[string]*smaliClass, cls, member string) bool {
	c, ok := classes[cls]
	if !ok {
		return false
	}
	if c.members[member] {
		return true
	}
	if c.super != "" && resolve(classes, c.super, member) {
		return true
	}
	for _, i := range c.ifaces {
		if resolve(classes, i, member) {
			return true
		}
	}
	return false
}

// verify checks that references from the generated smali to non-framework
// classes exist in the original APK. A member that isn't in the APK is only
// accepted if javac must have resolved it from android.jar, i.e., it isn't
// declared by any stub.
func verify(generated, stubs, orig string) error {
	stubClasses, err := parseClasses(stubs)
	if err != nil {
		return err
	}
	framework, err := jarClasses(*AndroidJar)
	if err != nil {
		return fmt.Errorf("read android.jar: %w", err)
	}
	var classes = map[string]*smaliClass{}
	for _, d := range []string{"smali", "smali_classes2"} {
		cs, err := parseClasses(filepath.Join(orig, d))
		if err != nil {
			return err
		}
		for k, v := range cs {
			classes[k] = v
		}
	}

	files, err := findFiles(generated, ".smali")
	if err != nil {
		return err
	}
	var errs []string
	for _, file := range files {
		buf, err := os.ReadFile(file)
		if err != nil {
			return err
		}
		for i, line := range strings.Split(string(buf), "\n") {
			line = strings.TrimSpace(line)
			var op, cls, member string
			if m := reInvoke.FindStringSubmatch(line); m != nil {
				op, cls, member = m[1], m[2], m[3]
			} else if m := reAccess.FindStringSubmatch(line); m != nil {
				cls, member = m[1], m[2]
			} else {
				continue
			}
			if strings.HasPrefix(cls, "L"+ownPkg) {
				continue // ours
			}
			if strings.HasPrefix(cls, "Lcom/faultexception/reader/R$") && strings.HasPrefix(member, "goals_") {
				continue // resource IDs added by the patch
			}
			c, ok := classes[cls]
			if !ok {
				if !framework[cls] {
					errs = append(errs, fmt.Sprintf("%s:%d: class %s not found in apk", file, i+1, cls))
				}
				continue
			}
			if op == "invoke-interface" && !c.iface {
				errs = append(errs, fmt.Sprintf("%s:%d: %s is a class, not an interface (fix the stub)", file, i+1, cls))
			} else if op == "invoke-virtual" && c.iface {
				errs = append(errs, fmt.Sprintf("%s:%d: %s is an interface, not a class (fix the stub)", file, i+1, cls))
			}
			if !resolve(classes, cls, member) && resolve(stubClasses, cls, member) {
				errs = append(errs, fmt.Sprintf("%s:%d: %s->%s not found in apk (stripped by r8?)", file, i+1, cls, member))
			}
		}
	}
	if len(errs) != 0 {
		return fmt.Errorf("unresolved references:\n\t%s", strings.Join(errs, "\n\t"))
	}
	return nil
}

// jarClasses returns the type descriptors of the classes in a jar.
func jarClasses(name string) (map[string]bool, error) {
	zr, err := zip.OpenReader(name)
	if err != nil {
		return nil, err
	}
	defer zr.Close()

	classes := map[string]bool{}
	for _, f := range zr.File {
		if c, ok := strings.CutSuffix(f.Name, ".class"); ok {
			classes["L"+c+";"] = true
		}
	}
	return classes, nil
}
