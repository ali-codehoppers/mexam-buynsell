package com.mt.idao;

import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public interface IDaoGeneric<T, PK extends Serializable> {

    PK addNew(T newInstance);

    T getById(PK id);

    void update(T transientObject);

    void addOrUpdate(T obj);

    void delete(T persistentObject);

    void deleteById(PK id);

    List<T> getAll();

    List<T> getBy(String[] searchFields, String[] searchStrings, String[] searchOperators, String sortField, String sortOrder, int rows, int page);

    List<T> getFullTextSearchBy(String[] searchFields, String searchString, String sortField, String sortOrder, int rows, int page);

    long getRecordsCount(String[] searchFields, String[] searchStrings, String[] searchOperators);
    
    Session getSession();
    
    void setSessionFactory(SessionFactory sessionFactory);
    
}
