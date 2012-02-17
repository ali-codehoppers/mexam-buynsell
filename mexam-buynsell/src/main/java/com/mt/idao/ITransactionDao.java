package com.mt.idao;

import com.mt.hibernate.entities.Transaction;
import java.util.List;

public interface ITransactionDao extends IDaoGeneric<Transaction, Integer> {

    List<Transaction> findByTransactionId(String transactionId);
}
