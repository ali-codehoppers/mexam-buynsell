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
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import java.math.*;
import java.security.*;
import java.util.List;

public class Register extends ActionSupport implements SessionAware {

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
    private String firstName;
    private String lastName;
    private String email;
    private String verifyEmail;
    private String userName;
    private String password;
    private String verifyPassword;
    private Company company;
    private CompanyService companyService;
    private User user;
    private UserService userService;
    private StateService stateService;
    private String message;
    private Map session;

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

    public void setStateVal(int stateVal) {
        this.stateVal = stateVal;
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

    public void setVerifyEmail(String verifyEmail) {
        this.verifyEmail = verifyEmail;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
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

    public void setSession(Map map) {
        this.session = map;
    }

    @Override
    public void validate() {
    }

    @Override
    public String execute() throws Exception {

        boolean valid = true;

        if (name == null || name.length() == 0) {
            session.put("register_name", "Name is required.");
            valid = false;
        }


        if (address == null || address.length() == 0) {
            session.put("register_address", "Address is required.");
            valid = false;
        }

        if (city == null || city.length() == 0) {
            session.put("register_city", "City is required.");
            valid = false;
        }

        if (stateVal == 0) {
            session.put("register_state", "State is required.");
            valid = false;
        }

        if (phoneNo == null || phoneNo.length() == 0) {
            session.put("register_phoneNo", "Phone number is required.");
            valid = false;
        }

        if (companyCategory == null || companyCategory.length() == 0) {
            session.put("register_companyCategory", "Company category is required.");
            valid = false;
        }

        if (firstName == null || firstName.length() == 0) {
            session.put("register_firstName", "First name is required.");
            valid = false;
        }

        if (lastName == null || lastName.length() == 0) {
            session.put("register_lastName", "Last name is required.");
            valid = false;
        }

        if (userName == null || userName.length() == 0) {
            session.put("register_userName", "Username is required.");
            valid = false;
        }
        if (password == null || password.length() == 0) {
            session.put("register_password", "Password is required.");
            valid = false;
        }

        if (verifyPassword == null || verifyPassword.length() == 0 || password.compareTo(verifyPassword) != 0) {
            session.put("register_verifyPassword", "Both passwords do not match.");
            valid = false;
        }
        if (verifyEmail == null || verifyEmail.length() == 0 || email.compareTo(verifyEmail) != 0) {
            session.put("register_verifyEmail", "Email Addresses are not a match.");
            valid = false;
        }
        List<User> emailUsers = userService.findByEmail(email);
        if (emailUsers.size() > 0) {
            session.put("register_verifyEmail", "Email already used");
            valid = false;
        }
        if (!valid) {
            return INPUT;
        }

        MessageDigest mdEnc = MessageDigest.getInstance("MD5"); // Encryption algorithm
        mdEnc.update(password.getBytes(), 0, password.length());
        String md5Password = new BigInteger(1, mdEnc.digest()).toString(16);

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
        company.setExpiryDate(new Timestamp(System.currentTimeMillis()));
        company.setIsExpired(true);
        Integer addNewCompany = companyService.addNew(company);

        user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPassword(md5Password);
        user.setUsername(userName);
        user.setEmail(email);
        user.setCompany(company);
        user.setCreationDate(new Timestamp(System.currentTimeMillis()));
        Integer addNewUser = userService.addNew(user);

        session.put("register_success", "Company registered sucessfully.");
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
