package com.mt.actions.part;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.*;
import com.mt.services.*;
import com.mt.util.ImageUtil;
import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

public class AddPart extends AuthenticatedAction {

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
    private String quantity;
    private File image;
    private String imageContentType;
    private String imageFilename;
    private ImageService imageService;

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

    public void setQuantity(String quantity) {
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

    @Override
    public String execute() throws Exception {

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
        inventory.setQuantity(Integer.parseInt(quantity));
        inventory.setCond(condition);
        inventory.setManufacturer(manufacturer);
        inventory.setCompany(company);
        inventory.setCreationDate(new Timestamp(System.currentTimeMillis()));
        inventory.setCreatedBy(getUser().getId());
        inventory.setUpdatedBy(getUser().getId());
        inventoryService.addNew(inventory);

        String fileName = UUID.randomUUID().toString();
        new ImageUtil().SaveImage(image, fileName, getExtension(imageFilename));

        if (image != null) {
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
}
