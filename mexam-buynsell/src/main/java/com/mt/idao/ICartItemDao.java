package com.mt.idao;

import com.mt.hibernate.entities.CartItem;
import java.util.List;

public interface ICartItemDao extends IDaoGeneric<CartItem, Integer> {
    List<CartItem> findByVendor(String cartId,String CompanyId);
}
