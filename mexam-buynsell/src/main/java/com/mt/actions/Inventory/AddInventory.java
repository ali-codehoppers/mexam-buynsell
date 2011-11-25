/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Inventory;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Inventory;
import com.mt.services.CompanyService;
import com.mt.services.InventoryService;
import java.sql.Timestamp;

public class AddInventory extends AuthenticatedAction {

    private String message;
    private Inventory inventory;
    private String partNo;
    private String manufacturer;
    private String condition;
    private double price;
    private String description;
    private String quantity;
    
    private InventoryService inventoryService;
    private CompanyService companyService;

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setInventory(Inventory inventory) {
        this.inventory = inventory;
    }

    public void setInventoryService(InventoryService inventoryService) {
        this.inventoryService = inventoryService;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public void setPartNo(String partNo) {
        this.partNo = partNo;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }


    @Override
    public String execute() throws Exception {

        Company company = companyService.getById(getUser().getCompanyId());

        inventory = new Inventory();
        inventory.setPartNo(partNo);
        inventory.setDescription(description);
        inventory.setPrice(price);
        inventory.setQuantity(Integer.parseInt(quantity));
        inventory.setCond(condition);
        inventory.setManufacturer(manufacturer);
        inventory.setCompany(company);
        inventory.setCreationDate(new Timestamp(System.currentTimeMillis()));
        inventory.setCreatedBy(getUser().getId());
        inventory.setUpdatedBy(getUser().getId());        
        inventoryService.addNew(inventory);

        message = "Inventory added sucessfully";
        return SUCCESS;
    }

    public Inventory getInventory() {
        return inventory;
    }

    public String getMessage() {
        return message;
    }
}
