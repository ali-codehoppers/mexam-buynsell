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

public class GetRFQsReceived extends AuthenticatedAction {

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

        Company company = companyService.getById(getUser().getCompanyId());
        rFQExtendeds = new ArrayList<RFQExtended>();
        if (searchField == null) {
            searchField = "name";
            searchOper = "=";
            searchString = "name";
        }

        rfqs = rFQService.findByReceiver(company.getId());
        for (RFQ rfq : rfqs) 
        {
            rFQExtendeds.add(new RFQExtended(rfq));
        }

        RecordsJson<RFQExtended> recordsJson = new RecordsJson<RFQExtended>(page, rows, rFQExtendeds);
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(recordsJson);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }

    private class RFQExtended extends RFQ {
        @Expose
        private String senderName;
        @Expose
        private String senderCompanyName;
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
                this.date = this.getUpdateDate().toString();
            } else {
                this.date = this.getCreationDate().toString();
            }
            this.senderName = rfq.getSender().getFirstName();
            this.senderCompanyName = rfq.getSender().getCompany().getName();
        }
    }
}
