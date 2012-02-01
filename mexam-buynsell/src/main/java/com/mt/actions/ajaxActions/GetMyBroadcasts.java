/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Broadcast;
import com.mt.hibernate.entities.Company;
import com.mt.services.BroadcastService;
import com.mt.services.CompanyService;
import com.mt.util.RecordsJson;
import java.util.ArrayList;
import java.util.List;

public class GetMyBroadcasts extends AuthenticatedAction {

    private List<Broadcast> broadcasts;
    private List<BroadcastExtended> broadcastsExt;
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
    private CompanyService companyService;
    private BroadcastService broadcastService;

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

    public void setBroadcastService(BroadcastService broadcastService) {
        this.broadcastService = broadcastService;
    }

    @Override
    public String execute() throws Exception {

        Company company = companyService.getById(getUser().getCompanyId());

        searchFields = new ArrayList<String>();
        searchOpers = new ArrayList<String>();
        searchStrings = new ArrayList<String>();

        searchFields.add(searchField);
        searchOpers.add(searchOper);
        if (searchOper != null && searchOper.equals("cn")) {
            searchStrings.add("'%" + searchString + "%'");
        } else {
            searchStrings.add("'" + searchString + "'");
        }

        searchFields.add("companyId");
        searchOpers.add("eq");
        searchStrings.add("" + company.getId());


        broadcasts = broadcastService.getBy(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers), sidx, sord, rows, page);
        long total = broadcastService.getRecordsCount(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers));
        broadcastsExt = new ArrayList<BroadcastExtended>();
        for (Broadcast broadcast : broadcasts) {
            BroadcastExtended broadcastExtended = new BroadcastExtended(broadcast);
            broadcastsExt.add(broadcastExtended);
        }

        RecordsJson<BroadcastExtended> recordsJson = new RecordsJson<BroadcastExtended>(page, rows, total, broadcastsExt);
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(recordsJson);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }

    private String[] getStringArray(List<String> list) {
        return list.toArray(new String[list.size()]);
    }

    private class BroadcastExtended extends Broadcast {

        @Expose
        private String countryString;
        @Expose
        private String companyString;

        public BroadcastExtended() {
            this.countryString = super.getCountry().getName();
            this.companyString = super.getCompany().getName();
        }

        public BroadcastExtended(Broadcast broadcast) {
            this.setId(broadcast.getId());
            this.setCompanyId(broadcast.getCompanyId());
            this.setCompany(broadcast.getCompany());
            this.setCountryId(broadcast.getCountryId());
            this.setCountry(broadcast.getCountry());
            this.setBroadcastType(broadcast.getBroadcastType());
            this.setPartNo(broadcast.getPartNo());
            this.setManufacturer(broadcast.getManufacturer());
            this.setManufacturer(broadcast.getManufacturer());
            this.setCond(broadcast.getCond());
            this.setPrice(broadcast.getPrice());
            this.setQuantity(broadcast.getQuantity());
            this.setSubject(broadcast.getSubject());
            this.setMessage(broadcast.getMessage());
            this.setDescription(broadcast.getDescription());
            this.setSubCategoryId(broadcast.getSubCategoryId());
            this.setSubCategory(broadcast.getSubCategory());
            this.setCreationDate(broadcast.getCreationDate());
            this.countryString = super.getCountry().getName();
            this.companyString = super.getCompany().getName();

        }

        public String getCompanyString() {
            return companyString;
        }

        public String getCountryString() {
            return countryString;
        }
    }
}
