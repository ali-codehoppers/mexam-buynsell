/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Inventory;
import com.mt.services.CompanyService;
import com.mt.services.InventoryService;
import java.sql.Timestamp;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;


/**
 *
 * @author Muaz
 */
public class UpdateInventoryItem extends AuthenticatedAction implements SessionAware {

    /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
    private int id;
    private Inventory inventory;
    private String partNo;
    private String manufacturer;
    private String condition;
    private double price;
    private String description;
    private Integer quantity = 0;
    private InventoryService inventoryService;
    private CompanyService companyService;
    private Map session;

    public void setId(int id) {
        this.id = id;
    }

  
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

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setSession(Map session) {
        this.session = session;
    }
    
    
    @Override
    public String execute() throws Exception {

        boolean valid = true;
        if(id < 1){
            return SUCCESS;
        }
        if (quantity == null || quantity < 1) {
            session.put("updateInventory_quantity", "Quantity must be greater than zero.");
            valid = false;
        }
        if (partNo == null || partNo.length() < 1) {
            session.put("updateInventory_partNo", "Part Number is missing.");
            valid = false;
        }
        if (manufacturer == null || manufacturer.length() < 1) {
            session.put("updateInventory_manufacturer", "Manufacturer is missing.");
            valid = false;
        }
        if (condition == null || condition.length() < 1) {
            session.put("updateInventory_condition", "Please specify inventory condition.");
            valid = false;
        }
        if (price <= 0) {
            session.put("updateInventory_price", "Price must be greater than zero.");
            valid = false;
        }

        if (!valid) 
        {
            session.put("hasError", true);
            session.put("errorRecordId", id);
            return INPUT;
        }


        Company company = companyService.getById(getUser().getCompanyId());
        
        inventory = new Inventory();
        inventory.setId(id);
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
        inventoryService.update(inventory);
        return SUCCESS;
    }

    public String getCondition() {
        return condition;
    }

    public String getDescription() {
        return description;
    }

    public int getId() {
        return id;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public String getPartNo() {
        return partNo;
    }

    public double getPrice() {
        return price;
    }

    public Integer getQuantity() {
        return quantity;
    }
    

}


