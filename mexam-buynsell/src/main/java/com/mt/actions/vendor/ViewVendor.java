/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.vendor;

import com.mt.hibernate.entities.Company;
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

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }
    
    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public String execute() {
        System.out.println(companyId);
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
