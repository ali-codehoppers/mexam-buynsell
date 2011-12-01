package com.mt.actions.Inventory;

import com.google.gson.GsonBuilder;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Inventory;
import com.mt.services.CompanyService;
import com.mt.services.InventoryService;
import java.util.List;

public class ShowInventory extends AuthenticatedAction {

    private String inventoryJson;
    private List<Inventory> inventorys;
    private InventoryService inventoryService;
    private CompanyService companyService;

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setInventoryService(InventoryService inventoryService) {
        this.inventoryService = inventoryService;
    }

    @Override
    public String execute() throws Exception {
        Company company = companyService.getById(getUser().getCompanyId());
        inventorys = company.getInventorys();
        inventoryJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(inventorys);
        return SUCCESS;
    }

    public String getInventoryJson() {
        return inventoryJson;
    }
}
