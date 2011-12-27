package com.mt.idao;

import com.mt.hibernate.entities.Company;
import java.util.List;

public interface ICompanyDao extends IDaoGeneric<Company, Integer> {
	List<Company> findByName(String name);
	List<Company> getBy(String searchField, String searchString, String searchOperator, String sortField, String sortOrder);
}
