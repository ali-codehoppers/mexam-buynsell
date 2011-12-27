package com.mt.services;

import com.mt.hibernate.entities.Inventory;
import com.mt.idao.IInventoryDao;
import java.util.List;

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

    public List<Inventory> findBySearchString(String searchString)
    {
        return inventoryDao.findBySearchString("%"+searchString+"%", "%"+searchString+"%");
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
