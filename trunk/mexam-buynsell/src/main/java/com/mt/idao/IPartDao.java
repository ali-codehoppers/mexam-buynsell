package com.mt.idao;

import com.mt.hibernate.entities.Part;
import java.util.List;

public interface IPartDao extends IDaoGeneric<Part, Integer> {
	List<Part> findByName(String name);
        List<Part> findByCategory(String id);
        List<Part> findByManufacturer(String manufacturer);        
}

