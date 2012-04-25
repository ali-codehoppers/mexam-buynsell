/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Company;

import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.User;
import com.mt.services.CompanyService;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

/**
 *
 * @author Muaz
 */
public class SaveEditCompany extends ActionSupport {

    private int userId;
    private int companyId;
    private String name;
    private String address;
    private String city;
    private int stateId;
    private String country;
    private String phoneNo;
    private String faxNo;
    private String zip;
    private String webAddress;
    private String companyCategory;
    private String errorType;
    private User user;
    private CompanyService companyService;
    private UserService userService;

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setCompanyCategory(String companyCategory) {
        this.companyCategory = companyCategory;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setFaxNo(String faxNo) {
        this.faxNo = faxNo;
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

    public void setWebAddress(String webAddress) {
        this.webAddress = webAddress;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String execute() throws Exception {
        boolean valid = true;
        if (name == null || name.length() == 0) {
            valid = false;
        }
        if (address == null || address.length() == 0) {
            valid = false;
        }
        if (city == null || city.length() == 0) {
            valid = false;
        }
        if (stateId == 0) {
            valid = false;
        }
        if (phoneNo == null || phoneNo.length() == 0) {
            valid = false;
        }
        if (companyCategory == null || companyCategory.length() == 0) {
            valid = false;
        }
        if (valid == false) {
            errorType = "COMPANY_EMPTY";
            return "fail";
        }

        Company company = companyService.getById(companyId);
        company.setAddress(address);
        company.setName(name);
        company.setCity(city);
        company.setStateId(stateId);
        company.setPhoneNo(phoneNo);
        company.setFaxNo(faxNo);
        company.setZip(zip);
        company.setWebAddress(webAddress);
        company.setCompanyCategory(companyCategory);
        companyService.addOrUpdate(company);
        user = userService.getById(userId);
        Map session = ActionContext.getContext().getSession();
        session.put("user", user);
        return SUCCESS;
    }

    public String getErrorType() {
        return errorType;
    }
    
}
