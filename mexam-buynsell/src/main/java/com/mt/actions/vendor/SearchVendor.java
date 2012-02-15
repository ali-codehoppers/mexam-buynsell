/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.vendor;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Vendor;
import com.mt.services.CompanyService;
import com.mt.services.VendorService;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class SearchVendor extends AuthenticatedAction {

    private String searchString;
    private List<Company> companys;
    private String searchResultJson;
    private CompanyService companyService;
    private List<CompanyExtended> companyExtendeds;
    private Company myCompany;
    private HashMap<Integer, Vendor> vendorMap;
    private VendorService vendorService;
    private List<String> searchFields;
    private List<String> searchStrings;
    private List<String> searchOpers;

    public void setSearchString(String searchString) {
        this.searchString = searchString;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setCompanys(List<Company> companys) {
        this.companys = companys;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    @Override
    public String execute() throws Exception {
        vendorMap = new HashMap<Integer, Vendor>();

        searchFields = new ArrayList<String>();
        searchOpers = new ArrayList<String>();
        searchStrings = new ArrayList<String>();
        searchFields.add("companyId");
        searchOpers.add("eq");
        searchStrings.add("" + getUser().getCompanyId());

        companys = companyService.findBySearchString(searchString);

        

        if (companys.size() > 0) {
            List<Vendor> vendorsList = vendorService.getBy(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers), "", "'", 10, 1);
            //List<Vendor> vendorsList = myCompany.getVendors();
            if (vendorsList != null) {
                for (int i = 0; i < vendorsList.size(); i++) {
                    vendorMap.put(vendorsList.get(i).getVendorId(), vendorsList.get(i));
                }
            }
        }

        companyExtendeds = new ArrayList<CompanyExtended>();
        for (Company company : companys) {
            CompanyExtended companyExtended = new CompanyExtended(company);
            companyExtendeds.add(companyExtended);
        }

        searchResultJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(companyExtendeds);
        return SUCCESS;
    }

    public String getSearchResultJson() {
        return searchResultJson;
    }

    private class CompanyExtended extends Company {

        @Expose
        private String date;
        @Expose
        private String stateString;
        @Expose
        private String countryString;
        @Expose
        private boolean alreadyAdded = false;

        public CompanyExtended(Company company) {
            this.setId(company.getId());
            this.setName(company.getName());
            this.setAddress(company.getAddress());
            this.setCity(company.getCity());
            this.setStateId(company.getStateId());
            this.setState(company.getState());
            this.setZip(company.getZip());
            this.setPhoneNo(company.getPhoneNo());
            this.setFaxNo(company.getFaxNo());
            this.setWebAddress(company.getWebAddress());
            this.setCreationDate(company.getCreationDate());
            this.setUpdateDate(company.getUpdateDate());

            SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
            if (this.getCreationDate() != null && this.getCreationDate().toString().length() > 0) {
                this.date = df.format(this.getCreationDate());
            }

            this.stateString = company.getState().getName();
            this.countryString = company.getState().getCountry().getName();

            if (vendorMap.containsKey(company.getId())) {
                alreadyAdded = true;
            }

        }
    }

    private String[] getStringArray(List<String> list) {
        return list.toArray(new String[list.size()]);
    }
}
