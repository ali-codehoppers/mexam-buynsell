package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class BaseEntity implements Serializable {

    @Expose
    private int id;
    @Expose
    private long createdBy;
    @Expose
    private long updatedBy;
    @Expose
    private Timestamp creationDate;
    @Expose
    private Timestamp updateDate;

    public void setId(int id) {
        this.id = id;
    }

    public void setCreatedBy(long createdBy) {
        this.createdBy = createdBy;
    }

    public void setCreationDate(Timestamp creationDate) {
        this.creationDate = creationDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    public void setUpdatedBy(long updatedBy) {
        this.updatedBy = updatedBy;
    }

    public BaseEntity(){
        this.createdBy=0;
        this.updatedBy=0;
    }
    
    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public long getCreatedBy() {
        return createdBy;
    }

    @Column(updatable = false)
    public Timestamp getCreationDate() {
        return creationDate;
    }

    @Column(insertable = false, updatable = false)
    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public long getUpdatedBy() {
        return updatedBy;
    }
}
