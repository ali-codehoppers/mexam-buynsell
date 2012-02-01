package com.mt.services;

import com.mt.hibernate.entities.Image;
import com.mt.idao.IImageDao;
import java.util.List;

public class ImageService {

    private IImageDao imageDao;

    public ImageService(IImageDao imageDao) {
        this.imageDao = imageDao;
    }

    public List<Image> findByName(String name) {
        return imageDao.findByName(name);
    }

    public Integer addNew(Image newInstance) {
        return imageDao.addNew(newInstance);
    }

    public Image getById(Integer id) {
        return imageDao.getById(id);
    }

    public List<Image> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return imageDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return imageDao.getRecordsCount(searchField, searchString, searchOperator);
    }

    public void update(Image transientObject) {
        imageDao.update(transientObject);
    }

    public void addOrUpdate(Image obj) {
        imageDao.addOrUpdate(obj);
    }

    public void delete(Image persistentObject) {
        imageDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        imageDao.deleteById(id);
    }

    public List<Image> getAll() {
        return imageDao.getAll();
    }
}
