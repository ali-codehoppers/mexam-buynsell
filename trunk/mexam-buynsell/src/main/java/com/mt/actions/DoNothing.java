package com.mt.actions;

import com.opensymphony.xwork2.ActionSupport;

public class DoNothing extends ActionSupport
{
    @Override
    public String execute() throws Exception
    {
        return SUCCESS;
    }
    
}
