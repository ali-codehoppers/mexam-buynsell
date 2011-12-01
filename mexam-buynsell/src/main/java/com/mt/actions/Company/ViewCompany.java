/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Company;

import com.mt.hibernate.entities.Company;
import com.mt.services.CompanyService;
import com.opensymphony.xwork2.ActionSupport;

public class ViewCompany extends ActionSupport
{

    private int companyId;
    private String message;
    private Company company;
    
    private CompanyService companyService;

    public void setCompany(Company company) {
        this.company = company;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

 
    public void setMessage(String message)
    {
        this.message = message;
    }

    
    @Override
    public String execute() throws Exception
    {
        company = companyService.getById(companyId);
        return SUCCESS;
    }

    public Company getCompany() {
        return company;
    }


    
    public String getMessage()
    {
        return message;
    }
    
}
