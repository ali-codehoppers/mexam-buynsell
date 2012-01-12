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
import java.util.List;

public class SearchVendor extends ActionSupport {

    private String searchString;
    private List<Company> companys;
    private String searchResultJson;
    private CompanyService companyService;

    public void setSearchString(String searchString) {
        this.searchString = searchString;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    @Override
    public String execute() throws Exception {
        companys = companyService.findBySearchString(searchString);
        searchResultJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(companys);
        return SUCCESS;
    }

    public String getSearchResultJson() {
        return searchResultJson;
    }

    public void setCompanys(List<Company> companys) {
        this.companys = companys;
    }

    
}
