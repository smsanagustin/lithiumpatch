package androidx.recyclerview.widget;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

public class RecyclerView extends ViewGroup {
    public RecyclerView(Context context) {
        super(context);
    }

    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
    }

    public Adapter getAdapter() {
        throw new RuntimeException("stub");
    }

    public void setAdapter(Adapter adapter) {
    }

    public LayoutManager getLayoutManager() {
        throw new RuntimeException("stub");
    }

    public static abstract class LayoutManager {
    }

    public static class LayoutParams extends ViewGroup.MarginLayoutParams {
        public LayoutParams(int width, int height) {
            super(width, height);
        }
    }

    public static abstract class ViewHolder {
        public final View itemView;

        public ViewHolder(View itemView) {
            this.itemView = itemView;
        }
    }

    public static abstract class Adapter<VH extends ViewHolder> {
        public abstract VH onCreateViewHolder(ViewGroup parent, int viewType);

        public abstract void onBindViewHolder(VH holder, int position);

        public abstract int getItemCount();

        public long getItemId(int position) {
            throw new RuntimeException("stub");
        }

        public int getItemViewType(int position) {
            throw new RuntimeException("stub");
        }

        public void setHasStableIds(boolean hasStableIds) {
        }

        public final void notifyDataSetChanged() {
        }
    }
}
