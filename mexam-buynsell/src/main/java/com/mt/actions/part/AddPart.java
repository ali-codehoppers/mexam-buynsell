package com.mt.actions.part;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.*;
import com.mt.services.*;
import com.mt.util.ImageUtil;
import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.apache.struts2.interceptor.SessionAware;

public class AddPart extends AuthenticatedAction implements SessionAware {

    private String message;
    private String error = "";
    private String info;
    private String subCatId;
    private int subCategoryId;
    private Inventory inventory;
    private Part part;
    private List<LookUp> inventoryCondition;
    private PartService partService;
    private InventoryService inventoryService;
    private LookUpService lookUpService;
    private SubCategoryService subCategoryService;
    private CompanyService companyService;
    private String name;
    private String features;
    private String specifications;
    private String description;
    private String overview;
    private String partNo;
    private String manufacturer;
    private String condition;
    private double price;
    private Integer quantity;
    private File image;
    private String imageContentType;
    private String imageFilename;
    private ImageService imageService;
    private Map session;

//    public void setSubCategoryId(String subCategoryId) {
//        this.subCatId = subCategoryId;
//    }
    public void setSubCategoryId(int subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public void setLookUpService(LookUpService lookUpService) {
        this.lookUpService = lookUpService;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setInventoryService(InventoryService inventoryService) {
        this.inventoryService = inventoryService;
    }

    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public void setPartNo(String partNo) {
        this.partNo = partNo;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public void setFeatures(String features) {
        this.features = features;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications;
    }

    public void setSubCategoryService(SubCategoryService subCategoryService) {
        this.subCategoryService = subCategoryService;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setImage(File image) {
        this.image = image;
    }

    public void setImageContentType(String imageContentType) {
        this.imageContentType = imageContentType;
    }

    public void setImageFileName(String imageFilename) {
        this.imageFilename = imageFilename;
    }

    public void setImageService(ImageService imageService) {
        this.imageService = imageService;
    }

    public void setSession(Map map) {
        this.session = map;
    }

    @Override
    public String execute() throws Exception {

        boolean valid = true;
        if (quantity == null || quantity < 1) {
            session.put("addPart_quantity", "Quantity must be greater than zero.");
            valid = false;
        }
        if (partNo == null || partNo.length() < 1) {
            session.put("addPart_partNo", "Part Number is missing.");
            valid = false;
        }
        if (manufacturer == null || manufacturer.length() < 1) {
            session.put("addPart_manufacturer", "Manufacturer is missing.");
            valid = false;
        }
        if (condition == null || condition.length() < 1) {
            session.put("addPart_condition", "Please specify inventory condition.");
            valid = false;
        }
        if (price <= 0) {
            session.put("addPart_price", "Price must be greater than zero.");
            valid = false;
        }



        if (!valid) {
            return INPUT;
        }



        Company company = companyService.getById(getUser().getCompanyId());

        part = new Part();
        part.setName(name);
        part.setManufacturer(manufacturer);
        part.setFeatures(features);
        part.setDescription(description);
        part.setSpecifications(specifications);
        part.setOverview(overview);
        part.setPartNo(partNo);
        SubCategory subCategory = subCategoryService.getById(subCategoryId);
        part.setSubcategory(subCategory);
        part.setCreationDate(new Timestamp(System.currentTimeMillis()));
        part.setCreatedBy(getUser().getId());
        part.setUpdatedBy(getUser().getId());

        partService.addNew(part);

        inventory = new Inventory();
        inventory.setPartNo(partNo);
        inventory.setDescription(description);
        inventory.setPrice(price);
        inventory.setQuantity(quantity);
        inventory.setCond(condition);
        inventory.setManufacturer(manufacturer);
        inventory.setCompany(company);
        inventory.setCreationDate(new Timestamp(System.currentTimeMillis()));
        inventory.setCreatedBy(getUser().getId());
        inventory.setUpdatedBy(getUser().getId());
        inventoryService.addNew(inventory);

        String fileName = UUID.randomUUID().toString();
        if (image != null) {
             new ImageUtil().SaveImage(image, fileName, getExtension(imageFilename));
            Image tmpImage = new Image();
            tmpImage.setContentType(imageContentType);
            tmpImage.setFileName(fileName);
            tmpImage.setPart(part);
            tmpImage.setOrgFileName(imageFilename);
            tmpImage.setExtension(getExtension(imageFilename));
            imageService.addNew(tmpImage);
        }


        message = "Part and Inventory added successfully.";

        return SUCCESS;
    }

    public List<LookUp> getInventoryCondition() {
        return inventoryCondition;
    }

    public Part getPart() {
        return part;
    }

    public Inventory getInventory() {
        return inventory;
    }

    public String getMessage() {
        return message;
    }

    public String getError() {
        return error;
    }

    public String getInfo() {
        return info;
    }

    private String getExtension(String fileName) {
        if (fileName != null && fileName.length() > 0) {
            int index = fileName.lastIndexOf('.');
            if (index > -1) {
                return fileName.substring(index + 1, fileName.length());
            }
        }
        return null;
    }

    public String getCondition() {
        return condition;
    }

    public String getDescription() {
        return description;
    }

    public String getFeatures() {
        return features;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public String getName() {
        return name;
    }

    public String getOverview() {
        return overview;
    }

    public String getPartNo() {
        return partNo;
    }

    public PartService getPartService() {
        return partService;
    }

    public double getPrice() {
        return price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public String getSpecifications() {
        return specifications;
    }

    public String getSubCatId() {
        return subCatId;
    }

    public int getSubCategoryId() {
        return subCategoryId;
    }
    
}
