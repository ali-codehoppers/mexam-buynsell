package com.mt.idao;

import com.mt.hibernate.entities.User;
import java.util.List;

public interface IUserDao extends IDaoGeneric<User, Integer> {
	List<User> findByName(String name);
        List<User> findByUsername(String name);
        List<User> findByEmail(String email);
        List<User> findByCompanyId(int companyId);
}
