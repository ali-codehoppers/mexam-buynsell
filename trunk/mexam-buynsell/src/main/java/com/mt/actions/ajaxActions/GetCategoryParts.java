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
 * @author CodeHopper
 */
public class GetCategoryParts extends ActionSupport {

    private int categoryId;
    private List<Part> parts;
    private PartService partService;
    private String jsonString = "";

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @Override
    public String execute() throws Exception {
        parts = partService.findByCategory(categoryId);
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(parts);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }
}
