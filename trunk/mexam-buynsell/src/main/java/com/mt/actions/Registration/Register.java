/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Registration;

import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.State;
import com.mt.hibernate.entities.User;
import com.mt.services.CompanyService;
import com.mt.services.StateService;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Timestamp;

public class Register extends ActionSupport {

    private String name;
    private String address;
    private String city;
//    private int countryId;
    private int stateVal = 0;
    private String phoneNo;
    private String faxNo;
    private String zip;
    private String webAddress;
    private String companyCategory;
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

    public void setState(int state) {
        this.stateVal = state;
    }

    public void setCompanyCategoryId(String companyCategoryId) {
        this.companyCategory = companyCategoryId;
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
    public void validate() {
        if (fistName.length() == 0) {
            addFieldError("fistName", "First name is required");
        }

        if (lastName.length() == 0) {
            addFieldError("lastName", getText("Last name is required"));
        }

        if (address.length() == 0) {
            addFieldError("address", getText("Address is required"));
        }

        if (city.length() == 0) {
            addFieldError("city", getText("City is required"));
        }

        if (stateVal == 0) {
            addFieldError("state", getText("State is required"));
        }

        if (companyCategory.length() == 0) {
            addFieldError("companyCategory", getText("Company category is required"));
        }
        if (userName.length() == 0) {
            addFieldError("userName", getText("Username is required"));
        }
        if (password.length() == 0) {
            addFieldError("password", getText("Password is required"));
        }

        if (verifyPassword.length() == 0 || password.compareTo(verifyPassword) != 0) {
            addFieldError("verifyPassword", getText("Both passwords does not match"));
        }

    }

    @Override
    public String execute() throws Exception {
        State state = stateService.getById(stateVal);

        company = new Company();
        company.setName(name);
        company.setAddress(address);
        company.setCity(city);
        company.setPhoneNo(phoneNo);
        company.setFaxNo(faxNo);
        company.setState(state);
        company.setWebAddress(webAddress);
        company.setCompanyCategory(companyCategory);
        company.setZip(zip);
        company.setCreationDate(new Timestamp(System.currentTimeMillis()));
        Integer addNewCompany = companyService.addNew(company);

        user = new User();
        user.setFirstName(fistName);
        user.setLastName(lastName);
        user.setPassword(password);
        user.setUsername(userName);
        user.setEmail(email);
        user.setCompany(company);
        user.setCreationDate(new Timestamp(System.currentTimeMillis()));
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
