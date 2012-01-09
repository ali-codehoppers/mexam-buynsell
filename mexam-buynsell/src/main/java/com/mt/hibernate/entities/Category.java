package com.mt.hibernate.entities;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

/**
 *
 * @author CodeHopper
 */
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@javax.persistence.Table(name = "categories")
@NamedQueries(
  {
    @NamedQuery(name = "Category.findByName", query = "select c from Category c where c.name like ?"),
    @NamedQuery(name = "Category.findEagerCategoryList", query = "select c from Category c left join fetch c.subCategorys")
  })
public class Category extends BaseEntity
{
    @Expose
    private String name;
    private List<SubCategory> subCategorys;

    public void setName(String name)
    {
        this.name = name;
    }

    public void setSubCategorys(List<SubCategory> subCategorys)
    {
        this.subCategorys = subCategorys;
    }

    public Category()
    {
        
    }

    public Category(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }

    @OneToMany(targetEntity = SubCategory.class, fetch = FetchType.LAZY, mappedBy = "categoryId" )
    public List<SubCategory> getSubCategorys()
    {
        return subCategorys;
    }
}
