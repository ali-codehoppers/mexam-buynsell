package com.mt.services;

import com.mt.hibernate.entities.Vendor;
import com.mt.idao.IVendorDao;
import java.util.List;

public class VendorService {

    private IVendorDao vendorDao;

    public VendorService(IVendorDao vendorDao) {
        this.vendorDao = vendorDao;
    }

    public List<Vendor> findByCompany(int companyId) {
        return vendorDao.findByCompany("" + companyId);
    }


    public Integer addNew(Vendor newInstance) {
        return vendorDao.addNew(newInstance);
    }

    public Vendor getById(Integer id) {
        return vendorDao.getById(id);
    }

    public void update(Vendor transientObject) {
        vendorDao.update(transientObject);
    }

    public void addOrUpdate(Vendor obj) {
        vendorDao.addOrUpdate(obj);
    }

    public void delete(Vendor persistentObject) {
        vendorDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        vendorDao.deleteById(id);
    }

    public List<Vendor> getAll() {
        return vendorDao.getAll();
    }
}
