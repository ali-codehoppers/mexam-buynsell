package com.mt.actions.vendor;

import com.google.gson.GsonBuilder;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.State;
import com.mt.services.CompanyService;
import java.util.ArrayList;
import java.util.List;

public class ShowVendor extends AuthenticatedAction {

    private String vendorJson;
    private List<Company> allVendors;
    private List<Company> vendors;    
//    private VendorService vendorService;
    private CompanyService companyService;

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

  
    @Override
    public String execute() throws Exception {
        Company myCompany = companyService.getById(getUser().getCompanyId());
        allVendors = companyService.getAll();
        vendors = new ArrayList<Company>();
        for(Company company:allVendors)
        {
            State state = company.getState();
            if(company.getId()!=myCompany.getId())
            {
                vendors.add(company);
            }
        }
        vendorJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(vendors);
        return SUCCESS;
    }

    public String getVendorJson() {
        return vendorJson;
    }


}
