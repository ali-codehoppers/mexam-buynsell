/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.User;

import com.mt.hibernate.entities.User;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

/**
 *
 * @author CodeHopper
 */
public class SaveEditUser extends ActionSupport {
    
    private int userId;
    private String firstName;
    private String lastName;
    private String email;
    private User user;
    private String errorType;
    private UserService userService;
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        boolean valid = true;
        if (firstName == null || firstName.length() == 0) {
            valid = false;
        }
        if (lastName == null || lastName.length() == 0) {
            valid = false;
        }
        if (email == null || email.length() == 0) {
            valid = false;
        }
        if (valid == false) {
            errorType = "COMPANY_EMPTY";
            return "fail";
        }
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        userService.addOrUpdate(user);
        session.put("user", user);
        return SUCCESS;
    }

    public String getErrorType() {
        return errorType;
    }
    
}
