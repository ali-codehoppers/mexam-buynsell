/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.hibernate.entities;

import javax.persistence.*;

@Entity
@Table(name = "userClientRatings")
public class UserClientRating extends BaseEntity {

    private int userId;
    private User user;
    private int vendorId;
    private Company vendor;
    private int rating;

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setVendor(Company vendor) {
        this.vendor = vendor;
    }

    public int getRating() {
        return rating;
    }

    @Column(insertable = false, updatable = false, name = "userId")    
    public int getUserId() {
        return userId;
    }
    
    @Column(insertable = false, updatable = false, name = "companyId")
    public int getVendorId() {
        return vendorId;
    }

    @ManyToOne(targetEntity = User.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "userId")
    public User getUser() {
        return user;
    }

    @ManyToOne(targetEntity = Company.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "companyId")
    public Company getVendor() {
        return vendor;
    }
}
