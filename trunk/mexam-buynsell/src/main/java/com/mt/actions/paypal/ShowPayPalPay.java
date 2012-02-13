package com.mt.actions.paypal;

import com.mt.actions.Registration.*;
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

public class ShowPayPalPay extends ActionSupport {

    private List<Country> countries;
    private CountryService countryService;
    private String countriesJson;

    public void setCountryService(CountryService countryService) {
        this.countryService = countryService;
    }

    @Override
    public String execute() throws Exception {

        countries = countryService.getAll();
        countriesJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(countries);
        return SUCCESS;
    }

    public List<Country> getCountries() {
        return countries;
    }

    public List<State> getStates() {
        return new ArrayList<State>();
    }

    public String getCountriesJson() {
        return countriesJson;
    }
}
