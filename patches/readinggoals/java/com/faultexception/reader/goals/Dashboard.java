package com.faultexception.reader.goals;

import android.view.ViewGroup;

import androidx.recyclerview.widget.ConcatAdapter;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.faultexception.reader.BooksFragment;

import java.util.Map;
import java.util.WeakHashMap;

/**
 * Shows the reading goals as the first item of the library, before the
 * books. Only shown for all books in the main library, and hidden while
 * searching.
 *
 * This extends the raw adapter type since d8 crashes on the generic
 * signature when compiling against the stubs.
 */
@SuppressWarnings("rawtypes")
public final class Dashboard extends RecyclerView.Adapter {
    private static final long ITEM_ID = Long.MIN_VALUE + 0x60a1; // ids are shared with the books adapter
    private static final int VIEW_TYPE = 0x60a1;

    private static final Map<RecyclerView, Dashboard> attached = new WeakHashMap<>();

    private final BooksFragment fragment;
    private final boolean enabled;
    private boolean searching;
    private DashboardView view;

    private Dashboard(BooksFragment fragment) {
        this.fragment = fragment;
        this.enabled = fragment.getFilter() == BooksFragment.FILTER_NONE
                && fragment.getActivity() != null
                && fragment.getActivity().getClass().getName().equals("com.faultexception.reader.MainActivity");
        setHasStableIds(true);
    }

    /** Called instead of setting the books adapter on the library view. */
    public static void attach(BooksFragment fragment, RecyclerView recyclerView, RecyclerView.Adapter<?> books) {
        Dashboard dashboard = new Dashboard(fragment);
        attached.put(recyclerView, dashboard);
        ConcatAdapter.Config config = new ConcatAdapter.Config.Builder()
                .setStableIdMode(ConcatAdapter.Config.StableIdMode.SHARED_STABLE_IDS)
                .build();
        recyclerView.setAdapter(new ConcatAdapter(config, dashboard, books));
    }

    /** Called after the library's layout manager is replaced. */
    public static void onLayoutApplied(RecyclerView recyclerView, String searchQuery) {
        Dashboard dashboard = attached.get(recyclerView);
        if (dashboard == null) {
            return;
        }
        boolean searching = searchQuery != null;
        if (dashboard.searching != searching) {
            dashboard.searching = searching;
            dashboard.notifyDataSetChanged();
        }
        RecyclerView.LayoutManager lm = recyclerView.getLayoutManager();
        if (lm instanceof GridLayoutManager) {
            GridLayoutManager grid = (GridLayoutManager) lm;
            grid.setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() {
                @Override
                public int getSpanSize(int position) {
                    return position < dashboard.getItemCount() ? grid.getSpanCount() : 1;
                }
            });
        }
    }

    /** Updates all visible dashboards. */
    static void refreshAll() {
        for (Dashboard dashboard : attached.values()) {
            if (dashboard.view != null && dashboard.fragment.isAdded()) {
                dashboard.view.bind();
            }
        }
    }

    @Override
    public int getItemCount() {
        return enabled && !searching ? 1 : 0;
    }

    @Override
    public long getItemId(int position) {
        return ITEM_ID;
    }

    @Override
    public int getItemViewType(int position) {
        return VIEW_TYPE;
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        view = new DashboardView(parent.getContext(), fragment);
        // span the full width, ignoring the padding around the books
        RecyclerView.LayoutParams lp = new RecyclerView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.leftMargin = -parent.getPaddingLeft();
        lp.rightMargin = -parent.getPaddingRight();
        lp.topMargin = -parent.getPaddingTop();
        view.setLayoutParams(lp);
        return new DashboardHolder(view);
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        ((DashboardHolder) holder).view.bind();
    }
}
