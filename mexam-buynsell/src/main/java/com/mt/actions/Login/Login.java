/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Login;

import com.mt.hibernate.entities.User;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 *
 * @author CodeHopper
 */
public class Login extends ActionSupport {

    private String message;
    private String error = "";
    private String hasError = "";
    private String info;
    private String userName;
    private String password;
    private User user;
    private List<User> userList;
    private UserService userService;
    private String jsonString = "";

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public void validate() {
        if (userName == null || userName.length() == 0) {
            addFieldError("userName", "User Name is required");
        }

        if (password == null || password.length() == 0) {
            addFieldError("password", getText("Password is required"));
        }
    }

    @Override
    public String execute() throws Exception {

        userList = userService.findByUsername(userName);

        if (userList == null || userList.isEmpty()) {
            error = "The username or password you entered is incorrect.";
            return "fail";
        } else {
            for (int i = 0; i < userList.size(); i++) {
                if (userList.get(i).getPassword().compareTo(password) == 0) {
                    User user = userList.get(i);
                    if (user.getCompany().getExpiryDate().compareTo(new Timestamp(System.currentTimeMillis())) < 0) 
                    {
                        user.getCompany().setIsExpired(true);
                        userService.update(user);
                    }

                    Map session = ActionContext.getContext().getSession();
                    session.put("user", userList.get(i));



                    return SUCCESS;
                }
            }
            error = "The username or password you entered is incorrect.";
        }
        return "fail";
    }

    public String getMessage() {
        return message;
    }

    public String getError() {
        return error;
    }

    public String getInfo() {
        return info;
    }

    public String getJsonString() {
        return error;
    }
}
