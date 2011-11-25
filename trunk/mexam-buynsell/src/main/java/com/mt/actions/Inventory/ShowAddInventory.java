package com.mt.actions.Inventory;

import com.mt.hibernate.entities.LookUp;
import com.mt.services.LookUpService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

public class ShowAddInventory extends ActionSupport {

    private List<LookUp> inventoryCondition;
    private LookUpService lookUpService;

    public void setLookUpService(LookUpService lookUpService) {
        this.lookUpService = lookUpService;
    }

    @Override
    public String execute() throws Exception {

        inventoryCondition = lookUpService.findByName("INVENTORY_CONDITION");
        return SUCCESS;
    }

    public List<LookUp> getInventoryCondition() {
        return inventoryCondition;
    }

    
    
}
