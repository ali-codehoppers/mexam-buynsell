/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.hibernate.entities;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 *
 * @author Muaz
 */
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@javax.persistence.Table(name = "emails")
@NamedQueries({
    @NamedQuery(name = "Email.findByType", query = "select c from Email c where c.type = ? and c.isSent = 0")
    
})
public class Email extends BaseEntity {
    private String type;
    private int transactionId;
    private int isSent;
    private int numberOfTries;

    public void setIsSent(int isSent) {
        this.isSent = isSent;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setNumberOfTries(int numberOfTries) {
        this.numberOfTries = numberOfTries;
    }
   
    public Email(){
    }

    public int getIsSent() {
        return isSent;
    }

    public String getType() {
        return type;
    }

    public int getTransactionId() {
        return transactionId;
    }

    public int getNumberOfTries() {
        return numberOfTries;
    } 
}
