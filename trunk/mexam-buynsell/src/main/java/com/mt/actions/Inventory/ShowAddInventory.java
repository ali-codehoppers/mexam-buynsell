package com.mt.actions.Inventory;

import com.google.gson.GsonBuilder;
import com.mt.hibernate.entities.LookUp;
import com.mt.services.LookUpService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

public class ShowAddInventory extends ActionSupport {

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

    @Override
    public String execute() throws Exception {

        inventoryCondition = lookUpService.findByName("INVENTORY_CONDITION");
        conditionJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(inventoryCondition);
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
}
