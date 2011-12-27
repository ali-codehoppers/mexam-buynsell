/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.State;
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

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    @Override
    public String execute() throws Exception {
        Company myCompany = companyService.getById(getUser().getCompanyId());

//        String str = "0 order by "+sidx+" "+sord+" limit "+page*rows+","+page;

        //companyService.findByQuery("1 order by " + sidx + " " + sord + " limit " + page * rows + "," + page);
        //allVendors = companyService.getAll();
        if(searchField==null)
        {
            searchField="name";
            searchOper="=";
            searchString="name";            
        }
        
        allVendors = companyService.getBy(searchField, searchString, searchOper, sidx, sord);
        vendors = new ArrayList<Company>();
        for (Company company : allVendors) {
            State state = company.getState();
            if (company.getId() != myCompany.getId()) {
                vendors.add(company);
            }
        }
        RecordsJson<Company> recordsJson = new RecordsJson<Company>(page, rows, vendors);
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(recordsJson);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }
}
