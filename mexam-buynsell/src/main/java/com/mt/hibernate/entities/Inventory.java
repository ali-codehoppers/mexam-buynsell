package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import javax.persistence.*;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@javax.persistence.Table(name = "inventories")
@NamedQueries({
    @NamedQuery(name = "Inventory.findBySearchString", query = "select p from Inventory p where  p.partNo like ? or p.manufacturer like ?")
})
public class Inventory extends BaseEntity {

    @Expose
    private String partNo;
    @Expose
    private String manufacturer;
    @Expose
    private String cond;
    @Expose
    private double price = 0;
    @Expose
    private int quantity = 0;
    @Expose
    
    private String description;
    @Expose
    private Long partId;
    private Part part;
    @Expose
    private long companyId;
    private Company company;

    public void setCompany(Company company) {
        this.company = company;
    }

    public void setCompanyId(long companyId) {
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

    public void setPartId(Long partId) {
        this.partId = partId;
    }

    public void setPart(Part part) {
        this.part = part;
    }
    
    public Inventory() {
    }

    @Column(insertable = false, updatable = false, name = "companyId")
    public long getCompanyId() {
        return companyId;
    }

    @ManyToOne(targetEntity = Company.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "companyId")
    public Company getCompany() {
        return company;
    }

    @Column(insertable = false, updatable = false, name = "partId", nullable=true)
    public Long getPartId() {
        return partId;
    }

    @ManyToOne(targetEntity = Part.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "partId", nullable=true)
    @NotFound( action = NotFoundAction.IGNORE )
    public Part getPart() {
        return part;
    }

    public String getDescription() {
        return description;
    }

    @NotEmpty
    @Length(min = 4, max = 150)
    public String getCond() {
        return cond;
    }

    @NotEmpty
    @Length(min = 4, max = 150)
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
}
