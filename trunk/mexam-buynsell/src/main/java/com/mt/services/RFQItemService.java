package com.mt.services;

import com.mt.hibernate.entities.Part;
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

    public List<RFQItem> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return rFQItemDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return rFQItemDao.getRecordsCount(searchField, searchString, searchOperator);
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
