package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

@Entity
@javax.persistence.Table(name = "broadcasts")
public class Broadcast implements Serializable {

    @Expose
    private int id;
    @Expose
    private int companyId;
    private Company company;
    @Expose
    private String countryId;
    private Country country;
    @Expose
    private String broadcastType;
    @Expose
    private String partNo;
    @Expose
    private String manufacturer;
    @Expose
    private String cond;
    @Expose
    private double price;
    @Expose
    private int quantity;
    @Expose
    private String subject;
    @Expose
    private String message;
    @Expose
    private String description;
    private long createdBy;
    private long updatedBy;
    @Expose
    private Timestamp creationDate;
    private Timestamp updateDate;
    @Expose
    private String subCategoryId;
    private SubCategory subCategory;

    public void setId(int id) {
        this.id = id;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public void setCountryId(String countryId) {
        this.countryId = countryId;
    }

    public void setSubCategory(SubCategory subCategory) {
        this.subCategory = subCategory;
    }

    public void setSubCategoryId(String subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public void setCond(String cond) {
        this.cond = cond;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public void setPartNo(String partNo) {
        this.partNo = partNo;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setCreationDate(Timestamp creationDate) {
        this.creationDate = creationDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    public void setCreatedBy(long createdBy) {
        this.createdBy = createdBy;
    }

    public void setUpdatedBy(long updatedBy) {
        this.updatedBy = updatedBy;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setBroadcastType(String broadcastType) {
        this.broadcastType = broadcastType;
    }

    public Broadcast() {
    }

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    @Column(insertable = false, updatable = false, name = "companyId")
    public int getCompanyId() {
        return companyId;
    }

    @ManyToOne(targetEntity = Company.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "companyId")
    public Company getCompany() {
        return company;
    }

    @Column(insertable = false, updatable = false, name = "countryId")
    public String getCountryId() {
        return countryId;
    }

    @ManyToOne(targetEntity = Country.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "countryId")
    public Country getCountry() {
        return country;
    }

    @Column(insertable = false, updatable = false, name = "subCategoryId")
    public String getSubCategoryId() {
        return subCategoryId;
    }

    @ManyToOne(targetEntity = SubCategory.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "subCategoryId")
    public SubCategory getSubCategory() {
        return subCategory;
    }

    public String getCond() {
        return cond;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public String getPartNo() {
        return partNo;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    @Column(updatable = false)
    public Timestamp getCreationDate() {
        return creationDate;
    }

    @Column(insertable = false, updatable = false)
    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public long getCreatedBy() {
        return createdBy;
    }

    public long getUpdatedBy() {
        return updatedBy;
    }

    public String getMessage() {
        return message;
    }

    public String getSubject() {
        return subject;
    }

    public String getBroadcastType() {
        return broadcastType;
    }
}
