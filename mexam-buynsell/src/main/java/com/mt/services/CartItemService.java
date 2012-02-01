package com.mt.services;

import com.mt.hibernate.entities.Broadcast;
import com.mt.hibernate.entities.CartItem;
import com.mt.idao.ICartItemDao;
import java.util.List;

public class CartItemService {

    private ICartItemDao cartItemDao;

    public CartItemService(ICartItemDao cartItemDao) {
        this.cartItemDao = cartItemDao;
    }

    public Integer addNew(CartItem newInstance) {
        return cartItemDao.addNew(newInstance);
    }

    public List<CartItem> findByVendor(int carId, int companyId) {
        return cartItemDao.findByVendor("" + carId, "" + companyId);
    }

    public CartItem getById(Integer id) {
        return cartItemDao.getById(id);
    }

    public List<CartItem> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return cartItemDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return cartItemDao.getRecordsCount(searchField, searchString, searchOperator);
    }

    public void update(CartItem transientObject) {
        cartItemDao.update(transientObject);
    }

    public void addOrUpdate(CartItem obj) {
        cartItemDao.addOrUpdate(obj);
    }

    public void delete(CartItem persistentObject) {
        cartItemDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        cartItemDao.deleteById(id);
    }

    public List<CartItem> getAll() {
        return cartItemDao.getAll();
    }
}
