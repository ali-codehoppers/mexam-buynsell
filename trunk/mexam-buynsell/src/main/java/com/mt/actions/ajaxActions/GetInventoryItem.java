/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Inventory;
import com.mt.services.InventoryService;

public class GetInventoryItem extends AuthenticatedAction {

    private int itemId;
    private Inventory inventory;
    private InventoryService inventoryService;
    private String jsonString = "";

    public void setInventoryService(InventoryService inventoryService) {
        this.inventoryService = inventoryService;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    
    @Override
    public String execute() throws Exception {
        inventory = inventoryService.getById(itemId);
        
        
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(inventory);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }

}
