package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.mt.hibernate.entities.Part;
import com.mt.services.PartService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

public class GetPartInfoByUPC extends ActionSupport {

    private List<Part> parts;
    private PartService partService;
    private String jsonString = "";
    private String upc;

    public void setUpc(String upc) {
        this.upc = upc;
    }

    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @Override
    public String execute() throws Exception {
        parts = partService.findByUPC(upc);
        //System.out.println("PartsBasic = " + partBasics.size());
        if (parts != null && parts.size() > 0) {
            jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(parts.get(0));
        }
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }
}