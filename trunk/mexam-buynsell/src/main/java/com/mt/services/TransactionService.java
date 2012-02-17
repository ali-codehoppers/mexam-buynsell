package com.mt.services;

import com.mt.hibernate.entities.Transaction;
import com.mt.idao.ITransactionDao;
import java.util.List;

public class TransactionService {

    private ITransactionDao transactionDao;

    public TransactionService(ITransactionDao transactionDao) {
        this.transactionDao = transactionDao;
    }

    public List<Transaction> findByTransactionId(int transactionId) {
        return transactionDao.findByTransactionId("" + transactionId);
    }

    public Integer addNew(Transaction newInstance) {
        return transactionDao.addNew(newInstance);
    }

    public Transaction getById(Integer id) {
        return transactionDao.getById(id);
    }

    public List<Transaction> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return transactionDao.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return transactionDao.getRecordsCount(searchField, searchString, searchOperator);
    }

    public void update(Transaction transientObject) {
        transactionDao.update(transientObject);
    }

    public void addOrUpdate(Transaction obj) {
        transactionDao.addOrUpdate(obj);
    }

    public void delete(Transaction persistentObject) {
        transactionDao.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        transactionDao.deleteById(id);
    }

    public List<Transaction> getAll() {
        return transactionDao.getAll();
    }
}
