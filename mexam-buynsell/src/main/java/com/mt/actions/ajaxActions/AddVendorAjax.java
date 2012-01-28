/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Vendor;
import com.mt.services.CompanyService;
import com.mt.services.VendorService;
import java.sql.Timestamp;

public class AddVendorAjax extends AuthenticatedAction {

    private String message;
    private Company company;
    private Vendor vendor;
    private int vendorId;
    private CompanyService companyService;
    private VendorService vendorService;

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    @Override
    public String execute() throws Exception {
        //Company myCompany = companyService.getById(getUser().getCompanyId());
        company = companyService.getById(getUser().getCompanyId());
        Company vendorCompany = companyService.getById(vendorId);

        boolean isFound = false;
        for (Vendor vendorF : company.getVendors()) {
            if (vendorF.getVendorId() == vendorId) {
                isFound = true;
                break;
            }
        }
        if (!isFound) 
        {
            vendor = new Vendor();
            vendor.setCompanyId(company.getId());
            vendor.setCompany(company);
            vendor.setVendor(vendorCompany);
            vendor.setVendorId(vendorId);
            vendor.setNotes("");
            vendor.setCreatedBy(getUser().getId());
            vendor.setUpdatedBy(getUser().getId());
            vendor.setCreationDate(new Timestamp(System.currentTimeMillis()));
            
            vendorService.addNew(vendor);
            message = "Vendor added sucessfully";
        }
        else
        {
            message = "Vendor added sucessfully";
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
}
