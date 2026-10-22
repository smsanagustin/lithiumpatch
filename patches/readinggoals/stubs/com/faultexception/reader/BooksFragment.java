package com.faultexception.reader;

import android.view.View;

import androidx.fragment.app.Fragment;

public class BooksFragment extends Fragment {
    public static final int FILTER_NONE = 0;

    public int getFilter() {
        throw new RuntimeException("stub");
    }

    public void onItemClick(View view, long id) {
    }
}
