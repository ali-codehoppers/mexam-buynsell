package com.mt.idao;

import com.mt.hibernate.entities.Inventory;
import java.util.List;

public interface IInventoryDao extends IDaoGeneric<Inventory, Integer> {

    List<Inventory> findBySearchString(String search, String search2);

    List<Inventory> findByBSIN(String BSIN);

    List<Inventory> findByUPC(String UPC);
}
