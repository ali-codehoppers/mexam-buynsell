package com.mt.idao;

import com.mt.hibernate.entities.Part;
import java.util.List;

public interface IPartDao extends IDaoGeneric<Part, Integer> {
	List<Part> findByName(String name);
        List<Part> findByCategory(String category);
        List<Part> findByBSIN(String BSIN);
        List<Part> findByUPC(String UPC);
        List<Part> findByManufacturer(String manufacturer);        
        List<Part> findBySearchString(String search,String search2, String search3);
}

