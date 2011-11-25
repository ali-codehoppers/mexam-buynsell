package com.mt.actions;

import com.mt.hibernate.entities.User;
import com.opensymphony.xwork2.ActionSupport;

public class AuthenticatedAction extends ActionSupport
{
   private User user;

    public User getUser() 
    {
        return user;
    }

    public void setUser(User user) 
    {
        this.user = user;
    }
    
}
