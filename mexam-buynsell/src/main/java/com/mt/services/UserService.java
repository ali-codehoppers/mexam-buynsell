package com.mt.services;

import com.mt.hibernate.entities.User;
import com.mt.idao.IUserDao;
import java.util.List;
import org.hibernate.SessionFactory;

public class UserService {

    private IUserDao userDao;

    public void setSessionFactory(SessionFactory sessionFactory)
    {
        userDao.setSessionFactory(sessionFactory);
    }
    
    public UserService(IUserDao userDao) {
        this.userDao = userDao;
    }

    public List<User> findByName(String name) {
        return userDao.findByName(name);
    }

    public List<User> findByUsername(String userName) {
        return userDao.findByUsername(userName);
    }

    public Integer addNew(User newInstance) {
        return userDao.addNew(newInstance);
    }

    public User getById(Integer id) {
        return userDao.getById(id);
    }

    public List<User> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return userDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return userDao.getRecordsCount(searchField, searchString, searchOperator);
    }

    public void update(User transientObject) {
        userDao.update(transientObject);
    }

    public void addOrUpdate(User obj) {
        userDao.addOrUpdate(obj);
    }

    public void delete(User persistentObject) {
        userDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        userDao.deleteById(id);
    }

    public List<User> getAll() {
        return userDao.getAll();
    }
}
