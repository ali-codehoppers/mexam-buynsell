package com.mt.actions.broadcast;

import com.google.gson.GsonBuilder;
import com.mt.hibernate.entities.LookUp;
import com.mt.services.LookUpService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

public class ShowAddBroadcast extends ActionSupport {

    private String message;
    private String error = "";
    private String info;
    private List<LookUp> inventoryCondition;
    private String conditionJson;
    private List<LookUp> broadcastType;
    private LookUpService lookUpService;

    public void setLookUpService(LookUpService lookUpService) {
        this.lookUpService = lookUpService;
    }

    @Override
    public String execute() throws Exception {
        inventoryCondition = lookUpService.findByName("INVENTORY_CONDITION");
        conditionJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(inventoryCondition);
        broadcastType = lookUpService.findByName("BROADCAST_TYPE");
        return SUCCESS;
    }

    public List<LookUp> getInventoryCondition() {
        return inventoryCondition;
    }

    public List<LookUp> getBroadcastType() {
        return broadcastType;
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
