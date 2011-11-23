/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Registration;

import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.User;
import com.mt.services.CompanyService;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class ViewRegistration extends ActionSupport
{

    private int companyId;
    private int userId;    
    
    private String message;
    private Company company;
    private User user;    
    
    private CompanyService companyService;
    private UserService userService;    

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }

    
    @Override
    public String execute() throws Exception
    {
        company = companyService.getById(companyId);
        user = userService.getById(userId);
        return SUCCESS;
    }

    public Company getCompany() {
        return company;
    }

    public User getUser() {
        return user;
    }

    public String getMessage()
    {
        return message;
    }
    
}
