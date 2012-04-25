package com.mt.services;

import com.mt.hibernate.entities.Inventory;
import com.mt.idao.IInventoryDao;
import java.util.List;
import org.hibernate.Session;

public class InventoryService {

    private IInventoryDao inventoryDao;

    public InventoryService(IInventoryDao inventoryDao) {
        this.inventoryDao = inventoryDao;
    }

    public Integer addNew(Inventory newInstance) {
        return inventoryDao.addNew(newInstance);
    }

    public Inventory getById(Integer id) {
        return inventoryDao.getById(id);
    }

    public List<Inventory> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return inventoryDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public List<Inventory> getFullTextSearchBy(String[] searchField, String searchString, String sortField, String sortOrder, int rows, int page) {
        return inventoryDao.getFullTextSearchBy(searchField, searchString, sortField, sortOrder, rows, page);
    }

    public List<Inventory> getFullTextSearch(String searchString) {
        Session session = inventoryDao.getSession();
        String query =  "Select *,MATCH(manufacturer) AGAINST ('"+searchString+"') as smanu, MATCH(partNo) AGAINST ('"+searchString+"') as spart from inventories i where Match(partNo, manufacturer) AGAINST ('"+searchString+"' IN BOOLEAN MODE) order by smanu*1.25+spart desc,partNo asc";
        System.out.println(query);
        List result =  session.createSQLQuery(query).addEntity("inventory", Inventory.class).list();
        return result;
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return inventoryDao.getRecordsCount(searchField, searchString, searchOperator);
    }

    public List<Inventory> findBySearchString(String searchString) {
        return inventoryDao.findBySearchString("%" + searchString + "%", "%" + searchString + "%");
    }

    public void update(Inventory transientObject) {
        inventoryDao.update(transientObject);
    }

    public void addOrUpdate(Inventory obj) {
        inventoryDao.addOrUpdate(obj);
    }

    public void delete(Inventory persistentObject) {
        inventoryDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        inventoryDao.deleteById(id);
    }

    public List<Inventory> getAll() {
        return inventoryDao.getAll();
    }
}
