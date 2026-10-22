package com.faultexception.reader.book;

import android.database.sqlite.SQLiteDatabase;

import java.util.Map;

public class EPubPageMap {
    public Map<String, Item> items;
    public int totalPageCount;

    public static EPubPageMap readFromCache(long bookId, SQLiteDatabase db) {
        throw new RuntimeException("stub");
    }

    public static class Item {
        public int pageCount;
        public int pageStart;
    }
}
