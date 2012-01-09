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
import javax.persistence.OneToMany;
import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;


@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@javax.persistence.Table(name = "subcategories")
@NamedQueries(
  {
    @NamedQuery(name = "SubCategory.findByName", query = "select c from SubCategory c where c.name like ?")
  })
public class SubCategory extends BaseEntity
{
    @Expose
    private String name;
    @Expose
    private int categoryId;
    private Category category;
    private List<Part> parts;

    public void setName(String name)
    {
        this.name = name;
    }

    public void setCategory(Category category)
    {
        this.category = category;
    }

    public void setCategoryId(int categoryId)
    {
        this.categoryId = categoryId;
    }

    public void setParts(List<Part> parts)
    {
        this.parts= parts;
    }

    public SubCategory()
    {
    }

    public SubCategory(String name, int categoryId)
    {
        this.name = name;
        this.categoryId = categoryId;
    }

    public String getName()
    {
        return name;
    }

    @Column(insertable = false, updatable = false, name="categoryId")
    public int getCategoryId()
    {
        return categoryId;
    }

    @ManyToOne(targetEntity = Category.class, fetch = FetchType.LAZY)
    @JoinColumn(name="categoryId")
    public Category getCategory()
    {
        return category;
    }

    @OneToMany(targetEntity = Part.class, fetch = FetchType.LAZY, mappedBy = "subcategoryId")
    public List<Part> getParts()
    {
        return parts;
    }
}
