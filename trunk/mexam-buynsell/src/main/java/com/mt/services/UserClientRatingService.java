/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.services;

import com.mt.hibernate.entities.User;
import com.mt.hibernate.entities.UserClientRating;
import com.mt.idao.IUserClientRating;
import java.util.List;

/**
 *
 * @author AmierHaider
 */
public class UserClientRatingService {

    private IUserClientRating iUserClientRating;

    public UserClientRatingService(IUserClientRating iUserClientRating) {
        this.iUserClientRating = iUserClientRating;
    }

    public Integer addNew(UserClientRating userClientRating) {
        return iUserClientRating.addNew(userClientRating);
    }

    public UserClientRating getById(int id) {
        return iUserClientRating.getById(id);
    }

    public List<UserClientRating> getBy(String[] searchField, String[] searchString, String[] searchOperator, String sortField, String sortOrder, int rows, int page) {
        return iUserClientRating.getBy(searchField, searchString, searchOperator, sortField, sortOrder, rows, page);
    }

    public long getRecordsCount(String[] searchField, String[] searchString, String[] searchOperator) {
        return iUserClientRating.getRecordsCount(searchField, searchString, searchOperator);
    }

    public void update(UserClientRating transientObject) {
        iUserClientRating.update(transientObject);
    }

    public void addOrUpdate(UserClientRating obj) {
        iUserClientRating.addOrUpdate(obj);
    }

    public void delete(UserClientRating persistentObject) {
        iUserClientRating.delete(persistentObject);
    }

    public void deleteById(Integer id) {
        iUserClientRating.deleteById(id);
    }

    public List<UserClientRating> getAll() {
        return iUserClientRating.getAll();
    }
}
