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
	"goals_ic_add":    "M19,13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z",
	"goals_ic_book":   "M21,5c-1.11,-0.35 -2.33,-0.5 -3.5,-0.5 -1.95,0 -4.05,0.4 -5.5,1.5 -1.45,-1.1 -3.55,-1.5 -5.5,-1.5S2.45,4.9 1,6v14.65c0,0.25 0.25,0.5 0.5,0.5 0.1,0 0.15,-0.05 0.25,-0.05C3.1,20.45 5.05,20 6.5,20c1.95,0 4.05,0.4 5.5,1.5 1.35,-0.85 3.8,-1.5 5.5,-1.5 1.65,0 3.35,0.3 4.75,1.05 0.1,0.05 0.15,0.05 0.25,0.05 0.25,0 0.5,-0.25 0.5,-0.5V6c-0.6,-0.45 -1.25,-0.75 -2,-1zM21,18.5c-1.1,-0.35 -2.3,-0.5 -3.5,-0.5 -1.7,0 -4.15,0.65 -5.5,1.5V8c1.35,-0.85 3.8,-1.5 5.5,-1.5 1.2,0 2.4,0.15 3.5,0.5v11.5z",
	"goals_ic_check":  "M9,16.17L4.83,12l-1.42,1.41L9,19 21,7l-1.41,-1.41z",
	"goals_ic_close":  "M19,6.41L17.59,5 12,10.59 6.41,5 5,6.41 10.59,12 5,17.59 6.41,19 12,13.41 17.59,19 19,17.59 13.41,12z",
	"goals_ic_edit":   "M3,17.25V21h3.75L17.81,9.94l-3.75,-3.75L3,17.25zM5.92,19H5v-0.92l9.06,-9.06 0.92,0.92L5.92,19zM20.71,5.63l-2.34,-2.34c-0.2,-0.2 -0.45,-0.29 -0.71,-0.29s-0.51,0.1 -0.7,0.29l-1.83,1.83 3.75,3.75 1.83,-1.83c0.39,-0.39 0.39,-1.02 0,-1.41z",
	"goals_ic_remove": "M19,13H5v-2h14v2z",
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

	inst = append(inst,
		// check for finished books when returning to the library
		PatchFile("smali/com/faultexception/reader/MainActivity.smali",
			InMethod("onResume()V",
				ReplaceStringAppend(
					"\n"+`    invoke-super {p0}, Lcom/faultexception/reader/BaseActivity;->onResume()V`+"\n",
					"\n"+`    invoke-static {p0}, Lcom/faultexception/reader/goals/ReadingGoals;->onLibraryResume(Landroid/app/Activity;)V`+"\n",
				),
			),
		),
	)

	inst = append(inst,
		// show the dashboard above the library
		PatchFile("smali/com/faultexception/reader/BooksFragment.smali",
			InMethod("onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;",
				ReplaceString(
					"\n"+`    invoke-virtual {v0, p1}, Lcom/faultexception/reader/widget/AutoFitRecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V`+"\n",
					"\n"+`    invoke-static {p0, v0, p1}, Lcom/faultexception/reader/goals/Dashboard;->attach(Lcom/faultexception/reader/BooksFragment;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$Adapter;)V`+"\n",
				),
			),
			InMethod("applyLayoutMode()V",
				ReplaceStringPrepend(
					"\n"+`    return-void`+"\n",
					FixIndent("\n"+`
						iget-object v0, p0, Lcom/faultexception/reader/BooksFragment;->mBookshelfView:Lcom/faultexception/reader/widget/AutoFitRecyclerView;
						iget-object v1, p0, Lcom/faultexception/reader/BooksFragment;->mSearchQuery:Ljava/lang/String;
						invoke-static {v0, v1}, Lcom/faultexception/reader/goals/Dashboard;->onLayoutApplied(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/String;)V
					`),
				),
			),
		),
	)

	Register("readinggoals", inst...)
}
