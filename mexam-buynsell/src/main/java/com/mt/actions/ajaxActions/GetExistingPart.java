/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.mt.hibernate.entities.Part;
import com.mt.services.PartService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author Muaz
 */
public class GetExistingPart extends ActionSupport {
    String code;
    PartService partService;
    String jsonString;

    public void setCode(String code) {
        this.code = code;
    }

    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    public void setJsonString(String jsonString) {
        this.jsonString = jsonString;
    }
    

    public String execute() throws Exception{ 
        List<Part> parts = partService.findByCode(code, code, code);
         jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(parts);
        return SUCCESS;
    }
    public String getCode() {
        return code;
    }

    public PartService getPartService() {
        return partService;
    }

    public String getJsonString() {
        return jsonString;
    }
    
    
    
}
