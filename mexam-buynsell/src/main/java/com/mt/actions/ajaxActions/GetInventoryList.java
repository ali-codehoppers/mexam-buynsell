/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Inventory;
import com.mt.services.CompanyService;
import com.mt.services.InventoryService;
import com.mt.util.RecordsJson;
import java.util.ArrayList;
import java.util.List;

public class GetInventoryList extends AuthenticatedAction {

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
    private String jsonString = "";
    private List<Inventory> inventorys;
    private CompanyService companyService;
    private InventoryService inventoryService;

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

    public void setInventoryService(InventoryService inventoryService) {
        this.inventoryService = inventoryService;
    }

    @Override
    public String execute() throws Exception {

        searchFields = new ArrayList<String>();
        searchOpers = new ArrayList<String>();
        searchStrings = new ArrayList<String>();

        Company myCompany = companyService.getById(getUser().getCompanyId());

        searchFields.add(searchField);
        searchOpers.add(searchOper);
        if (searchOper != null && searchOper.equals("cn")) {
            searchStrings.add("'%" + searchString + "%'");
        } else {
            searchStrings.add("'" + searchString + "'");
        }

        searchFields.add("companyId");
        searchOpers.add("eq");
        searchStrings.add("" + myCompany.getId());

        inventorys = inventoryService.getBy(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers), sidx, sord, rows, page);
        long total = inventoryService.getRecordsCount(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers));


        RecordsJson<Inventory> recordsJson = new RecordsJson<Inventory>(page, rows, total, inventorys);
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(recordsJson);

        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }

    protected String[] getStringArray(List<String> list) {
        return list.toArray(new String[list.size()]);
    }
}
