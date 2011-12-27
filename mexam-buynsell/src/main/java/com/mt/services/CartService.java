package com.mt.services;

import com.mt.hibernate.entities.Cart;
import com.mt.idao.ICartDao;
import java.util.List;

public class CartService {

    private ICartDao cartDao;

    public CartService(ICartDao cartDao) {
        this.cartDao = cartDao;
    }

    public List<Cart> findByUser(int userId) {
        return cartDao.findByUser(""+userId);
    }

    public Integer addNew(Cart newInstance) {
        return cartDao.addNew(newInstance);
    }

    public Cart getById(Integer id) {
        return cartDao.getById(id);
    }

    public void update(Cart transientObject) {
        cartDao.update(transientObject);
    }

    public void addOrUpdate(Cart obj) {
        cartDao.addOrUpdate(obj);
    }

    public void delete(Cart persistentObject) {
        cartDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        cartDao.deleteById(id);
    }

    public List<Cart> getAll() {
        return cartDao.getAll();
    }
}
