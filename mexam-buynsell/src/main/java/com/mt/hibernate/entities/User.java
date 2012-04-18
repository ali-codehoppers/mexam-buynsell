/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import javax.persistence.*;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@javax.persistence.Table(name = "users")
@NamedQueries({
    @NamedQuery(name = "User.findByName", query = "select u from User u where u.firstName like ? or u.lastName like ?"),
    @NamedQuery(name = "User.findByEmail", query = "select u from User u where u.email = ? "),
    @NamedQuery(name = "User.findByUsername", query = "select u from User u where u.username like ?")})
public class User extends BaseEntity {

    @Expose
    private String firstName;
    @Expose
    private String lastName;
    @Expose
    private String address;
    @Expose
    private String city;
    @Expose
    private String contactNo;
    @Expose
    private String contactNo2;
    @Expose
    private String email;
    @Expose
    private String username;
    @Expose
    private String password;
    @Expose
    private int companyId;
    private Company company;

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public void setContactNo2(String contactNo2) {
        this.contactNo2 = contactNo2;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    @NotEmpty
    @Length(min = 4, max = 50)
    public String getFirstName() {
        return firstName;
    }

    @NotEmpty
    @Length(min = 4, max = 50)
    public String getLastName() {
        return lastName;
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

    @Column(name = "contactNo")
    public String getContactNo() {
        return contactNo;
    }

    @Column(name = "contactNo2")
    public String getContactNo2() {
        return contactNo2;
    }

    public String getEmail() {
        return email;
    }

    @NotEmpty
    @Length(min = 6, max = 15)
    public String getPassword() {
        return password;
    }

    @NotEmpty
    @Length(min = 4, max = 50)
    public String getUsername() {
        return username;
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
