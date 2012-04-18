/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.idao;

import com.mt.hibernate.entities.Template;
import java.util.List;

/**
 *
 * @author Muaz
 */
public interface ITemplateDao extends IDaoGeneric<Template, Integer> {
    List<Template> findByType(String type);
}
