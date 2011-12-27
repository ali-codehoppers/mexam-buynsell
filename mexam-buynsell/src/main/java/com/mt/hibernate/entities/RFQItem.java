/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
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

@Entity
@javax.persistence.Table(name = "RFQItems")
public class RFQItem implements Serializable{

    @Expose
    private int id;
    @Expose
    private int rfqId;
    private RFQ rfq;
    @Expose
    private int inventoryId;
    @Expose
    private Inventory inventory;
    @Expose
    private int quantity;
    @Expose
    private int price;
    private long createdBy;
    private long updatedBy;
    @Expose
    private Timestamp creationDate;
    @Expose
    private Timestamp updateDate;

    public void setRfq(RFQ rfq) {
        this.rfq = rfq;
    }

    public void setRfqId(int rfqId) {
        this.rfqId = rfqId;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setInventory(Inventory inventory) {
        this.inventory = inventory;
    }

    public void setInventoryId(int inventoryId) {
        this.inventoryId = inventoryId;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(int price) {
        this.price = price;
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

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    @ManyToOne(targetEntity = RFQ.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "rfqId")
    public RFQ getRfq() {
        return rfq;
    }

    @Column(insertable = false, updatable = false, name = "rfqId")
    public int getRfqId() {
        return rfqId;
    }

    @ManyToOne(targetEntity = Inventory.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "inventoryId")
    public Inventory getInventory() {
        return inventory;
    }

    @Column(insertable = false, updatable = false, name = "inventoryId")
    public int getInventoryId() {
        return inventoryId;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getPrice() {
        return price;
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
}
