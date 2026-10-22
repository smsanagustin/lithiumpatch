package androidx.recyclerview.widget;

public class GridLayoutManager extends RecyclerView.LayoutManager {
    public int getSpanCount() {
        throw new RuntimeException("stub");
    }

    public void setSpanSizeLookup(SpanSizeLookup lookup) {
    }

    public static abstract class SpanSizeLookup {
        public abstract int getSpanSize(int position);
    }
}
