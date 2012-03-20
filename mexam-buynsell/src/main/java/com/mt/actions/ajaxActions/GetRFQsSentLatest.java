/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.RFQ;
import com.mt.services.CompanyService;
import com.mt.services.RFQService;
import com.mt.util.RecordsJson;
import java.util.ArrayList;
import java.util.List;

public class GetRFQsSentLatest extends AuthenticatedAction {

    private List<RFQ> rfqs;
    private CompanyService companyService;
    private RFQService rFQService;
    private List<RFQExtended> rFQExtendeds;
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

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setrFQService(RFQService rFQService) {
        this.rFQService = rFQService;
    }

    @Override
    public String execute() throws Exception {

        searchFields = new ArrayList<String>();
        searchOpers = new ArrayList<String>();
        searchStrings = new ArrayList<String>();

        Company company = companyService.getById(getUser().getCompanyId());

        searchFields.add(searchField);
        searchOpers.add(searchOper);
        if (searchOper != null && searchOper.equals("cn")) {
            searchStrings.add("'%" + searchString + "%'");
        } else {
            searchStrings.add("'" + searchString + "'");
        }

        searchFields.add("senderId");
        searchOpers.add("eq");
        searchStrings.add("" + company.getId());
        searchFields.add("isReplied");
        searchOpers.add("eq");
        searchStrings.add("1");

        rFQExtendeds = new ArrayList<RFQExtended>();
//        if (searchField == null) {
//            searchField = "name";
//            searchOper = "=";
//            searchString = "name";
//        }

        //rfqs = rFQService.findBySender(getUser().getId());
        rfqs = rFQService.getBy(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers), sidx, sord, rows, page);
        long total = rFQService.getRecordsCount(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers));

        for (RFQ rfq : rfqs) {
            rFQExtendeds.add(new RFQExtended(rfq));
        }

        RecordsJson<RFQExtended> recordsJson = new RecordsJson<RFQExtended>(page, rows, total, rFQExtendeds);
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(recordsJson);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }

    private class RFQExtended extends RFQ {

        @Expose
        private String receiverCompanyName;
        @Expose
        private String date;

        public RFQExtended(RFQ rfq) {
            this.setId(rfq.getId());
            this.setIsNew(rfq.isIsNew());
            this.setIsReplied(rfq.isIsReplied());
            this.setReceiverId(rfq.getReceiverId());
            this.setReceiver(rfq.getReceiver());
            this.setSenderId(rfq.getSenderId());
            this.setSender(rfq.getSender());
            this.setTitle(rfq.getTitle());
            this.setMessage(rfq.getMessage());
            this.setCreatedBy(rfq.getCreatedBy());
            this.setUpdatedBy(rfq.getUpdatedBy());
            this.setCreationDate(rfq.getCreationDate());
            if (this.getUpdateDate() != null && this.getUpdateDate().toString().length() > 0) {
                this.date = this.getCreationDate().toString();
            } else {
                this.date = this.getCreationDate().toString();
            }
            this.receiverCompanyName = rfq.getReceiver().getName();
        }
    }

    protected String[] getStringArray(List<String> list) {
        return list.toArray(new String[list.size()]);
    }
}
