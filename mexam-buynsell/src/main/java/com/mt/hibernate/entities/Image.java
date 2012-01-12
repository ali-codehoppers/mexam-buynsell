/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import javax.persistence.*;

@Entity
@javax.persistence.Table(name = "images")
@NamedQuery(name = "Image.findByName", query = "select i from Image i where i.name like ?")
public class Image implements Serializable {

    @Expose
    private int id;
    @Expose
    private int partId;
    @Expose
    private String name;
    @Expose
    private String description;
    @Expose
    private String contentType;
    @Expose
    private String fileName;
    @Expose
    private String orgFileName;
    @Expose
    private String extension;
    @Expose
    private String orgPath;
    private Part part;

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPartId(int partId) {
        this.partId = partId;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public void setPart(Part part) {
        this.part = part;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public void setOrgFileName(String orgFileName) {
        this.orgFileName = orgFileName;
    }

    public void setOrgPath(String orgPath) {
        this.orgPath = orgPath;
    }

    @Id
    @GeneratedValue
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getContentType() {
        return contentType;
    }

    public String getFileName() {
        return fileName;
    }

    @ManyToOne(targetEntity = Part.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "partId")
    public Part getPart() {
        return part;
    }

    @Column(insertable = false, updatable = false, name = "partId")
    public int getPartId() {
        return partId;
    }

    public String getExtension() {
        return extension;
    }

    @Column(name = "orgFileName")
    public String getOrgFileName() {
        return orgFileName;
    }

    @Column(name = "orgPath")
    public String getOrgPath() {
        return orgPath;
    }
}
