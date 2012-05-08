/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import javax.persistence.*;

@Entity
@Table(name = "addresses")
@NamedQueries({
    @NamedQuery(name = "Address.findByTransactionId", query = "select a from Address a where a.transId = ?")})
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
    private int stateId;
    private State state;
    @Expose
    private int countryId;
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

    public void setType(String type) {
        this.type = type;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public void setTransaction(Transaction transaction) {
        this.transaction = transaction;
    }

    public void setCountryId(int countryId) {
        this.countryId = countryId;
    }

    public void setState(State state) {
        this.state = state;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public Address() {
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

    public int getCountryId() {
        return countryId;
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

    public String getZip() {
        return zip;
    }

    public String getType() {
        return type;
    }
}
