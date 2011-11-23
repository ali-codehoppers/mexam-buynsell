/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Company;

import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.State;
import com.mt.hibernate.entities.User;
import com.mt.services.CompanyService;
import com.mt.services.StateService;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author CodeHopper
 */
public class AddCompany extends ActionSupport {

    private String name;
    private String address;
    private String city;
//    private int countryId;
    private int stateId;
    private String phoneNo;
    private String faxNo;
    private String zip;    
    private String webAddress;
    private String companyCategoryId;    

    
    private Company company;
    private CompanyService companyService;
    private StateService stateService;
    private String message;

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public void setFaxNo(String faxNo) {
        this.faxNo = faxNo;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public void setCompanyCategoryId(String companyCategoryId) {
        this.companyCategoryId = companyCategoryId;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public void setStateService(StateService stateService) {
        this.stateService = stateService;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setWebAddress(String webAddress) {
        this.webAddress = webAddress;
    }

    @Override
    public String execute() throws Exception {
        State state = stateService.getById(stateId);

        company = new Company();
        company.setName(name);
        company.setAddress(address);
        company.setCity(city);
        company.setPhoneNo(phoneNo);
        company.setFaxNo(faxNo);
        company.setState(state);
        company.setWebAddress(webAddress);
        company.setCompanyCategory(companyCategoryId);
        company.setZip(zip);
        companyService.addNew(company);

        message = "Company added sucessfully";
        return SUCCESS;
    }

    public Company getCompany() {
        return company;
    }

    
    public String getMessage() {
        return message;
    }
}
