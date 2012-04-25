/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.vendor;

import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.User;
import com.mt.services.CompanyService;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Muaz
 */
public class ViewVendor extends ActionSupport {

    private int companyId;
    private Company company;
    private CompanyService companyService;
    private User user;

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }
    
    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setUser(User user) {
        this.user = user;
    }

    
    public String execute() {
        if(companyId==0){
            companyId = user.getCompanyId(); 
        }
        company = companyService.getById(companyId);
        return SUCCESS;
    }

    public Company getCompany() {
        return company;
    }

    public int getCompanyId() {
        return companyId;
    }


}
