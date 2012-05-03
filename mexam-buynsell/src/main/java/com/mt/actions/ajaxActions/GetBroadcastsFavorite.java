/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Broadcast;
import com.mt.hibernate.entities.Vendor;
import com.mt.services.BroadcastService;
import com.mt.services.VendorService;
import com.mt.util.RecordsJson;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Muaz
 */
public class GetBroadcastsFavorite extends AuthenticatedAction {

    private BroadcastService broadcastService;
    private VendorService vendorService;
    private List<Broadcast> broadcasts;
    private List<BroadcastExtended> broadcastsExt;
    private String jsonString;
    private int rows = 0;
    private int page = 0;
    private String sidx;
    private String sord;

    public void setBroadcastService(BroadcastService broadcastService) {
        this.broadcastService = broadcastService;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    public void setBroadcasts(List<Broadcast> broadcasts) {
        this.broadcasts = broadcasts;
    }

    public void setBroadcastsExt(List<BroadcastExtended> broadcastsExt) {
        this.broadcastsExt = broadcastsExt;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public void setSord(String sord) {
        this.sord = sord;
    }

    public String execute() throws Exception {

        int companyId = getUser().getCompanyId();
        List<Vendor> vendors = vendorService.findByCompany(companyId);
        String ids = "0";
        for (Vendor vendor : vendors) {
            ids += "," + vendor.getVendorId();
        }

        List<Broadcast> broadcasts = broadcastService.getByIn("companyId", ids, sidx, sord, rows, page);
        long total = broadcastService.getRecordsCountIn("companyId", ids);

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
