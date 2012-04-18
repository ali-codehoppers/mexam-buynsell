/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.hibernate.entities;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Muaz
 */
@Entity
@Table(name = "templates")
@NamedQueries({
    @NamedQuery(name = "Template.findByType", query = "select c from Template c where c.type = ?")
    
})
public class Template extends BaseEntity {
    
    String type;
    String body;

    public void setBody(String body) {
        this.body = body;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Template(){
        
    }
    
    public String getBody() {
        return body;
    }

    public String getType() {
        return type;
    }
    
    
        
}
