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
import com.mt.hibernate.entities.RFQItem;
import com.mt.services.CompanyService;
import com.mt.services.RFQItemService;
import com.mt.services.RFQService;
import com.mt.util.RecordsJson;
import java.util.ArrayList;
import java.util.List;

public class GetRFQItemsList extends AuthenticatedAction {

    private int rfqId;
    private RFQ rfq;
    private CompanyService companyService;
    private RFQService rFQService;
    private List<RFQItemExtended> rFQItemExtendeds;
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
    private RFQItemService rFQItemService;
    private List<RFQItem> rFQItems;

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

    public void setrFQService(RFQService rFQService) {
        this.rFQService = rFQService;
    }

    public void setrFQItemService(RFQItemService rFQItemService) {
        this.rFQItemService = rFQItemService;
    }

    public void setRfqId(int rfqId) {
        this.rfqId = rfqId;
    }

    @Override
    public String execute() throws Exception {

        searchFields = new ArrayList<String>();
        searchOpers = new ArrayList<String>();
        searchStrings = new ArrayList<String>();

        Company company = companyService.getById(getUser().getCompanyId());
        rFQItemExtendeds = new ArrayList<RFQItemExtended>();

        searchFields.add(searchField);
        searchOpers.add(searchOper);
        if (searchOper != null && searchOper.equals("cn")) {
            searchStrings.add("'%" + searchString + "%'");
        } else {
            searchStrings.add("'" + searchString + "'");
        }

        searchFields.add("rfqId");
        searchOpers.add("eq");
        searchStrings.add("" + rfqId);

        rfq = rFQService.getById(rfqId);

        rFQItems = rFQItemService.getBy(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers), sidx, sord, rows, page);
        long total = rFQItemService.getRecordsCount(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers));


        //rfq = rFQService.getById(rfqId);
        if (rfq != null) {
            for (RFQItem item : rFQItems) {
                RFQItemExtended itemEx = new RFQItemExtended(item);
                rFQItemExtendeds.add(itemEx);
            }
        }

        RecordsJson<RFQItemExtended> recordsJson = new RecordsJson<RFQItemExtended>(page, rows, total,  rFQItemExtendeds);
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
            this.date = this.getCreationDate().toString();
            this.senderName = rfq.getSender().getFirstName();
            this.senderCompanyName = rfq.getSender().getCompany().getName();

        }
    }

    private class RFQItemExtended extends RFQItem {

        @Expose
        private String partNo;
        @Expose
        private String manufacturer;

        public RFQItemExtended(RFQItem item) {
            this.setId(item.getId());
            this.setRfqId(item.getRfqId());
            this.setRfq(item.getRfq());
            this.setInventoryId(item.getInventoryId());
            this.setInventory(item.getInventory());
            this.setQuantity(item.getQuantity());
            this.setPrice(item.getPrice());
            this.partNo = this.getInventory().getPartNo();
            this.manufacturer = this.getInventory().getManufacturer();
        }
    }

    protected String[] getStringArray(List<String> list) {
        return list.toArray(new String[list.size()]);
    }
}
