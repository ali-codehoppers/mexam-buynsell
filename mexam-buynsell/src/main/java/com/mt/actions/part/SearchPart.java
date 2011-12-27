/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.part;

import com.google.gson.GsonBuilder;
import com.mt.hibernate.entities.Part;
import com.mt.services.PartService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

public class SearchPart extends ActionSupport {

    private String searchString;
    private List<Part> parts;
    private String searchResultJson;
    private PartService partService;

    public void setSearchString(String searchString) {
        this.searchString = searchString;
    }

    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @Override
    public String execute() throws Exception {
        parts = partService.findBySearchString(searchString);
        searchResultJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(parts);
        return SUCCESS;
    }

    public List<Part> getParts() {
        return parts;
    }

    public String getSearchResultJson() {
        return searchResultJson;
    }
    
}
