package com.mt.services;

import com.mt.hibernate.entities.LookUp;
import com.mt.hibernate.entities.Part;
import com.mt.idao.IPartDao;
import java.util.List;

public class PartService {

    private IPartDao partDao;

    public PartService(IPartDao partDao) {
        this.partDao = partDao;
    }

    public List<Part> findByName(String name) {
        return partDao.findByName(name);
    }

    public List<Part> findByCategory(int id) {
        return partDao.findByCategory("" + id);
    }

    public List<Part> findByManufacturer(String manufacturer) {
        return partDao.findByManufacturer(manufacturer);
    }

    public List<Part> findBySearchString(String searchString) {
        return partDao.findBySearchString("%"+searchString+"%", "%"+searchString+"%", "%"+searchString+"%");
    }

    public Integer addNew(Part newInstance) {
        return partDao.addNew(newInstance);
    }

    public Part getById(Integer id) {
        return partDao.getById(id);
    }

    public List<Part> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return partDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return partDao.getRecordsCount(searchField, searchString, searchOperator);
    }

    public void update(Part transientObject) {
        partDao.update(transientObject);
    }

    public void addOrUpdate(Part obj) {
        partDao.addOrUpdate(obj);
    }

    public void delete(Part persistentObject) {
        partDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        partDao.deleteById(id);
    }

    public List<Part> getAll() {
        return partDao.getAll();
    }
}
