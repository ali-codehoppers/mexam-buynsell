package com.mt.actions.vendor;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Broadcast;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Vendor;
import com.mt.services.CompanyService;
import com.mt.services.VendorService;
import java.util.ArrayList;
import java.util.List;

public class ShowMyVendor extends AuthenticatedAction {

    private String vendorJson;
    private List<Vendor> vendors;
    private List<VendorExtended> vendorsExtended;    
    private VendorService vendorService;
    private CompanyService companyService;

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    @Override
    public String execute() throws Exception {
        Company company = companyService.getById(getUser().getCompanyId());
        vendors = vendorService.findByCompany(company.getId());

        vendorsExtended = new ArrayList<VendorExtended>();
        for (Vendor vendor : vendors) {
            VendorExtended vendorExtended = new VendorExtended(vendor);
            vendorsExtended.add(vendorExtended);
        }

        vendorJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(vendorsExtended);
        return SUCCESS;
    }

    public String getVendorJson() {
        return vendorJson;
    }

    private class VendorExtended extends Vendor {

        @Expose
        private String vendorName;

        public VendorExtended(Vendor vendor) {
            this.setId(vendor.getId());
            this.setCompanyId(vendor.getCompanyId());
            this.setNotes(vendor.getNotes());
            this.setPriority(vendor.getPriority());
            this.setCompanyId(vendor.getCompanyId());
            this.vendorName = vendor.getVendor().getName();

        }

        public String getVendorName() {
            return vendorName;
        }
    }
}
