/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.services;

import com.mt.hibernate.entities.Email;
import com.mt.idao.IEmailDao;
import java.util.List;

/**
 *
 * @author Muaz
 */
public class EmailService {
        private IEmailDao emailDao;

    public EmailService(IEmailDao emailDao) {
        this.emailDao = emailDao;
    }

  /*  public List<Address> findById(int addressId) {
        return addressDao.findByAddressId("" + addressId);
    }*/

    public Integer addNew(Email newInstance) {
        return emailDao.addNew(newInstance);
    }

    public Email getById(Integer id) {
        return emailDao.getById(id);
    }

    public List<Email> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return emailDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }
    public List<Email> findByType(String type){
        return emailDao.findByType(type);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return emailDao.getRecordsCount(searchField, searchString, searchOperator);
    }

    public void update(Email transientObject) {
        emailDao.update(transientObject);
    }

    public void addOrUpdate(Email obj) {
        emailDao.addOrUpdate(obj);
    }

    public void delete(Email persistentObject) {
        emailDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        emailDao.deleteById(id);
    }

    public List<Email> getAll() {
        return emailDao.getAll();
    }
}
