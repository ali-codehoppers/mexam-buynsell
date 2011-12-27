package com.mt.actions.rfq;

import com.google.gson.GsonBuilder;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.RFQ;
import com.mt.services.RFQService;

public class ShowRFQ extends AuthenticatedAction {

    private String rfqJson;
    private RFQ rfq;
    private int rfqId;
    private RFQService rFQService;

    public void setrFQService(RFQService rFQService) {
        this.rFQService = rFQService;
    }

    public void setRfqId(int rfqId) {
        this.rfqId = rfqId;
    }

    @Override
    public String execute() throws Exception {
//        Company company = companyService.getById(getUser().getCompanyId());

        rfq = rFQService.getById(rfqId);

        rfqJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(rfq);
        return SUCCESS;
    }

    public RFQ getRfq() {
        return rfq;
    }

    public String getRfqJson() {
        return rfqJson;
    }
}
