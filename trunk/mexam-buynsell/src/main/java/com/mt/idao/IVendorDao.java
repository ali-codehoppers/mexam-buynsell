package com.mt.idao;

import com.mt.hibernate.entities.Vendor;
import java.util.List;

public interface IVendorDao extends IDaoGeneric<Vendor, Integer> {

    List<Vendor> findByCompany(String CompanyId);
}
