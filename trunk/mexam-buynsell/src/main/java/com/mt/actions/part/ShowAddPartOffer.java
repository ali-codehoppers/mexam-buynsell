package com.mt.actions.part;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.LookUp;
import com.mt.services.LookUpService;
import java.util.List;

public class ShowAddPartOffer extends AuthenticatedAction {

    private String subCatId;
    private List<LookUp> inventoryCondition;
    private LookUpService lookUpService;

    public void setSubCatId(String subCatId) {
        this.subCatId = subCatId;
    }

    public void setLookUpService(LookUpService lookUpService) {
        this.lookUpService = lookUpService;
    }

    @Override
    public String execute() throws Exception {
        inventoryCondition = lookUpService.findByName("INVENTORY_CONDITION");
        return SUCCESS;
    }

    public String getSubCatId() {
        return subCatId;
    }

    public List<LookUp> getInventoryCondition() {
        return inventoryCondition;
    }
}
