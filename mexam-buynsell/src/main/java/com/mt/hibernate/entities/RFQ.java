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

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@javax.persistence.Table(name = "rfqs")
@NamedQueries({
    @NamedQuery(name = "RFQ.findBySender", query = "select r from RFQ r where r.senderId= cast(? as string)"),
    @NamedQuery(name = "RFQ.findByReceiver", query = "select r from RFQ r where r.receiverId= cast(? as string)")})

public class RFQ extends BaseEntity {

    @Expose
    private int senderId;
    private User Sender;
    @Expose
    private int receiverId;
    private Company Receiver;
    @Expose
    private List<RFQItem> items;
    @Expose
    private boolean isNew;
    @Expose
    private boolean isReplied;
    @Expose
    private String title;
    @Expose
    private String message;

    public void setReceiver(Company Receiver) {
        this.Receiver = Receiver;
    }

    public void setSender(User Sender) {
        this.Sender = Sender;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public void setItems(List<RFQItem> items) {
        this.items = items;
    }

    public void setIsNew(boolean isNew) {
        this.isNew = isNew;
    }

    public void setIsReplied(boolean isReplied) {
        this.isReplied = isReplied;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @ManyToOne(targetEntity = User.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "senderId")
    public User getSender() {
        return Sender;
    }

    @ManyToOne(targetEntity = Company.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "receiverId")
    public Company getReceiver() {
        return Receiver;
    }

    @Column(insertable = false, updatable = false, name = "senderId")
    public int getSenderId() {
        return senderId;
    }

    @Column(insertable = false, updatable = false, name = "receiverId")
    public int getReceiverId() {
        return receiverId;
    }

    @OneToMany(targetEntity = RFQItem.class, fetch = FetchType.LAZY, mappedBy = "rfqId")
    public List<RFQItem> getItems() {
        return items;
    }

    public boolean isIsNew() {
        return isNew;
    }

    public boolean isIsReplied() {
        return isReplied;
    }

    public String getMessage() {
        return message;
    }

    public String getTitle() {
        return title;
    }

}
