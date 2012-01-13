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
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class AddInventory extends AuthenticatedAction implements SessionAware {

    private String message;
    private String error;
    private String info;
    private Inventory inventory;
    private String partNo;
    private String manufacturer;
    private String condition;
    private double price;
    private String description;
    private int quantity = 0;
    private InventoryService inventoryService;
    private CompanyService companyService;
    private Map session;

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

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setSession(Map map) {
        this.session = map;
    }

    @Override
    public void validate() {
        if (quantity < 0) {
            addFieldError("quantity", "Quantity must be greater than or equal to zero.");
        }
        if (partNo == null || partNo.length() < 1) {
            addFieldError("partNo", "Part Number is missing.");
        }
        if (manufacturer == null || manufacturer.length() < 1) {
            addFieldError("manufacturer", "Manufacturer is missing.");
        }
        if (condition == null || condition.length() < 1) {
            addFieldError("condition", "Please specify inventory condition.");
        }
        if (price < 0) {
            addFieldError("price", "Price can't be less than 0.");
        }

        
        
    }

    @Override
    public String execute() throws Exception {

        Company company = companyService.getById(getUser().getCompanyId());

        inventory = new Inventory();
        inventory.setPartNo(partNo);
        inventory.setDescription(description);
        inventory.setPrice(price);
        inventory.setQuantity(quantity);
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

    public String getError() {
        return error;
    }

    public String getInfo() {
        return info;
    }
}
