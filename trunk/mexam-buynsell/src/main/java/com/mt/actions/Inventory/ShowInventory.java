package com.mt.actions.Inventory;

import com.google.gson.GsonBuilder;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Inventory;
import com.mt.hibernate.entities.LookUp;
import com.mt.services.CompanyService;
import com.mt.services.LookUpService;
import java.util.List;

public class ShowInventory extends AuthenticatedAction {

    private String inventoryJson;
    private List<Inventory> inventorys;
    private CompanyService companyService;
    private List<LookUp> inventoryCondition;
    private LookUpService lookUpService;
    private String conditionJson;

    public void setLookUpService(LookUpService lookUpService) {
        this.lookUpService = lookUpService;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    @Override
    public String execute() throws Exception {
        //Company company = companyService.getById(getUser().getCompanyId());
       // inventorys = company.getInventorys();
        //inventoryJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(inventorys);
        inventoryCondition = lookUpService.findByName("INVENTORY_CONDITION");
        conditionJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(inventoryCondition);
        return SUCCESS;
    }

    public String getConditionJson() {
        return conditionJson;
    }

    public String getInventoryJson() {
        return inventoryJson;
    }
}
