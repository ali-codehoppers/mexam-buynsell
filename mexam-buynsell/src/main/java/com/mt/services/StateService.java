package com.mt.services;

import com.mt.hibernate.entities.RFQ;
import com.mt.hibernate.entities.State;
import com.mt.idao.IStateDao;
import java.util.List;

public class StateService {

    private IStateDao stateDao;

    public StateService(IStateDao stateDao) {
        this.stateDao = stateDao;
    }

    public List<State> findByName(String name) {
        return stateDao.findByName(name);
    }

    public Integer addNew(State newInstance) {
        return stateDao.addNew(newInstance);
    }

    public State getById(Integer id) {
        return stateDao.getById(id);
    }

    public List<State> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return stateDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return stateDao.getRecordsCount(searchField, searchString, searchOperator);
    }

    public void update(State transientObject) {
        stateDao.update(transientObject);
    }

    public void addOrUpdate(State obj) {
        stateDao.addOrUpdate(obj);
    }

    public void delete(State persistentObject) {
        stateDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        stateDao.deleteById(id);
    }

    public List<State> getAll() {
        return stateDao.getAll();
    }
}
