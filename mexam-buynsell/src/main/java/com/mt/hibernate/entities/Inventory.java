package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@javax.persistence.Table(name = "inventories")
public class Inventory implements Serializable {

    @Expose
    private int id;
    @Expose
    private String partNo;
    @Expose
    private String manufacturer;
    @Expose
    private String condition;
    @Expose
    private String price;
    @Expose
    private String quantity;
    @Expose
    private String description;
    @Expose
    private int companyId;
    private Company company;

    public void setId(int id) {
        this.id = id;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public void setCondition(String condition) {
        this.condition = condition;
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

    public void setPrice(String price) {
        this.price = price;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public Inventory() {
    }

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    @Column(insertable = false, updatable = false, name = "subcategoryId")
    public int getCompanyId() {
        return companyId;
    }

    public String getDescription() {
        return description;
    }

    @ManyToOne(targetEntity = Company.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "companyId")
    public Company getCompany() {
        return company;
    }

    public String getCondition() {
        return condition;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public String getPartNo() {
        return partNo;
    }

    public String getPrice() {
        return price;
    }

    public String getQuantity() {
        return quantity;
    }

}
