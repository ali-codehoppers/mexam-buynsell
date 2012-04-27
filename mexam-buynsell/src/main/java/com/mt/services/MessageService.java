/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.services;

import com.mt.hibernate.entities.Message;
import com.mt.idao.IMessageDao;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 *
 * @author Muaz
 */
public class MessageService {
 private IMessageDao messageDao;
 
    public void setSessionFactory(SessionFactory sessionFactory) {
        messageDao.setSessionFactory(sessionFactory);
    }

    public MessageService(IMessageDao messageDao) {
        this.messageDao = messageDao;
    }
    public List<Message> findCountByType(int id){
        return messageDao.findCountByType(id);
    }
    public Integer addNew(Message newInstance) {
        return messageDao.addNew(newInstance);
    }

    public Message getById(Integer id) {
        return messageDao.getById(id);
    }

    public List<Message> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return messageDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return messageDao.getRecordsCount(searchField, searchString, searchOperator);
    }

    public void update(Message transientObject) {
        messageDao.update(transientObject);
    }

    public void addOrUpdate(Message obj) {
        messageDao.addOrUpdate(obj);
    }

    public void delete(Message persistentObject) {
        messageDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        messageDao.deleteById(id);
    }

    public List<Message> getAll() {
        return messageDao.getAll();
    }
}
