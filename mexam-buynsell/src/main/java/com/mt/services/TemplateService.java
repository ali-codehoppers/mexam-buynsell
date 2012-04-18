/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.services;

import com.mt.hibernate.entities.Template;
import com.mt.idao.ITemplateDao;
import java.util.List;

/**
 *
 * @author Muaz
 */
public class TemplateService {

    private ITemplateDao templateDao;

    public TemplateService(ITemplateDao emailDao) {
        this.templateDao = emailDao;
    }

    /*
     * public List<Address> findById(int addressId) { return
     * addressDao.findByAddressId("" + addressId);
    }
     */
    public Integer addNew(Template newInstance) {
        return templateDao.addNew(newInstance);
    }

    public Template getById(Integer id) {
        return templateDao.getById(id);
    }

    public List<Template> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return templateDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public List<Template> findByType(String type) {
        return templateDao.findByType(type);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return templateDao.getRecordsCount(searchField, searchString, searchOperator);
    }

    public void update(Template transientObject) {
        templateDao.update(transientObject);
    }

    public void addOrUpdate(Template obj) {
        templateDao.addOrUpdate(obj);
    }

    public void delete(Template persistentObject) {
        templateDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        templateDao.deleteById(id);
    }

    public List<Template> getAll() {
        return templateDao.getAll();
    }
}
