package com.mt.actions.broadcast;

import com.mt.actions.Inventory.*;
import com.mt.hibernate.entities.LookUp;
import com.mt.services.LookUpService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

public class ShowAddBroadcast extends ActionSupport {

    private List<LookUp> inventoryCondition;
    private List<LookUp> broadcastType;
    private LookUpService lookUpService;

    public void setLookUpService(LookUpService lookUpService) {
        this.lookUpService = lookUpService;
    }

    @Override
    public String execute() throws Exception {
        inventoryCondition = lookUpService.findByName("INVENTORY_CONDITION");
        broadcastType = lookUpService.findByName("BROADCAST_TYPE");
        return SUCCESS;
    }

    public List<LookUp> getInventoryCondition() {
        return inventoryCondition;
    }

    public List<LookUp> getBroadcastType() {
        return broadcastType;
    }

    
    
}
