package com.mt.idao;

import com.mt.hibernate.entities.Cart;
import java.util.List;

public interface ICartDao extends IDaoGeneric<Cart, Integer> {
    List<Cart> findByUser(String CompanyId);
}
