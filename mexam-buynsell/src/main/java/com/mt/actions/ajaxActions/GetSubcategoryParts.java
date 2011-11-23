/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.mt.hibernate.entities.Part;
import com.mt.services.SubCategoryService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author CodeHopper
 */
public class GetSubcategoryParts extends ActionSupport {

    private int subcategoryId;
    private List<Part> parts;
    private SubCategoryService subCategoryService;
    private String jsonString = "";

    public void setSubCategoryService(SubCategoryService subCategoryService) {
        this.subCategoryService = subCategoryService;
    }

    public void setSubcategoryId(int subcategoryId) {
        this.subcategoryId = subcategoryId;
    }

    @Override
    public String execute() throws Exception {
        parts = subCategoryService.getById(subcategoryId).getParts();
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(parts);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }
}
