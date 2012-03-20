/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import javax.persistence.*;

@Entity
@Table(name = "addresses")
public class Address extends BaseEntity {

    @Expose
    private int transId;
    @Expose
    private String address1;
    @Expose
    private String address2;
    @Expose
    private String city;
    @Expose
    private String state;
    @Expose
    private String country;
    @Expose
    private String zip;
    @Expose
    private String type;
    private Transaction transaction;
    
    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setTransId(int transId) {
        this.transId = transId;
    }



    public void setCountry(String country) {
        this.country = country;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public void setTransaction(Transaction transaction) {
        this.transaction = transaction;
    }

    
    public Address() {
        System.out.println("Creating a Address Obj");
    }

    public String getAddress1() {
        return address1;
    }

    public String getAddress2() {
        return address2;
    }

    public String getCity() {
        return city;
    }

	@ManyToOne(targetEntity = Transaction.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "transId")
    public Transaction getTransaction() {
        return transaction;
    }

    @Column(insertable = false, updatable = false, name = "transId")
    public int getTransId() {
        return transId;
    }
	
    public String getState() {
        return state;
    }

    public String getZip() {
        return zip;
    }

    public String getCountry() {
        return country;
    }

    public String getType() {
        return type;
    }
}
