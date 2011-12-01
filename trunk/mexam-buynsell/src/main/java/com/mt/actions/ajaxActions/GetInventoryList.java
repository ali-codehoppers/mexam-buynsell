/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Inventory;
import com.mt.services.CompanyService;
import com.mt.services.InventoryService;
import java.util.List;

/**
 *
 * @author CodeHopper
 */
public class GetInventoryList extends AuthenticatedAction {


    private String jsonString = "";
    private List<Inventory> inventorys;
    private CompanyService companyService;

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    @Override
    public String execute() throws Exception {
        Company company = companyService.getById(getUser().getCompanyId());
        inventorys = company.getInventorys();
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(inventorys);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }

}
