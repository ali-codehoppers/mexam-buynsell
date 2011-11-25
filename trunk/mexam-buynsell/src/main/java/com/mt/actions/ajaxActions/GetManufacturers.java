package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.mt.hibernate.entities.Part;
import com.mt.services.PartService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

public class GetManufacturers extends ActionSupport {

    private List<Part> parts;
    private List<String> manufacturers;
    private PartService partService;
    private String jsonString = "";

    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @Override
    public String execute() throws Exception {
        parts = partService.getAll();
        manufacturers = new ArrayList<String>();
        for (Part part : parts) {
            manufacturers.add(part.getManufacturer());
        }
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(manufacturers);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }
}