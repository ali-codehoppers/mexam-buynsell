/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.idao;

import com.mt.hibernate.entities.Message;
import java.util.List;

/**
 *
 * @author Muaz
 */
public interface IMessageDao extends IDaoGeneric<Message, Integer>{
    public List<Message> findCountByType(int id);
    
}
