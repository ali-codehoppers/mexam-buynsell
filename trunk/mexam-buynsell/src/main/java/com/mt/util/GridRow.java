/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.util;

import com.google.gson.annotations.Expose;



public class GridRow {

    @Expose
    int id;
    @Expose    
    Object cell;
    public GridRow(int id, Object obj)
    {
        this.id =id;
        this.cell = obj;
    }
    
}
