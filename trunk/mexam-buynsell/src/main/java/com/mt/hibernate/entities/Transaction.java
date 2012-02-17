/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import java.sql.Timestamp;
import javax.persistence.*;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@javax.persistence.Table(name = "transactions")
@NamedQueries({
    @NamedQuery(name = "Transaction.findByTransactionId", query = "select u from Transaction u where u.transactionId like ?"),})
public class Transaction extends BaseEntity {

    @Expose
    private int companyId;
    private Company company;
    @Expose
    private Timestamp transactionDate;
    @Expose
    private String transactionId;
    @Expose
    private double amount;
    @Expose
    private int subscriptionDuration;

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public void setSubscriptionDuration(int subscriptionDuration) {
        this.subscriptionDuration = subscriptionDuration;
    }

    public void setTransactionDate(Timestamp transactioDate) {
        this.transactionDate = transactionDate;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public double getAmount() {
        return amount;
    }
    @ManyToOne(targetEntity = Company.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "companyId")
    public Company getCompany() {
        return company;
    }   

    @NotEmpty
    @Column(insertable = false, updatable = false, name = "companyId")
    public int getCompanyId() {
        return companyId;
    }

    public int getSubscriptionDuration() {
        return subscriptionDuration;
    }

    public Timestamp getTransactionDate() {
        return transactionDate;
    }

    public String getTransactionId() {
        return transactionId;
    }
}
