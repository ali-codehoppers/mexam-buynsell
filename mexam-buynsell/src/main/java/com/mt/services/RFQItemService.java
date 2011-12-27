package com.mt.services;

import com.mt.hibernate.entities.RFQItem;
import com.mt.idao.IRFQItemDao;
import java.util.List;

public class RFQItemService {

    private IRFQItemDao rFQItemDao;

    public RFQItemService(IRFQItemDao rFQItemDao) {
        this.rFQItemDao = rFQItemDao;
    }

    public Integer addNew(RFQItem newInstance) {
        return rFQItemDao.addNew(newInstance);
    }

    public RFQItem getById(Integer id) {
        return rFQItemDao.getById(id);
    }

    public void update(RFQItem transientObject) {
        rFQItemDao.update(transientObject);
    }

    public void addOrUpdate(RFQItem obj) {
        rFQItemDao.addOrUpdate(obj);
    }

    public void delete(RFQItem persistentObject) {
        rFQItemDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        rFQItemDao.deleteById(id);
    }

    public List<RFQItem> getAll() {
        return rFQItemDao.getAll();
    }
}
