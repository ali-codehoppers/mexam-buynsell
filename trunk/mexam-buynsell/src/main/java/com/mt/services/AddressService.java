package com.mt.services;


import com.mt.hibernate.entities.Address;
import com.mt.idao.IAddressDao;
import java.util.List;

public class AddressService {

    private IAddressDao addressDao;

    public AddressService(IAddressDao addressDao) {
        this.addressDao = addressDao;
    }

  /*  public List<Address> findById(int addressId) {
        return addressDao.findByAddressId("" + addressId);
    }*/

    public Integer addNew(Address newInstance) {
        return addressDao.addNew(newInstance);
    }

    public Address getById(Integer id) {
        return addressDao.getById(id);
    }

    public List<Address> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return addressDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return addressDao.getRecordsCount(searchField, searchString, searchOperator);
    }

    public void update(Address transientObject) {
        addressDao.update(transientObject);
    }

    public void addOrUpdate(Address obj) {
        addressDao.addOrUpdate(obj);
    }

    public void delete(Address persistentObject) {
        addressDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        addressDao.deleteById(id);
    }

    public List<Address> getAll() {
        return addressDao.getAll();
    }
}
