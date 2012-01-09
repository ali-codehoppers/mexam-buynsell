/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@javax.persistence.Table(name = "RFQItems")
public class RFQItem extends BaseEntity{
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

    public void setRfq(RFQ rfq) {
        this.rfq = rfq;
    }

    public void setRfqId(int rfqId) {
        this.rfqId = rfqId;
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
}
