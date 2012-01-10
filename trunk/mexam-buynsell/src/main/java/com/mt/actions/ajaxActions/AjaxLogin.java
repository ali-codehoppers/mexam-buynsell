/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.User;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;

public class AjaxLogin extends AuthenticatedAction {

    private String message;
    private String error = "";
    private String info;
    private String userName;
    private String password;
    private User user;
    private List<User> userList;
    private UserService userService;

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
    public String execute() throws Exception {

        userList = userService.findByUsername(userName);

        if (userList == null || userList.isEmpty()) {
            error = "The username or password you entered is incorrect.";
            return "fail";
        } 
        else {
            for (int i = 0; i < userList.size(); i++) {
                if (userList.get(i).getPassword().compareTo(password) == 0) {
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
}
