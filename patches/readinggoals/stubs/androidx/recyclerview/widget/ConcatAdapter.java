package androidx.recyclerview.widget;

import android.view.ViewGroup;

// raw supertype since d8 crashes on the generic signature
@SuppressWarnings("rawtypes")
public final class ConcatAdapter extends RecyclerView.Adapter {
    @SafeVarargs
    public ConcatAdapter(Config config, RecyclerView.Adapter<? extends RecyclerView.ViewHolder>... adapters) {
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        throw new RuntimeException("stub");
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
    }

    @Override
    public int getItemCount() {
        throw new RuntimeException("stub");
    }

    public static final class Config {
        public static final class Builder {
            public Builder() {
            }

            public Builder setStableIdMode(StableIdMode mode) {
                throw new RuntimeException("stub");
            }

            public Config build() {
                throw new RuntimeException("stub");
            }
        }

        // really an enum, but d8 crashes on the generic signature
        public static final class StableIdMode {
            public static final StableIdMode NO_STABLE_IDS = null;
            public static final StableIdMode ISOLATED_STABLE_IDS = null;
            public static final StableIdMode SHARED_STABLE_IDS = null;
        }
    }
}
