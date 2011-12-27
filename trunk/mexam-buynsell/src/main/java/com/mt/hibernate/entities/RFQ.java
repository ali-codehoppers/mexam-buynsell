/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
@javax.persistence.Table(name = "rfqs")
@NamedQueries({
    @NamedQuery(name = "RFQ.findBySender", query = "select r from RFQ r where r.senderId= cast(? as string)"),
    @NamedQuery(name = "RFQ.findByReceiver", query = "select r from RFQ r where r.receiverId= cast(? as string)")})

public class RFQ implements Serializable {

    @Expose
    private int id;
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
    private long createdBy;
    private long updatedBy;
    @Expose
    private Timestamp creationDate;
    @Expose
    private Timestamp updateDate;

    public void setId(int id) {
        this.id = id;
    }

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
