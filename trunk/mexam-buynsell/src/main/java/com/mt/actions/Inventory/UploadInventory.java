/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Inventory;

import com.mt.actions.AuthenticatedAction;
import java.io.File;
import com.csvreader.CsvReader;
import com.google.gson.GsonBuilder;
import com.mt.services.CompanyService;
import com.mt.services.InventoryService;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Inventory;
import com.mt.hibernate.entities.Part;
import com.mt.hibernate.entities.SubCategory;
import com.mt.services.PartService;
import com.mt.util.BSINGenerator;
import com.mt.util.RecordsJson;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Muaz
 */
public class UploadInventory extends AuthenticatedAction implements SessionAware {

    private File csvUpload;
    private String csvUploadContentType;
    private String csvUploadFileName;
    private String fileName;
    private String message;
    private String error;
    private String info;
    private Inventory inventory;
    private InventoryService inventoryService;
    private CompanyService companyService;
    private PartService partService;
    private List<UploadLog> uploadLog;
    private String uploadLogJson;
    private Map session;

    public void setCsvUpload(File csvUpload) {
        this.csvUpload = csvUpload;
    }

    public void setCsvUploadContentType(String csvUploadContentType) {
        this.csvUploadContentType = csvUploadContentType;
    }

    public void setCsvUploadFileName(String csvUuploadFileName) {
        this.csvUploadFileName = csvUuploadFileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setInventoryService(InventoryService inventoryService) {
        this.inventoryService = inventoryService;
    }

    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    public String execute() throws Exception {
        uploadLog = new ArrayList<UploadLog>();
        CsvReader inventoryFromCSV = new CsvReader(csvUpload.toString());
        inventoryFromCSV.readHeaders();
        int index = 0;
        while (inventoryFromCSV.readRecord()) {
            String manufacturer = inventoryFromCSV.get("Manufacturer");
            String partNo = inventoryFromCSV.get("PartNo");
            String condition = inventoryFromCSV.get("Condition");
            double price = Double.parseDouble(inventoryFromCSV.get("Price"));
            int quantity = Integer.parseInt(inventoryFromCSV.get("Quantity"));
            String description = inventoryFromCSV.get("Description");
            String bsin = inventoryFromCSV.get("bsin");
            String upc = inventoryFromCSV.get("upc_ean");
            String nsn = inventoryFromCSV.get("nsn");
            Company company = companyService.getById(getUser().getCompanyId());
            boolean valid = true;
            if (quantity < 1) {

                valid = false;
            }
            if (partNo == null || partNo.length() < 1) {

                valid = false;
            }
            if (manufacturer == null || manufacturer.length() < 1) {

                valid = false;
            }
            if (condition == null || condition.length() < 1) {

                valid = false;
            }
            if (price <= 0) {

                valid = false;
            }
            UploadLog log = new UploadLog();
            log.setManufacturer(manufacturer);
            log.setPartNo(partNo);
            log.setCondition(condition);
            if (!valid) {
                log.setStatus("Error in Data");
                uploadLog.add(log);
                continue;
                // return INPUT;
            } else {
                List<String> searchFields = new ArrayList<String>();
                List<String> searchOpers = new ArrayList<String>();
                List<String> searchStrings = new ArrayList<String>();
                searchFields.add("manufacturer");
                searchOpers.add("eq");
                searchStrings.add("'" + manufacturer + "'");
                searchFields.add("partNo");
                searchOpers.add("eq");
                searchStrings.add("'" + partNo + "'");
                searchFields.add("cond");
                searchOpers.add("eq");
                searchStrings.add("'" + condition + "'");
                searchFields.add("createdBy");
                searchOpers.add("eq");
                searchStrings.add("'" + getUser().getId() + "'");

                List<Inventory> inventories = inventoryService.getBy(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers), "", "", 10, 1);
                if (inventories.size() > 0) {
                    inventory = inventories.get(0);
                    inventory.setDescription(description);
                    inventory.setQuantity(inventory.getQuantity() + quantity);
                    inventory.setPrice(price);
                    inventory.setUpdatedBy(getUser().getId());
                    inventory.setCompany(company);
                    log.setStatus("Inventory Updated");
                    inventoryService.update(inventory);
                } else {
                    int partId = -1;
                    List<Part> parts = partService.findByCode(upc, bsin, nsn);
                    if (parts.size() > 0) {
                        partId = parts.get(0).getId();
                    } else {
                        while (true) {
                            bsin = BSINGenerator.getNext();
                            if (partService.findByBSIN(bsin).isEmpty()) {
                                break;
                            }
                        }
                        Part part = new Part();
                        part.setManufacturer(manufacturer);
                        part.setDescription(description);
                        part.setOverview(description);
                        part.setPartNo(partNo);
                        part.setBsin(bsin);
                        part.setCreationDate(new Timestamp(System.currentTimeMillis()));
                        part.setCreatedBy(getUser().getId());
                        part.setUpdatedBy(getUser().getId());
                        partId = partService.addNew(part);
                    }
                    inventory = new Inventory();
                    inventory.setPartNo(partNo);
                    inventory.setDescription(description);
                    inventory.setPrice(price);
                    inventory.setQuantity(quantity);
                    inventory.setCond(condition);
                    inventory.setManufacturer(manufacturer);
                    inventory.setCompany(company);
                    inventory.setCreationDate(new Timestamp(System.currentTimeMillis()));
                    inventory.setUpdateDate(new Timestamp(System.currentTimeMillis()));
                    inventory.setPartId((long)partId);
                    inventory.setCreatedBy(getUser().getId());
                    inventory.setUpdatedBy(getUser().getId());
                    inventoryService.addNew(inventory);
                    log.setStatus("Inventory Added");
                    message = "Inventory added sucessfully";
                }
            }
            uploadLog.add(log);
            // perform program logic here
            //System.out.println(productID + ":" + productName);
        }
        RecordsJson<UploadLog> recordsJson = new RecordsJson<UploadLog>(1, 10, uploadLog.size(), uploadLog);
        uploadLogJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(recordsJson);
        inventoryFromCSV.close();
        return SUCCESS;
    }

    public File getCsvUpload() {
        return csvUpload;
    }

    public String getCsvUploadContentType() {
        return csvUploadContentType;
    }

    public String getCsvUploadFileName() {
        return csvUploadFileName;
    }

    public String getFileName() {
        return fileName;
    }

    public List<UploadLog> getUploadLog() {
        return uploadLog;
    }

    public String getUploadLogJson() {
        return uploadLogJson;
    }

    private String[] getStringArray(List<String> list) {
        return list.toArray(new String[list.size()]);
    }
}
