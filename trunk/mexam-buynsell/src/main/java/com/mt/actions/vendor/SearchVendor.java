/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.vendor;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Vendor;
import com.mt.services.CompanyService;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class SearchVendor extends ActionSupport {

    private String searchString;
    private List<Company> companys;
    private String searchResultJson;
    private CompanyService companyService;
    private List<CompanyExtended> companyExtendeds;

    public void setSearchString(String searchString) {
        this.searchString = searchString;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setCompanys(List<Company> companys) {
        this.companys = companys;
    }

    @Override
    public String execute() throws Exception {
        companys = companyService.findBySearchString(searchString);

        companyExtendeds = new ArrayList<CompanyExtended>();
        for (Company company:companys) {
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
            SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
            if (this.getCreationDate() != null && this.getCreationDate().toString().length() > 0) {
                this.date = df.format(this.getCreationDate());
            }
            this.stateString = company.getState().getName();
            this.countryString = company.getState().getCountry().getName();

        }
    }
}
