/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
@javax.persistence.Table(name = "companies")
@NamedQueries({
    @NamedQuery(name = "Company.findByName", query = "select u from Company u where u.name like ?")
})
public class Company implements Serializable {

    @Expose
    private int id;
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

    public void setId(int id) {
        this.id = id;
    }

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

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getCity() {
        return city;
    }

    @ManyToOne(targetEntity = State.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "stateId")
    public State getState() {
        return state;
    }

    @Column(insertable = false, updatable = false, name = "stateId")
    public int getStateId() {
        return stateId;
    }

    public String getFaxNo() {
        return faxNo;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public String getWebAddress() {
        return webAddress;
    }

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
