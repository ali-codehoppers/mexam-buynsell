/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.mt.hibernate.entities.User;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author Muaz
 */
public class CheckUserName extends ActionSupport {

    private String userName;
    private UserService userService;
    private String jsonString = "";

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String execute() throws Exception {
        List<User> user = null;
        user = userService.findByUsername(userName);
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(user);
        return SUCCESS;

    }

    public String getJsonString() {
        return jsonString;
    }
}
