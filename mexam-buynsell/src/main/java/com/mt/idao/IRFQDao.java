package com.mt.idao;

import com.mt.hibernate.entities.RFQ;
import java.util.List;

public interface IRFQDao extends IDaoGeneric<RFQ, Integer> {
    List<RFQ> findBySender(String senderId);
    List<RFQ> findByReceiver(String receiverId);    
}
