/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.util;

import com.google.gson.annotations.Expose;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class RecordsJson<T> {

    @Expose
    private int page;
    @Expose
    private int total;
    @Expose
    private long records;
    @Expose
    private List<GridRow> rows;
    private List<T> dataRecords;

    public RecordsJson(List<T> dataRecords) {
        this.dataRecords = dataRecords;
    }

    public RecordsJson(int page, int pageSize, List<T> dataRecords) {
        this.dataRecords = dataRecords;

        this.page = page;
        this.records = dataRecords.size();
        this.total = (int) Math.ceil((double) dataRecords.size() / 10);

        rows = new ArrayList<GridRow>();
        for (T t : dataRecords) {
            int id = 0;
            try {
                Class cls = t.getClass();
                Method meth = cls.getMethod("getId", (Class[]) null);
                id = (Integer) meth.invoke(t, new Object[0]);
                //id = (Integer) retobj;
            } catch (Exception e) {
                e.printStackTrace();
            }
            GridRow row = new GridRow(id, t);
            rows.add(row);
        }
    }

    public RecordsJson(int page, int pageSize, long totalRecords, List<T> dataRecords) {
        this.dataRecords = dataRecords;

        this.page = page;
        this.records = totalRecords;
        this.total = (int) Math.ceil((double) totalRecords / pageSize);

        rows = new ArrayList<GridRow>();
        for (T t : dataRecords) {
            int id = 0;
            try {
                Class cls = t.getClass();
                Method meth = cls.getMethod("getId", (Class[]) null);
                id = (Integer) meth.invoke(t, new Object[0]);
                //id = (Integer) retobj;
            } catch (Exception e) {
                e.printStackTrace();
            }
            GridRow row = new GridRow(id, t);
            rows.add(row);
        }
    }
}
