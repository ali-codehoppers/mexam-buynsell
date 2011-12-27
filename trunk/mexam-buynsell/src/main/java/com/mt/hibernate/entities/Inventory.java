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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@javax.persistence.Table(name = "inventories")
@NamedQueries({
    @NamedQuery(name = "Inventory.findBySearchString", query = "select p from Inventory p where  p.partNo like ? or p.manufacturer like ?")            
})

public class Inventory implements Serializable {

    @Expose
    private int id;
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
    private String description;
    @Expose
    private int companyId;
    private Company company;
    
    private long createdBy;
    private long updatedBy;    
    
    private Timestamp creationDate;
    private Timestamp updateDate;

    public void setId(int id) {
        this.id = id;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
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
    
    

    public Inventory() {
    }

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    @Column(insertable = false, updatable = false, name = "companyId")
    public int getCompanyId() {
        return companyId;
    }

    public String getDescription() {
        return description;
    }

    @ManyToOne(targetEntity = Company.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "companyId")
    public Company getCompany() {
        return company;
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

    @Column(updatable=false)
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
}
