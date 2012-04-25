/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.User;

import com.google.gson.GsonBuilder;
import com.mt.hibernate.entities.Country;
import com.mt.hibernate.entities.LookUp;
import com.mt.hibernate.entities.State;
import com.mt.hibernate.entities.User;
import com.mt.services.CountryService;
import com.mt.services.LookUpService;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Muaz
 */
public class EditUser extends ActionSupport {

    //private int userId;
    private User user;
    private List<Country> countries;
    private List<LookUp> companyCategories;
    private CountryService countryService;
    private LookUpService lookUpService;
    private String countriesJson;
    private String categoriesJson;
    private UserService userService;
    private String message;
    private String errorType;

    public void setCountryService(CountryService countryService) {
        this.countryService = countryService;
    }

    public void setLookUpService(LookUpService lookUpService) {
        this.lookUpService = lookUpService;
    }

    /*
     * public void setUserId(int userId) { this.userId = userId; }
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setErrorType(String errorType) {
        this.errorType = errorType;
    }

    @Override
    public String execute() throws Exception {
        // user = userService.getById(userId);
        countries = countryService.getAll();
        companyCategories = lookUpService.findByName("COMPANY_CATEGORY");
        countriesJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(countries);
        categoriesJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(companyCategories);
        if (errorType != null) {
            if (errorType.compareTo("PASSWORD_MISMATCH") == 0) {
                message = "The old password does not match";
            } else if (errorType.compareTo("COMPANY_EMPTY") == 0) {
                message = "Can not submit any empty field";
            } else if (errorType.compareTo("USER_EMPTY") == 0) {
                message = "Can not submit any empty field";
            } else if (errorType.compareTo("PASSWORD_EMPTY") == 0) {
                message = "Can not submit any empty field";
            }
        }
        return SUCCESS;

    }

    public List<Country> getCountries() {
        return countries;
    }

    public List<LookUp> getCompanyCategories() {
        return companyCategories;
    }

    public List<State> getStates() {
        return new ArrayList<State>();
    }

    public String getCategoriesJson() {
        return categoriesJson;
    }

    public String getCountriesJson() {
        return countriesJson;
    }

    public User getUser() {
        return user;
    }

    public String getMessage() {
        return message;
    }

    public String getErrorType() {
        return errorType;
    }
    
}
