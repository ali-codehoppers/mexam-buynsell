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

public class AddBroadcast extends AuthenticatedAction {

    private String message;
    private String partNo;
    private String manufacturer;
    private String condition;
    private double price;
    private String description;
    private String quantity;
    private String broadcastType;    
    private int subCategoryId;        
    private String subject;
    private String broadcastMessage;    
    
    private Broadcast broadcast;
    private CompanyService companyService;
    private BroadcastService broadcastService;
    private SubCategoryService subCategoryService;
    

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

    public void setQuantity(String quantity) {
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

    
    
    @Override
    public String execute() throws Exception {

        Company company = companyService.getById(getUser().getCompanyId());
        SubCategory subCategory = subCategoryService.getById(subCategoryId);
        
        broadcast = new Broadcast();
        broadcast.setPartNo(partNo);
        broadcast.setDescription(description);
        broadcast.setPrice(price);
        broadcast.setQuantity(Integer.parseInt(quantity));
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
