/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Vendor;
import com.mt.services.VendorService;

/**
 *
 * @author Muaz
 */
public class UpdateMyVendors extends AuthenticatedAction {

    private int id;
    private int priority;
    private String notes;
    private String oper;
    private VendorService vendorService;

    public void setId(int id) {
        this.id = id;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    public void setOper(String oper) {
        this.oper = oper;
    }

    public String execute() throws Exception {

        if (oper.equals("edit")) {
            Vendor vendor = vendorService.getById(id);
            vendor.setPriority(priority);
            vendor.setNotes(notes);
            vendorService.update(vendor);
        } else if (oper.equals("del")) {
            vendorService.deleteById(id);

        }


        return SUCCESS;
    }
}
