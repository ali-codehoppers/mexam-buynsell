package com.mt.actions.broadcast;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Broadcast;
import com.mt.hibernate.entities.Company;
import com.mt.services.BroadcastService;
import com.mt.services.CompanyService;
import java.util.ArrayList;
import java.util.List;

public class ShowBroadcasts extends AuthenticatedAction {

    private String broadcastJson;
    private String companyJson;
    private List<Broadcast> broadcasts;
    private List<BroadcastExtended> broadcastsExt;
    private CompanyService companyService;
    private BroadcastService broadcastService;    
    private Company company;

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setBroadcastService(BroadcastService broadcastService) {
        this.broadcastService = broadcastService;
    }

    @Override
    public String execute() throws Exception {
//        company = companyService.getById(getUser().getCompanyId());
//        broadcasts = company.getBroadcasts();
        broadcasts = broadcastService.getAll();
        broadcastsExt = new ArrayList<BroadcastExtended>();
        for (Broadcast broadcast : broadcasts) {
            BroadcastExtended broadcastExtended = new BroadcastExtended(broadcast);
            broadcastsExt.add(broadcastExtended);
        }

        broadcastJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(broadcastsExt);
        companyJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(company);
        return SUCCESS;
    }

    public String getBroadcastJson() {
        return broadcastJson;
    }

    public String getCompanyJson() {
        return companyJson;
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
