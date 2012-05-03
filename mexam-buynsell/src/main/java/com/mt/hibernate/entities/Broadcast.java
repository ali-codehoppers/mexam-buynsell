package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import javax.persistence.*;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@javax.persistence.Table(name = "broadcasts")
@NamedQueries({
    @NamedQuery(name = "Broadcast.findByFavorite", query = "select b from Vendor b where b.companyId IN(?)")
})
public class Broadcast extends BaseEntity {

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
    @Expose
    private String subCategoryId;
    private SubCategory subCategory;

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

    public String getDescription() {
        return description;
    }

    @NotEmpty
    @Column(insertable = false, updatable = false, name = "companyId")
    public int getCompanyId() {
        return companyId;
    }

    @ManyToOne(targetEntity = Company.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "companyId")
    public Company getCompany() {
        return company;
    }

    @NotEmpty
    @Column(insertable = false, updatable = false, name = "countryId")
    public String getCountryId() {
        return countryId;
    }

    @ManyToOne(targetEntity = Country.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "countryId")
    public Country getCountry() {
        return country;
    }

    @NotEmpty
    @Column(insertable = false, updatable = false, name = "subCategoryId")
    public String getSubCategoryId() {
        return subCategoryId;
    }

    @ManyToOne(targetEntity = SubCategory.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "subCategoryId")
    public SubCategory getSubCategory() {
        return subCategory;
    }

    @NotEmpty
    public String getCond() {
        return cond;
    }

    @NotEmpty
    @Length(min = 4, max = 50)
    public String getManufacturer() {
        return manufacturer;
    }

    @NotEmpty
    @Length(min = 4, max = 150)
    public String getPartNo() {
        return partNo;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getMessage() {
        return message;
    }

    @NotEmpty
    @Length(min = 6, max = 150)
    public String getSubject() {
        return subject;
    }

    @NotEmpty
    public String getBroadcastType() {
        return broadcastType;
    }
}
