/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@javax.persistence.Table(name = "companies")
@NamedQueries({
    @NamedQuery(name = "Company.findByName", query = "select u from Company u where u.name like ?"),
    @NamedQuery(name = "Company.findBySearchString", query = "select v from Company v where v.address like ? or v.city like ? or v.name like ?")
})
public class Company extends BaseEntity {

    @Expose
    private String name;
    @Expose
    private String address;
    @Expose
    private String city;
    @Expose
    private int stateId;
    @Expose
    private State state;
    @Expose
    private String zip;
    @Expose
    private String phoneNo;
    @Expose
    private String faxNo;
    @Expose
    private String webAddress;
    @Expose
    private String companyCategory;
    private List<User> users;
    private List<Inventory> inventorys;
    private List<Broadcast> broadcasts;
    private List<Vendor> vendors;

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public void setState(State state) {
        this.state = state;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public void setFaxNo(String faxNo) {
        this.faxNo = faxNo;
    }

    public void setWebAddress(String webAddress) {
        this.webAddress = webAddress;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public void setCompanyCategory(String companyCategory) {
        this.companyCategory = companyCategory;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public void setInventorys(List<Inventory> inventorys) {
        this.inventorys = inventorys;
    }

    public void setBroadcasts(List<Broadcast> broadcasts) {
        this.broadcasts = broadcasts;
    }

    public void setVendors(List<Vendor> vendors) {
        this.vendors = vendors;
    }

    @NotEmpty
    @Length(min = 4, max = 150)
    public String getName() {
        return name;
    }

    @Length(max = 255)
    public String getAddress() {
        return address;
    }

    @NotEmpty
    @Length(min = 4, max = 50)
    public String getCity() {
        return city;
    }

    @ManyToOne(targetEntity = State.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "stateId")
    public State getState() {
        return state;
    }

    @NotEmpty
    @Column(insertable = false, updatable = false, name = "stateId")
    public int getStateId() {
        return stateId;
    }

    @Length(min = 6, max = 25)
    public String getFaxNo() {
        return faxNo;
    }

    @Length(min = 6, max = 25)
    public String getPhoneNo() {
        return phoneNo;
    }

    @Length(min = 6, max = 50)
    public String getWebAddress() {
        return webAddress;
    }

    @Length(min = 3, max = 15)
    public String getZip() {
        return zip;
    }

    public String getCompanyCategory() {
        return companyCategory;
    }

    @OneToMany(targetEntity = User.class, fetch = FetchType.LAZY, mappedBy = "companyId")
    public List<User> getUsers() {
        return users;
    }

    @OneToMany(targetEntity = Inventory.class, fetch = FetchType.LAZY, mappedBy = "companyId")
    public List<Inventory> getInventorys() {
        return inventorys;
    }

    @OneToMany(targetEntity = Broadcast.class, fetch = FetchType.LAZY, mappedBy = "companyId")
    public List<Broadcast> getBroadcasts() {
        return broadcasts;
    }

    @OneToMany(targetEntity = Vendor.class, fetch = FetchType.LAZY, mappedBy = "companyId")
    public List<Vendor> getVendors() {
        return vendors;
    }
}
