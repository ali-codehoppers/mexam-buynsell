package com.mt.actions.Inventory;

import com.google.gson.GsonBuilder;
import com.mt.hibernate.entities.LookUp;
import com.mt.hibernate.entities.Part;
import com.mt.services.LookUpService;
import com.mt.services.PartService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

public class ShowAddInventory extends ActionSupport {

    private int partId = -1;
    private String readOnly = "";
    private String upc_ean;
    private String nsn;
    private String bsin;
    private String manufacturer;
    private String partNo;
    private PartService partService;
    private String message;
    private String error = "";
    private String info;
    private List<LookUp> inventoryCondition;
    private LookUpService lookUpService;
    private String conditionJson;

    public void setError(String error) {
        this.error = error;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setLookUpService(LookUpService lookUpService) {
        this.lookUpService = lookUpService;
    }

    public void setPartId(int partId) {
        this.partId = partId;
    }

    public void setBsin(String bsin) {
        this.bsin = bsin;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }


    public void setNsn(String nsn) {
        this.nsn = nsn;
    }

    public void setPartNo(String partNo) {
        this.partNo = partNo;
    }

    public void setPartService(PartService partService) {
        this.partService = partService;
    }
    public void setUpc_ean(String upc_ean) {
        this.upc_ean = upc_ean;
    }

    public void setReadOnly(String readOnly) {
        this.readOnly = readOnly;
    }

    @Override
    public String execute() throws Exception {

        inventoryCondition = lookUpService.findByName("INVENTORY_CONDITION");
        conditionJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(inventoryCondition);
        if (partId > -1) {
            Part part = partService.getById(partId);
            bsin = part.getBsin();
            nsn = part.getNsn();
            upc_ean = part.getUpc_ean();
            manufacturer = part.getManufacturer();
            partNo = part.getPartNo();
            readOnly = "readOnly='true'";
        }
        
        return SUCCESS;
    }

    public List<LookUp> getInventoryCondition() {
        return inventoryCondition;
    }

    public String getConditionJson() {
        return conditionJson;
    }

    public String getMessage() {
        return message;
    }

    public String getError() {
        return error;
    }

    public String getInfo() {
        return info;
    }

    public String getBsin() {
        return bsin;
    }

    public String getNsn() {
        return nsn;
    }

    public int getPartId() {
        return partId;
    }

    public String getPartNo() {
        return partNo;
    }

    public String getUpc_ean() {
        return upc_ean;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public String getReadOnly() {
        return readOnly;
    }
    
    


}
