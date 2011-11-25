/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.part;

import com.mt.hibernate.entities.Part;
import com.mt.services.PartService;
import com.opensymphony.xwork2.ActionSupport;

public class ViewPart extends ActionSupport
{

    private int partId;
    private String message;
    private Part part;
    
    private PartService partService;

    public void setPartId(int partId) {
        this.partId = partId;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }

    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    
    @Override
    public String execute() throws Exception
    {
        part = partService.getById(partId);
        return SUCCESS;
    }

    public Part getPart() {
        return part;
    }

    public String getMessage()
    {
        return message;
    }
    
    
}
