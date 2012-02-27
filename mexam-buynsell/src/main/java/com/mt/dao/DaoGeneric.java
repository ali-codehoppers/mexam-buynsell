package com.mt.dao;

import com.mt.idao.IDaoGeneric;
import com.mt.idao.IFinderExecutor;
import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.dialect.MySQLDialect;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class DaoGeneric<T, PK extends Serializable> implements IDaoGeneric<T, PK>, IFinderExecutor<T> {

    private Class<T> type;
    private SessionFactory sessionFactory;

    public DaoGeneric(Class<T> type) {
        this.type = type;
    }

    public PK addNew(T newInstance) {

        return (PK) getSession().save(newInstance);
    }

    public T getById(PK id) {
        return (T) getSession().get(type, id);
    }

    public void update(T transientObject) {
        getSession().update(transientObject);
    }

    public void addOrUpdate(T obj) {
        getSession().saveOrUpdate(obj);
    }

    public void delete(T persistentObject) {
        getSession().delete(persistentObject);
    }

    public void deleteById(PK id) {
        delete(getById(id));
    }

    public Session getSession() {
        return sessionFactory.getCurrentSession();
//        return SessionFactoryUtils.getSession(sessionFactory, true);
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<T> getAll() {
        return getSession().createCriteria(type).list();
    }

    public List<T> executeFinder(Method method, Object[] args) {
        String queryName = type.getSimpleName();
        queryName += ".";
        queryName += method.getName();

        Query query = getSession().getNamedQuery(queryName);

        // Params are numbered from 0 in hibernate
        for (int i = 0; i < args.length; i++) {
            query.setParameter(i, args[i]);
        }
        return query.list();
    }

    public long getRecordsCount(String[] searchFields, String[] searchStrings, String[] searchOperators) {
        String baseQuery = "select count(obj) from " + type.getSimpleName() + " obj";
        String comaparisonString = getComparisonQueryString(searchFields, searchStrings, searchOperators);
        String qry = baseQuery + comaparisonString;
        Query query = getSession().createQuery(qry);
        //query.setParameter(sortString, qry)
        return (Long) query.uniqueResult();
    }

    public boolean updateRecord(int id, String[] fieldName, String[] fieldValue) {
        String updateQuery = "";
        String baseQuery = "UPDATE " + type.getSimpleName();
        for (int i = 0; i < fieldName.length; i++) {
            updateQuery += fieldName[i] + "=" + fieldValue[i];
        }
        if (!updateQuery.equals("")) {
            baseQuery += "SET " + updateQuery + " WHERE id='" + id + "'";
            // Query query = getSession().createQuery(qry).setFirstResult((page - 1) * rows).setMaxResults(rows);
        }
        return true;
    }

    public Session getActiveSession() {
        return this.getSession();
    }

    public List<T> getFullTextSearchBy(String[] searchFields, String searchString, String sortField, String sortOrder, int rows, int page) {
        String sortString = "";
        String baseQuery = "select obj from " + type.getSimpleName() + " obj";
        String comaparisonString = getFullTextSearchQuery(searchFields, searchString);

        if (sortField != null && sortField.length() > 0) {
            if (sortOrder != null && sortOrder.length() > 0) {
                sortString = " order by " + sortField + " " + sortOrder;
            } else {
                sortString = " order by " + sortField;
            }
        }
        String qry = baseQuery + comaparisonString + sortString;
        Query query;
        if (rows == 0) {
            query = getSession().createQuery(qry);
        } else {
            query = getSession().createQuery(qry).setFirstResult((page - 1) * rows).setMaxResults(rows);
        }
        return query.list();
    }

    public List<T> getBy(String[] searchFields, String[] searchStrings, String[] searchOperators, String sortField, String sortOrder, int rows, int page) {
        //String qry = "select obj from " + type.getSimpleName() +" obj";

        String sortString = "";
        String pageString = "";

        String baseQuery = "select obj from " + type.getSimpleName() + " obj";
        String comaparisonString = getComparisonQueryString(searchFields, searchStrings, searchOperators);

        if (sortField != null && sortField.length() > 0) {
            if (sortOrder != null && sortOrder.length() > 0) {
                sortString = " order by " + sortField + " " + sortOrder;
            } else {
                sortString = " order by " + sortField;
            }
        }

        if (rows != 0 && page != 0) {
            pageString = " LIMIT " + 5 + ", " + rows;
        }

        //String qry=baseQuery+comaparisonString+sortString+pageString;
        String qry = baseQuery + comaparisonString + sortString;
        MySQLDialect mySQLDialect;

        Query query;
        if (rows == 0) {
            query = getSession().createQuery(qry);
        } else {
            query = getSession().createQuery(qry).setFirstResult((page - 1) * rows).setMaxResults(rows);
        }


        return query.list();
    }

    private String getOperator(String operator) {
        if (operator != null) {
            if (operator.compareTo("lt") == 0) {
                return " < ";
            } else if (operator.compareTo("le") == 0) {
                return " <= ";
            } else if (operator.compareTo("gt") == 0) {
                return " > ";
            } else if (operator.compareTo("ge") == 0) {
                return " >=";
            } else if (operator.compareTo("eq") == 0) {
                return " = ";
            } else if (operator.compareTo("ne") == 0) {
                return " <> ";
            } else if (operator.compareTo("cn") == 0) {
                return " LIKE ";
            }
        }
        return " = ";
    }

    private String getComparisonQueryString(String[] searchFields, String[] searchStrings, String[] searchOperators) {
        String comaparisonString = "";
        if (searchFields != null && searchStrings != null && searchOperators != null && searchFields.length == searchStrings.length && searchFields.length == searchOperators.length) {
            for (int i = 0; i < searchFields.length; i++) {
                if (searchFields[i] != null && searchFields[i].length() > 0 && searchOperators != null && searchOperators.length > 0) {
                    if (comaparisonString.length() > 0) {
                        comaparisonString += " and ";
                    }
                    comaparisonString += searchFields[i] + getOperator(searchOperators[i]) + searchStrings[i];
                }
            }
            if (comaparisonString.length() > 0) {
                comaparisonString = " where " + comaparisonString;
            }
        }
        return comaparisonString;
    }

    private String getFullTextSearchQuery(String[] searchFields, String searchString) {
        String criteriaString = "";
        if (searchFields != null && searchFields.length > 0) {
            for (int i = 0; i < searchFields.length; i++) {
                if (searchFields[i].length() > 0) {
                    if (criteriaString.length() > 0) {
                        criteriaString += ",";
                    }
                    criteriaString += searchFields[i];
                }
            }
        }
        if (criteriaString.length() > 0) {
            criteriaString = " where Match(" + criteriaString + ") AGAINST ('" + searchString + "' IN BOOLEAN MODE)";
        }

        return criteriaString;
    }
}