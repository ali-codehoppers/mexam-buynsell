/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Login;

import com.mt.hibernate.entities.User;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author CodeHopper
 */
public class Login extends ActionSupport {

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
            return "fail";
        }
        else
        {
            for(int i=0;i<userList.size();i++)
            {
                if(userList.get(i).getPassword().compareTo(password)==0)
                {
                    return SUCCESS;
                }
            }
        }
        
        
       return "fail";
    }
}
