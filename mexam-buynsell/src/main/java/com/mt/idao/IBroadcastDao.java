package com.mt.idao;

import com.mt.hibernate.entities.Broadcast;
import java.util.List;

public interface IBroadcastDao extends IDaoGeneric<Broadcast, Integer> {
	List<Broadcast> findByName(String name);
}
