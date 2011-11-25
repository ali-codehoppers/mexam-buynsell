package com.mt.services;

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

    public Integer addNew(Part newInstance) {
        return partDao.addNew(newInstance);
    }

    public Part getById(Integer id) {
        return partDao.getById(id);
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
