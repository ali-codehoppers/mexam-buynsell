/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import javax.persistence.*;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author Muaz
 */
@Entity
@Table(name = "messages")
@NamedQuery(name = "Message.findCountByType", query = "SELECT new Message(m.type,count(m.id)) FROM Message m WHERE m.sendToId=? AND m.unread=1 AND deleted=0 GROUP BY m.type")
public class Message extends BaseEntity {

    @Expose
    private String subject;
    @Expose
    private String message;
    @Expose
    private int sendToId;
    private Company sendTo;
    @Expose
    private int sentById;
    private User sentBy;
    @Expose
    private boolean deleted;
    @Expose
    private boolean unread;
    @Expose
    private String type;
    private Long count;

    
    
    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setSendTo(Company sendTo) {
        this.sendTo = sendTo;
    }

    public void setSendToId(int sendToId) {
        this.sendToId = sendToId;
    }

    public void setSentById(int sentById) {
        this.sentById = sentById;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setUnread(boolean unread) {
        this.unread = unread;
    }

    public void setSentBy(User sentBy) {
        this.sentBy = sentBy;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Message() {
    }

    public Message(String type, Long count) {
        this.type = type;
        this.count = count;
    }
    

    public boolean isDeleted() {
        return deleted;
    }

    public String getType() {
        return type;
    }

    public boolean isUnread() {
        return unread;
    }

    public String getMessage() {
        return message;
    }

    public String getSubject() {
        return subject;
    }

    @ManyToOne(targetEntity = Company.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "sendToId")
    public Company getSendTo() {
        return sendTo;
    }

    @ManyToOne(targetEntity = User.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "sentById")
    public User getSentBy() {
        return sentBy;
    }

    @NotEmpty
    @Column(insertable = false, updatable = false, name = "sendToId")
    public int getSendToId() {
        return sendToId;
    }

    @NotEmpty
    @Column(insertable = false, updatable = false, name = "sentById")
    public int getSentById() {
        return sentById;
    }

    @Transient
    public Long getCount() {
        return count;
    }
    
    
}
