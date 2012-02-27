/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Inventory;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.hibernate.entities.Inventory;
import com.mt.hibernate.entities.Part;
import com.mt.services.InventoryService;
import com.opensymphony.xwork2.ActionSupport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class SearchItem extends ActionSupport {

    private String searchString;
    private List<Inventory> inventorys;
    private List<InventoryExtended> inventorysExtended;
    private String searchResultJson;
    private InventoryService inventoryService;

    public void setSearchString(String searchString) {
        this.searchString = searchString;
    }

    public void setInventoryService(InventoryService inventoryService) {
        this.inventoryService = inventoryService;
    }

    @Override
    public String execute() throws Exception {
        inventorysExtended = new ArrayList<InventoryExtended>();
        if (searchString != null && searchString.length() > 0) {
            inventorys = inventoryService.getFullTextSearch(searchString);
            //inventorys = inventoryService.findBySearchString(searchString);
            for (Inventory inventory : inventorys) {
                InventoryExtended inventoryExtended = new InventoryExtended(inventory);
                inventorysExtended.add(inventoryExtended);
            }

            searchResultJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(inventorysExtended);
        }
        return SUCCESS;
    }

    public List<Inventory> getInventorys() {
        return inventorys;
    }

    public String getSearchResultJson() {
        return searchResultJson;
    }

    private class InventoryExtended extends Inventory {

        @Expose
        private String companyName;
        @Expose
        private String date;
        @Expose
        private String bsin;
        @Expose
        private int imageId = 0;

        public InventoryExtended(Inventory inventory) {
            this.setId(inventory.getId());
            this.setPartNo(inventory.getPartNo());
            this.setManufacturer(inventory.getManufacturer());
            this.setCond(inventory.getCond());
            this.setPrice(inventory.getPrice());
            this.setQuantity(inventory.getQuantity());
            this.setDescription(inventory.getDescription());
            this.setCompanyId(inventory.getCompanyId());
            this.setCompany(inventory.getCompany());
            this.setCreatedBy(inventory.getCreatedBy());
            this.setCreationDate(inventory.getCreationDate());
            this.setPartId(inventory.getPartId());
            if (this.getPartId() != null && this.getPartId() > 0) {
                Part part = inventory.getPart();
                bsin = part.getBsin();
                if (part.getImages().size() > 0) {
                    this.imageId = part.getImages().get(0).getId();
                }
            }
            SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
            if (this.getUpdateDate() != null && this.getUpdateDate().toString().length() > 0) {
                this.date = df.format(this.getUpdateDate());
            } else {
                this.date = df.format(this.getCreationDate());
            }
            this.companyName = inventory.getCompany().getName();

        }
    }

    public String getSearchString() {
        return searchString;
    }
    
}
