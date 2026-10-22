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
	"maps"
	"path"
	"slices"
	"strings"

	. "github.com/pgaskin/lithiumpatch/patches/patchdef"
)

//go:generate go run readinggoals_generate.go

//go:embed readinggoals/smali
var readingGoalsSmali embed.FS

// Material icons (Apache 2.0).
var readingGoalsIcons = map[string]string{
	"goals_ic_check": "M9,16.17L4.83,12l-1.42,1.41L9,19 21,7l-1.41,-1.41z",
	"goals_ic_close": "M19,6.41L17.59,5 12,10.59 6.41,5 5,6.41 10.59,12 5,17.59 6.41,19 12,13.41 17.59,19 19,17.59 13.41,12z",
}

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

	for _, name := range slices.Sorted(maps.Keys(readingGoalsIcons)) {
		inst = append(inst,
			WriteFileString("res/drawable/"+name+".xml", FixIndent(`
			<?xml version="1.0" encoding="utf-8"?>
			<vector android:width="24.0dp" android:height="24.0dp" android:viewportWidth="24.0" android:viewportHeight="24.0" xmlns:android="http://schemas.android.com/apk/res/android">
				<path android:fillColor="#ff000000" android:pathData="`+readingGoalsIcons[name]+`" />
			</vector>
			`)),
			DefineR("smali/com/faultexception/reader", "drawable", name),
		)
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
