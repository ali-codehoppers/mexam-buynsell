package com.mt.idao;

import com.mt.hibernate.entities.Address;
import java.util.List;



public interface IAddressDao extends IDaoGeneric<Address, Integer> {
    List<Address> findByTransactionId(int transId);
}
