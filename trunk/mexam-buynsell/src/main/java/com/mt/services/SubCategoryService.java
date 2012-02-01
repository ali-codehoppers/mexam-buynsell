package com.mt.services;

import com.mt.hibernate.entities.SubCategory;
import com.mt.idao.ISubCategoryDao;
import java.util.List;

public class SubCategoryService {

    private ISubCategoryDao subCategoryDao;

    public SubCategoryService(ISubCategoryDao subSubCategoryDao) {
        this.subCategoryDao = subSubCategoryDao;
    }

    public List<SubCategory> findByName(String name) {
        return subCategoryDao.findByName(name);
    }

    public Integer addNew(SubCategory newInstance) {
        return subCategoryDao.addNew(newInstance);
    }

    public SubCategory getById(Integer id) {
        return subCategoryDao.getById(id);
    }

    public List<SubCategory> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return subCategoryDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return subCategoryDao.getRecordsCount(searchField, searchString, searchOperator);
    }

    public void update(SubCategory transientObject) {
        subCategoryDao.update(transientObject);
    }

    public void addOrUpdate(SubCategory obj) {
        subCategoryDao.addOrUpdate(obj);
    }

    public void delete(SubCategory persistentObject) {
        subCategoryDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        subCategoryDao.deleteById(id);
    }

    public List<SubCategory> getAll() {
        return subCategoryDao.getAll();
    }
}
