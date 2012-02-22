/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.part;

import com.mt.hibernate.entities.Part;
import com.mt.services.PartService;
import com.opensymphony.xwork2.ActionSupport;

public class ViewPart extends ActionSupport {
    
    private int partId;
    private String bsin;
    private String upc_ean;
    private String message;
    private Part part;
    private PartService partService;
    
    public void setPartId(int partId) {
        this.partId = partId;
    }
    
    public void setBsin(String bsin) {
        this.bsin = bsin;
    }
    
    public String getUpc_ean() {
        return upc_ean;
    }
    
    public void setUpc_ean(String upc_ean) {
        this.upc_ean = upc_ean;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }
    
    public void setPartService(PartService partService) {
        this.partService = partService;
    }
    
    @Override
    public String execute() throws Exception {
        if (bsin != null) {
            part = partService.findByBSIN(bsin).get(0);
        } else if (upc_ean != null) {
            part = partService.findByUPC(upc_ean).get(0);
        } else {
            part = partService.getById(partId);
        }
        
        return SUCCESS;
    }
    
    public Part getPart() {
        return part;
    }
    
    public String getMessage() {
        return message;
    }
}
