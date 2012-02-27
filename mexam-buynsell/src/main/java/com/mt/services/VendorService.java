package com.mt.services;

import com.mt.hibernate.entities.Inventory;
import com.mt.hibernate.entities.Vendor;
import com.mt.idao.IVendorDao;
import java.util.List;
import org.hibernate.Session;

public class VendorService {

    private IVendorDao vendorDao;

    public VendorService(IVendorDao vendorDao) {
        this.vendorDao = vendorDao;
    }

    public List<Vendor> findByCompany(int companyId) {
        return vendorDao.findByCompany("" + companyId);
    }

    public Integer addNew(Vendor newInstance) {
        return vendorDao.addNew(newInstance);
    }

    public Vendor getById(Integer id) {
        return vendorDao.getById(id);
    }

    public List<Vendor> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return vendorDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return vendorDao.getRecordsCount(searchField, searchString, searchOperator);
    }
    
        public List<Vendor> getFullTextSearch(String searchString) {
        Session session = vendorDao.getSession();
        //List result =  session.createSQLQuery("Select i.*,p.*,c.* from Inventory i Left Outer Join Part p on i.parId=p.id Join Company on c.id=i.companyId where Match(partNo, manufacturer) against ('"+searchString+"')").addEntity("inventory", Inventory.class).list();;
        String query =  "Select *,MATCH(name) AGAINST ('"+searchString+"') as score from companies i where Match(name) AGAINST ('"+searchString+"') order by score desc";
        List result =  session.createSQLQuery(query).addEntity("vendor", Vendor.class).list();
        return result;
//        String []searchField = {"partNo","manufacturer"};
//        return null;
//        return inventoryDao.getFullTextSearchBy(searchField, searchString, sortField, sortOrder, rows, page);
    }

    public void update(Vendor transientObject) {
        vendorDao.update(transientObject);
    }

    public void addOrUpdate(Vendor obj) {
        vendorDao.addOrUpdate(obj);
    }

    public void delete(Vendor persistentObject) {
        vendorDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        vendorDao.deleteById(id);
    }

    public List<Vendor> getAll() {
        return vendorDao.getAll();
    }
}
