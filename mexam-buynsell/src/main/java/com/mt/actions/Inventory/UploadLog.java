/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Inventory;

import com.google.gson.annotations.Expose;
import java.io.Serializable;

/**
 *
 * @author Muaz
 */
public class UploadLog implements Serializable{
    @Expose
    private String manufacturer;
    @Expose
    private String partNo;
    @Expose
    private String condition;
    @Expose
    private String status;
    

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public void setPartNo(String partNo) {
        this.partNo = partNo;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public String getPartNo() {
        return partNo;
    }

    public String getStatus() {
        return status;
    }
    
    
    
}
