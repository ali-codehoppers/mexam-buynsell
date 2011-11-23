/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Registration;

import com.mt.actions.Company.*;
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
public class Register extends ActionSupport {

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
    private String fistName;
    private String lastName;
    private String email;
    private String userName;
    private String password;
    private String verifyPassword;
    private Company company;
    private CompanyService companyService;
    private User user;
    private UserService userService;
    private StateService stateService;
    private String message;

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCity(String city) {
        this.city = city;
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

    public void setEmail(String email) {
        this.email = email;
    }

    public void setFistName(String fistName) {
        this.fistName = fistName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setVerifyPassword(String verifyPassword) {
        this.verifyPassword = verifyPassword;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
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
        Integer addNewCompany = companyService.addNew(company);

        user = new User();
        user.setFirstName(fistName);
        user.setLastName(lastName);
        user.setPassword(password);
        user.setUsername(userName);
        user.setEmail(email);
        Integer addNewUser = userService.addNew(user);


        message = "Company registered sucessfully";
        return SUCCESS;
    }

    public Company getCompany() {
        return company;
    }

    public User getUser() {
        return user;
    }

    public String getMessage() {
        return message;
    }
}
