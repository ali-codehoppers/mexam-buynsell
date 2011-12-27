/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
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
@javax.persistence.Table(name = "vendors")
@NamedQueries({
    @NamedQuery(name = "Vendor.findByCompany", query = "select v from Vendor v where v.companyId = cast(? as string)")
})
public class Vendor implements Serializable {

    @Expose
    private int id;
    @Expose
    private int companyId;
    private Company company;
    @Expose
    private int vendorId;
    private Company vendor;
    @Expose
    private String notes;
    @Expose
    private int priority;

    public void setId(int id) {
        this.id = id;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public void setVendor(Company vendor) {
        this.vendor = vendor;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public String getNotes() {
        return notes;
    }

    public int getPriority() {
        return priority;
    }

    @ManyToOne(targetEntity = Company.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "vendorId")
    public Company getVendor() {
        return vendor;
    }

    @Column(insertable = false, updatable = false, name = "vendorId")
    public int getVendorId() {
        return vendorId;
    }

    @ManyToOne(targetEntity = Company.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "companyId")
    public Company getCompany() {
        return company;
    }

    @Column(insertable = false, updatable = false, name = "companyId")
    public int getCompanyId() {
        return companyId;
    }
}
