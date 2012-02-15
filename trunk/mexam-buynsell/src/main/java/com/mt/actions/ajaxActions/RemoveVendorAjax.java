/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Vendor;
import com.mt.services.VendorService;
import java.util.ArrayList;
import java.util.List;

public class RemoveVendorAjax extends AuthenticatedAction {

    private String message;
//    private Company company;
    private Vendor vendor;
    private int vendorId;
//    private CompanyService companyService;
    private VendorService vendorService;
    private List<String> searchFields;
    private List<String> searchStrings;
    private List<String> searchOpers;

//    public void setCompanyService(CompanyService companyService) {
//        this.companyService = companyService;
//    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    @Override
    public String execute() throws Exception {
//        company = companyService.getById(getUser().getCompanyId());

        searchFields = new ArrayList<String>();
        searchOpers = new ArrayList<String>();
        searchStrings = new ArrayList<String>();
        searchFields.add("companyId");
        searchOpers.add("eq");
        searchStrings.add("" + getUser().getCompanyId());
        searchFields.add("vendorId");
        searchOpers.add("eq");
        searchStrings.add("" + vendorId);


        List<Vendor> vendorsList = vendorService.getBy(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers), "", "'", 10, 1);
        
        if(vendorsList.size()>0)
        {
            vendor = vendorsList.get(0);
            vendorService.delete(vendor);
            message = "Vendor removed sucessfully";
        } 

        return SUCCESS;
    }

    public Vendor getVendor() {
        return vendor;
    }

    public String getMessage() {
        return message;
    }

    public String getJsonString() {
        return message;
    }

    private String[] getStringArray(List<String> list) {
        return list.toArray(new String[list.size()]);
    }
}
