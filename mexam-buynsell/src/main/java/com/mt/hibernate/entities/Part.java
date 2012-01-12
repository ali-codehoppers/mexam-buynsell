package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import java.util.List;
import javax.persistence.*;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@javax.persistence.Table(name = "parts")

@NamedQueries({
    @NamedQuery(name = "Part.findByName", query = "select c from Part c where c.partNo like ?"),
    @NamedQuery(name = "Part.findByCategory", query = "select p from Part p inner join p.subcategory as sub where sub.categoryId = cast(? as string)"),
    @NamedQuery(name = "Part.findByManufacturer", query = "select p from Part p where p.manufacturer like ?"),    
    @NamedQuery(name = "Part.findBySearchString", query = "select p from Part p where p.partNo like ? or p.manufacturer like ? or p.name like ?")            
})
public class Part extends BaseEntity {


    @Expose
    private String partNo;
    @Expose
    private String name;
    @Expose
    private String manufacturer;
    @Expose
    private int subcategoryId;
    private SubCategory subcategory;
    @Expose
    private String features;
    @Expose
    private String specifications;
    @Expose
    private List<Image> images;
    @Expose
    private String overview;
    @Expose
    private String model;
    @Expose
    private String description;

    public void setPartNo(String partNo) {
        this.partNo = partNo;
    }

    public void setSubcategoryId(int subcategoryId) {
        this.subcategoryId = subcategoryId;
    }

    public void setFeatures(String features) {
        this.features = features;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications;
    }

    public void setSubcategory(SubCategory subCategory) {
        this.subcategory = subCategory;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setName(String name) {
        this.name = name;
    }
    

    public Part() {
    }

    public String getPartNo() {
        return partNo;
    }

    @Column(insertable = false, updatable = false, name = "subcategoryId")
    public int getSubcategoryId() {
        return subcategoryId;
    }

    public String getFeatures() {
        return features;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    @OneToMany(targetEntity = Image.class, fetch = FetchType.LAZY, mappedBy = "partId")
    public List<Image> getImages() {
        return images;
    }

    public String getSpecifications() {
        return specifications;
    }

    @ManyToOne(targetEntity = SubCategory.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "subcategoryId")
    public SubCategory getSubcategory() {
        return subcategory;
    }

    public String getOverview() {
        return overview;
    }

    public String getDescription() {
        return description;
    }

    public String getModel() {
        return model;
    }

    public String getName() {
        return name;
    }
    
    
}
