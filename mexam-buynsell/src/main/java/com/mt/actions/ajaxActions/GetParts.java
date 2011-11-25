package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.hibernate.entities.Part;
import com.mt.services.PartService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

public class GetParts extends ActionSupport {

    private List<Part> parts;
    private List<PartBasic> partBasics;
    private PartService partService;
    private String jsonString = "";

    private String manufacturer;

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }
    
    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @Override
    public String execute() throws Exception {
        parts = partService.findByManufacturer(manufacturer);
        System.out.println("Parts = " + parts.size());
        partBasics = new ArrayList<PartBasic>();
        for (Part part : parts) {
            System.out.println("Parts is: ID:" + part.getId() + "\t NO: " + part.getPartNo());
            PartBasic partBasic = new PartBasic(part.getId(), part.getPartNo(), part.getManufacturer());
            partBasics.add(partBasic);
        }
        System.out.println("PartsBasic = " + partBasics.size());
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(partBasics);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }

    private class PartBasic {

        @Expose
        private int value;
        @Expose        
        private String label;
        @Expose        
        private String desc;

        public void setDesc(String desc) {
            this.desc = desc;
        }

        public void setLabel(String label) {
            this.label = label;
        }

        public void setValue(int value) {
            this.value = value;
        }

        public PartBasic(int value, String label, String desc) {
            this.value = value;
            this.label = label;
            this.desc = desc;
        }

        public String getDesc() {
            return desc;
        }

        public String getLabel() {
            return label;
        }

        public int getValue() {
            return value;
        }

     }
}