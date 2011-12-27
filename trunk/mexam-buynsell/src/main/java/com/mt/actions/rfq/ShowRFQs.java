package com.mt.actions.rfq;

import com.google.gson.GsonBuilder;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.RFQ;
import com.mt.services.CompanyService;
import com.mt.services.RFQService;
import java.util.List;

public class ShowRFQs extends AuthenticatedAction {

    private String rfqJson;
    private RFQ rfq;
    private CompanyService companyService;
    private RFQService rFQService;

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setrFQService(RFQService rFQService) {
        this.rFQService = rFQService;
    }

    @Override
    public String execute() throws Exception {
        Company company = companyService.getById(getUser().getCompanyId());
        List<RFQ> rfqList = rFQService.findBySender(company.getId());
        rfqJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(rfqList);
        return SUCCESS;
    }

    public String getRfqJson() {
        return rfqJson;
    }
    
    

}
