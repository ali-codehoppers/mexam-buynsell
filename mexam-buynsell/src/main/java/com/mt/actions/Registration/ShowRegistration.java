package com.mt.actions.Registration;

import com.google.gson.GsonBuilder;
import com.mt.actions.Company.*;
import com.mt.hibernate.entities.Country;
import com.mt.hibernate.entities.LookUp;
import com.mt.hibernate.entities.State;
import com.mt.services.CountryService;
import com.mt.services.LookUpService;
import com.opensymphony.xwork2.ActionSupport;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

public class ShowRegistration extends ActionSupport {

    private List<Country> countries;
    private List<LookUp> companyCategories;
    private CountryService countryService;
    private LookUpService lookUpService;
    private String countriesJson;
    private String categoriesJson;

    public void setCountryService(CountryService countryService) {
        this.countryService = countryService;
    }

    public void setLookUpService(LookUpService lookUpService) {
        this.lookUpService = lookUpService;
    }

    @Override
    public String execute() throws Exception {

        //request.getHeader("referer"); 
        
        countries = countryService.getAll();
        companyCategories = lookUpService.findByName("COMPANY_CATEGORY");
        countriesJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(countries);
        categoriesJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(companyCategories);
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
}
