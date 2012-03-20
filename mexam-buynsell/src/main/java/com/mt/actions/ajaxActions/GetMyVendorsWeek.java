/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.State;
import com.mt.hibernate.entities.Vendor;
import com.mt.services.CompanyService;
import com.mt.services.VendorService;
import com.mt.util.RecordsJson;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class GetMyVendorsWeek extends AuthenticatedAction {

    private List<Vendor> vendors;
    private List<VendorExtended> vendorsExtended;
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
    private VendorService vendorService;

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

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    @Override
    public String execute() throws Exception {

        Company company = companyService.getById(getUser().getCompanyId());
//        vendors = vendorService.findByCompany(company.getId());
//        vendorsExtended = new ArrayList<VendorExtended>();
//        for (Vendor vendor : vendors) {
//            VendorExtended vendorExtended = new VendorExtended(vendor);
//            vendorsExtended.add(vendorExtended);
//        }


//        String str = "0 order by "+sidx+" "+sord+" limit "+page*rows+","+page;

        //companyService.findByQuery("1 order by " + sidx + " " + sord + " limit " + page * rows + "," + page);
        //allVendors = companyService.getAll();

        //allVendors = companyService.getBy(searchField, searchString, searchOper, sidx, sord);

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
        Calendar currentDate = Calendar.getInstance();
        currentDate.add(Calendar.DATE, -7);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateNow = formatter.format(currentDate.getTime());
        searchFields.add("companyId");
        searchOpers.add("eq");
        searchStrings.add("" + company.getId());
        searchFields.add("creationDate");
        searchOpers.add("gt");
        searchStrings.add("'" + dateNow + "'");


        vendors = vendorService.getBy(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers), sidx, sord, rows, page);
        long total = vendorService.getRecordsCount(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers));
        //allVendors = companyService.getAll();
        vendorsExtended = new ArrayList<VendorExtended>();
        for (Vendor vendor : vendors) {
            VendorExtended vendorExtended = new VendorExtended(vendor);
            vendorsExtended.add(vendorExtended);
        }

        RecordsJson<VendorExtended> recordsJson = new RecordsJson<VendorExtended>(page, rows, total, vendorsExtended);
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(recordsJson);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }

    private String[] getStringArray(List<String> list) {
        return list.toArray(new String[list.size()]);
    }

    private class VendorExtended extends Vendor {

        @Expose
        private String vendorName;

        public VendorExtended(Vendor vendor) {
            this.setId(vendor.getId());
            this.setCompanyId(vendor.getCompanyId());
            this.setNotes(vendor.getNotes());
            this.setPriority(vendor.getPriority());
            this.vendorName = vendor.getVendor().getName();
        }

        public String getVendorName() {
            return vendorName;
        }
    }
}
