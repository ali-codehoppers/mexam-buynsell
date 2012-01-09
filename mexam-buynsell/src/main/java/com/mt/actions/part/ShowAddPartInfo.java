package com.mt.actions.part;

import com.google.gson.GsonBuilder;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.LookUp;
import com.mt.services.LookUpService;
import java.util.List;

public class ShowAddPartInfo extends AuthenticatedAction {

    private String subCategoryId;
    private List<LookUp> inventoryCondition;
    private LookUpService lookUpService;
    private String conditionJson;

    public void setSubCategoryId(String subCategoryId) {
        this.subCategoryId = subCategoryId;
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

    public String getSubCategoryId() {
        return subCategoryId;
    }

    public List<LookUp> getInventoryCondition() {
        return inventoryCondition;
    }

    public String getConditionJson() {
        return conditionJson;
    }
}
