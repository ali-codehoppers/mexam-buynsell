package com.mt.services;

import com.mt.hibernate.entities.RFQ;
import com.mt.idao.IRFQDao;
import java.util.List;

public class RFQService {

    private IRFQDao rFQDao;

    public RFQService(IRFQDao rFQDao) {
        this.rFQDao = rFQDao;
    }

    public List<RFQ> findBySender(int senderId) {
        return rFQDao.findBySender("" + senderId);
    }

    public List<RFQ> findByReceiver(int receiverId) {
        return rFQDao.findByReceiver("" + receiverId);
    }

    public Integer addNew(RFQ newInstance) {
        return rFQDao.addNew(newInstance);
    }

    public RFQ getById(Integer id) {
        return rFQDao.getById(id);
    }

    public void update(RFQ transientObject) {
        rFQDao.update(transientObject);
    }

    public void addOrUpdate(RFQ obj) {
        rFQDao.addOrUpdate(obj);
    }

    public void delete(RFQ persistentObject) {
        rFQDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        rFQDao.deleteById(id);
    }

    public List<RFQ> getAll() {
        return rFQDao.getAll();
    }
}
