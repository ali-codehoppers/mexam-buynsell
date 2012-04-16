/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.idao;

import java.io.Serializable;
import com.mt.hibernate.entities.Email;
import com.mt.hibernate.entities.Part;
import java.util.List;

/**
 *
 * @author Muaz
 */
public interface IEmailDao extends IDaoGeneric<Email, Integer> {

    List<Email> findByType(String type);
}
