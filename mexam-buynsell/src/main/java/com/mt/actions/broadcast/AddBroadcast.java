/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.broadcast;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Broadcast;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.State;
import com.mt.hibernate.entities.SubCategory;
import com.mt.services.BroadcastService;
import com.mt.services.CompanyService;
import com.mt.services.SubCategoryService;
import java.sql.Timestamp;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class AddBroadcast extends AuthenticatedAction implements SessionAware {

    private String message;
    private String partNo;
    private String manufacturer;
    private String condition;
    private double price;
    private String description;
    private Integer quantity;
    private String broadcastType;
    private int subCategoryId;
    private String subject;
    private String broadcastMessage;
    private Broadcast broadcast;
    private CompanyService companyService;
    private BroadcastService broadcastService;
    private SubCategoryService subCategoryService;
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

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public void setPartNo(String partNo) {
        this.partNo = partNo;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public void setBroadcastMessage(String broadcastMessage) {
        this.broadcastMessage = broadcastMessage;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setSubCategoryId(int subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setBroadcastType(String broadcastType) {
        this.broadcastType = broadcastType;
    }

    public void setBroadcastService(BroadcastService broadcastService) {
        this.broadcastService = broadcastService;
    }

    public void setSubCategoryService(SubCategoryService subCategoryService) {
        this.subCategoryService = subCategoryService;
    }

    public void setSession(Map map) {
        this.session = map;
    }

    @Override
    public void validate() {
  
    }

    @Override
    public String execute() throws Exception {

        boolean valid = true;
        if (quantity == null || quantity < 1) {
            session.put("addBroadcast_quantity", "Quantity must be greater than zero.");
            valid = false;
        }
        if (partNo == null || partNo.length() < 1) {
            session.put("addBroadcast_partNo", "Part Number is missing.");
            valid = false;
        }
        if (manufacturer == null || manufacturer.length() < 1) {
            session.put("addBroadcast_manufacturer", "Manufacturer is missing.");
            valid = false;
        }
        if (condition == null || condition.length() < 1) {
            session.put("addBroadcast_condition", "Inventory condition is missing.");
            valid = false;
        }
        if (price <= 0) {
            session.put("addBroadcast_price", "Price must be greater than zero.");
            valid = false;
        }
        if (broadcastType == null || broadcastType.length() < 1) {
            session.put("addBroadcast_broadcastType", "Broadcast type is missing.");
            valid = false;
        }
        if (subject == null || subject.length() < 1) {
            session.put("addBroadcast_subject", "Subject is missing.");
            valid = false;
        }
        if (subCategoryId <= 0) {
            session.put("addBroadcast_subCategoryId", "SubCategory is missing.");
            valid = false;
        }

        if (!valid) {
            return INPUT;
        }

        Company company = companyService.getById(getUser().getCompanyId());
        SubCategory subCategory = subCategoryService.getById(subCategoryId);

        broadcast = new Broadcast();
        broadcast.setPartNo(partNo);
        broadcast.setDescription(description);
        broadcast.setPrice(price);
        broadcast.setQuantity(quantity);
        broadcast.setCond(condition);
        broadcast.setManufacturer(manufacturer);
        broadcast.setCompany(company);
        broadcast.setMessage(broadcastMessage);
        broadcast.setSubject(subject);
        broadcast.setBroadcastType(broadcastType);
        State state = company.getState();
        broadcast.setCountry(state.getCountry());
        broadcast.setSubCategory(subCategory);

        broadcast.setCreationDate(new Timestamp(System.currentTimeMillis()));
        broadcast.setCreatedBy(getUser().getId());
        broadcast.setUpdatedBy(getUser().getId());
        broadcastService.addNew(broadcast);

        message = "Broadcast added sucessfully";
        return SUCCESS;
    }

    public String getMessage() {
        return message;
    }
}
