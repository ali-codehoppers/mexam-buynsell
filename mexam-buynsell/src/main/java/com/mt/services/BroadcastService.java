package com.mt.services;

import com.mt.hibernate.entities.Broadcast;
import com.mt.idao.IBroadcastDao;
import java.util.List;

public class BroadcastService {

    private IBroadcastDao broadcastDao;

    public BroadcastService(IBroadcastDao broadcastDao) {
        this.broadcastDao = broadcastDao;
    }

    public Integer addNew(Broadcast newInstance) {
        return broadcastDao.addNew(newInstance);
    }

    public Broadcast getById(Integer id) {
        return broadcastDao.getById(id);
    }

    public void update(Broadcast transientObject) {
        broadcastDao.update(transientObject);
    }

    public void addOrUpdate(Broadcast obj) {
        broadcastDao.addOrUpdate(obj);
    }

    public void delete(Broadcast persistentObject) {
        broadcastDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        broadcastDao.deleteById(id);
    }

    public List<Broadcast> getAll() {
        return broadcastDao.getAll();
    }
}
