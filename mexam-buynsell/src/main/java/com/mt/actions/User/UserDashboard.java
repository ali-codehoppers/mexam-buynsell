/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.User;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Inventory;
import com.mt.hibernate.entities.Vendor;
import com.mt.services.InventoryService;
import com.mt.services.RFQService;
import com.mt.services.VendorService;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author Muaz
 */
public class UserDashboard extends AuthenticatedAction {

    private Long totalInventory;
    private Long totalVendors;
    private Long latestInventory;
    private Long latestVendors;
    private Long latestRFQsReceived;
    private Long latestRFQsSent;
    private Inventory inventory;
    private InventoryService inventoryService;
    private Vendor vendor;
    private VendorService vendorService;
    private RFQService rFQService;

    public void setInventory(Inventory inventory) {
        this.inventory = inventory;
    }

    public void setInventoryService(InventoryService inventoryService) {
        this.inventoryService = inventoryService;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    public void setrFQService(RFQService rFQService) {
        this.rFQService = rFQService;
    }

    @Override
    public String execute() throws Exception {
        List<String> searchFields = new ArrayList<String>();
        List<String> searchOpers = new ArrayList<String>();
        List<String> searchStrings = new ArrayList<String>();
        searchFields.add("companyId");
        searchOpers.add("eq");
        searchStrings.add("" + getUser().getCompanyId());
        System.out.println(getUser().getFirstName());
        totalInventory = inventoryService.getRecordsCount(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers));
        totalVendors = vendorService.getRecordsCount(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers));
        Calendar currentDate = Calendar.getInstance();
        currentDate.add(Calendar.DATE, -7);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateNow = formatter.format(currentDate.getTime());
        searchFields.add("creationDate");
        searchOpers.add("gt");
        searchStrings.add("'" + dateNow + "'");
        latestInventory = inventoryService.getRecordsCount(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers));
        latestVendors = vendorService.getRecordsCount(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers));
        searchFields.clear();
        searchOpers.clear();
        searchStrings.clear();
        searchFields.add("receiverId");
        searchOpers.add("eq");
        searchStrings.add("" + getUser().getCompanyId());
        searchFields.add("creationDate");
        searchOpers.add("gt");
        searchStrings.add("'" + dateNow + "'");
        latestRFQsReceived = rFQService.getRecordsCount(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers));
        searchFields.clear();
        searchFields.add("senderId");
        searchFields.add("creationDate");
        latestRFQsSent = rFQService.getRecordsCount(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers));
       
        System.out.println(totalInventory);
        return SUCCESS;
    }

    public Long getTotalInventory() {
        return totalInventory;
    }

    public Long getTotalVendors() {
        return totalVendors;
    }

    public Long getLatestInventory() {
        return latestInventory;
    }

    public Long getLatestRFQsReceived() {
        return latestRFQsReceived;
    }

    public Long getLatestRFQsSent() {
        return latestRFQsSent;
    }

    public Long getLatestVendors() {
        return latestVendors;
    }

    protected String[] getStringArray(List<String> list) {
        return list.toArray(new String[list.size()]);
    }
}
