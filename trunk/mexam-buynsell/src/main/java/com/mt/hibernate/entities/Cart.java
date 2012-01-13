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
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@javax.persistence.Table(name = "carts")
@NamedQueries({
    @NamedQuery(name = "Cart.findByUser", query = "select v from Cart v where v.userId= cast(? as string)")
})

public class Cart extends BaseEntity{
    @Expose
    private int userId;
    @Expose
    private User User;
    @Expose
    private List<CartItem> items;
    

    public void setUser(User User) {
        this.User = User;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    @ManyToOne(targetEntity = User.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "userId")
    public User getUser() {
        return User;
    }

    @NotEmpty
    @Column(insertable = false, updatable = false, name = "userId")
    public int getUserId() {
        return userId;
    }
    
    @OneToMany(targetEntity = CartItem.class, fetch = FetchType.EAGER, mappedBy = "cartId")
    public List<CartItem> getItems() {
        return items;
    }
    
}
