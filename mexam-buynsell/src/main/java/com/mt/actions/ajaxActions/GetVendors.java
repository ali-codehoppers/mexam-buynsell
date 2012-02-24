/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.services.CompanyService;
import com.mt.util.RecordsJson;
import java.util.ArrayList;
import java.util.List;

public class GetVendors extends AuthenticatedAction {

    private List<Company> allVendors;
    private List<Company> vendors;
    private CompanyService companyService;
    private String jsonString = "";
    private int rows = 0;
    private int page = 0;
    private String sidx;
    private String sord;
    private String searchField;
    private String searchString;
    private String searchOper;
    private List<String> searchFields;
    private List<String> searchStrings;
    private List<String> searchOpers;

    public void setRows(int rows) {
        this.rows = rows;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public void setSord(String sord) {
        this.sord = sord;
    }

    public void setSearchField(String searchField) {
        this.searchField = searchField;
    }

    public void setSearchOper(String searchOper) {
        this.searchOper = searchOper;
    }

    public void setSearchString(String searchString) {
        this.searchString = searchString;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    @Override
    public String execute() throws Exception {
        Company myCompany = companyService.getById(getUser().getCompanyId());

        searchFields = new ArrayList<String>();
        searchOpers = new ArrayList<String>();
        searchStrings = new ArrayList<String>();

        searchFields.add(searchField);
        searchOpers.add(searchOper);
        if (searchOper!=null &&  searchOper.equals("cn")) {
            searchStrings.add("'%" + searchString + "%'");
        } else {
            searchStrings.add("'" + searchString + "'");
        }

        searchFields.add("id");
        searchOpers.add("ne");
        searchStrings.add("" + myCompany.getId());


        allVendors = companyService.getBy(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers), sidx, sord, rows, page);
        long total = companyService.getRecordsCount(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers));

//        vendors = new ArrayList<Company>();
//        for (Company company : allVendors) {
//            State state = company.getState();
//            if (company.getId() != myCompany.getId()) {
//                vendors.add(company);
//            }
//        }
        RecordsJson<Company> recordsJson = new RecordsJson<Company>(page, rows, total, allVendors);
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(recordsJson);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }

    private String[] getStringArray(List<String> list) {
        return list.toArray(new String[list.size()]);
    }
    
}
