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
public List<Broadcast> findByFavorite(String ids){
    return broadcastDao.findByFavorite(ids);
}
    public List<Broadcast> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return broadcastDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }
    
    public List<Broadcast> getByIn(String searchField, String searchString, String sortField, String sortOrder, int rows, int page) {
        return broadcastDao.getByIn(searchField, searchString, sortField, sortOrder, rows, page);
    }    

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return broadcastDao.getRecordsCount(searchField, searchString, searchOperator);
    }
    public long getRecordsCountIn(String searchField, String searchString) {
        return broadcastDao.getRecordsCountIn(searchField, searchString);
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
