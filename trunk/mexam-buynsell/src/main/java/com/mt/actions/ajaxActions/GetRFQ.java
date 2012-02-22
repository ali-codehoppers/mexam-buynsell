/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.RFQ;
import com.mt.services.RFQService;

public class GetRFQ extends AuthenticatedAction {

    private int rfqId;
    private RFQ rfq;
    private RFQService rFQService;
    private String jsonString = "";

    public void setRfqId(int rfqId) {
        this.rfqId = rfqId;
    }


    public void setrFQService(RFQService rFQService) {
        this.rFQService = rFQService;
    }

    @Override
    public String execute() throws Exception {
        rfq = rFQService.getById(rfqId);
        RFQExtended rFQExtended = new RFQExtended(rfq);
        
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(rFQExtended);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }

    private class RFQExtended extends RFQ 
    {
        @Expose
        private String senderName;
        @Expose
        private String senderCompanyName;
        @Expose
        private String date;
        @Expose
        private String sentTo;

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
            this.date = this.getCreationDate().toString();
            this.senderName = rfq.getSender().getFirstName();
            this.senderCompanyName = rfq.getSender().getCompany().getName();
            this.sentTo = rfq.getReceiver().getName();
        }
    }
}
