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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@javax.persistence.Table(name = "cartItems")
@NamedQueries({
    @NamedQuery(name = "CartItem.findByVendor", query = "select v from CartItem v inner join fetch v.inventory where v.cartId=cast(? as string) and v.inventory.companyId= cast(? as string)")
})
public class CartItem extends BaseEntity{

    @Expose
    private int cartId;
    private Cart cart;
    @Expose
    private int inventoryId;
    @Expose
    private Inventory inventory;
    @Expose
    private int quantity;

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
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


    @ManyToOne(targetEntity = Cart.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "cartId")
    public Cart getCart() {
        return cart;
    }

    @Column(insertable = false, updatable = false, name = "cartId")
    public int getCartId() {
        return cartId;
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
}
