// # Reading goals
//
// Track daily reading time and books finished per year against goals, similar
// to Apple Books.
//
// The implementation is written in Java (readinggoals/java) and compiled into
// smali (readinggoals/smali) by running go generate (see
// readinggoals_generate.go). It is placed in a separate dex since the main one
// is close to the method limit.
package patches

import (
	"embed"
	"io/fs"
	"path"
	"strings"

	. "github.com/pgaskin/lithiumpatch/patches/patchdef"
)

//go:generate go run readinggoals_generate.go

//go:embed readinggoals/smali
var readingGoalsSmali embed.FS

func init() {
	var inst []Instruction
	if err := fs.WalkDir(readingGoalsSmali, "readinggoals/smali", func(name string, d fs.DirEntry, err error) error {
		if err != nil || d.IsDir() {
			return err
		}
		buf, err := readingGoalsSmali.ReadFile(name)
		if err != nil {
			return err
		}
		rel, _ := strings.CutPrefix(name, "readinggoals/smali/")
		inst = append(inst, WriteFile(path.Join("smali_classes3", rel), buf))
		return nil
	}); err != nil {
		panic(err)
	}

	inst = append(inst,
		// track time spent in the reader
		PatchFile("smali/com/faultexception/reader/ReaderActivity.smali",
			InMethod("onResume()V",
				ReplaceStringAppend(
					"\n"+`    invoke-super {p0}, Lcom/faultexception/reader/BaseActivity;->onResume()V`+"\n",
					"\n"+`    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingTracker;->onReaderResume(Landroid/app/Activity;)V`+"\n",
				),
			),
			InMethod("onPause()V",
				ReplaceStringAppend(
					"\n"+`    invoke-super {p0}, Lcom/faultexception/reader/BaseActivity;->onPause()V`+"\n",
					"\n"+`    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingTracker;->onReaderPause(Landroid/app/Activity;)V`+"\n",
				),
			),
		),
	)

	Register("readinggoals", inst...)
}
