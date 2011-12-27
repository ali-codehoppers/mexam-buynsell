package com.mt.dao;

import com.mt.hibernate.entities.Company;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Query;

public class CompanyDao<T, PK extends Serializable> extends DaoGeneric<T, PK>
{

    public CompanyDao(Class<T> type) {
        super(type);
    }

//    @Override
//    public List<Company> executeFinder(Method method, Object[] args) {
//        if (method.getName().compareTo("GetBy") != 0) {
//            return super.executeFinder(method, args);
//        }
//        else {
//            return GetBy((String) args[0], (String) args[1], (String) args[2], (String) args[3], (String) args[4]);
//        }
//    }

    
    public List<Company> getBy(String searchField, String searchString, String searchOperator, String sortField, String sortOrder) {
        String qry = "select company from Company where " + searchField + getOperator(searchOperator) + searchString + " order by " + searchField + " " + sortOrder;

        Query query = getSession().createQuery(qry);
        return query.list();
    }

    private String getOperator(String operator) {
        if (operator.compareTo("lt") == 0) {
            return " < ";
        } else if (operator.compareTo("gt") == 0) {
            return " > ";
        } else if (operator.compareTo("eq") == 0) {
            return " = ";
        }
        return " = ";
    }

}
