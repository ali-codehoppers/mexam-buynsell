package com.mt.actions.User;

import com.mt.hibernate.entities.Country;
import com.mt.hibernate.entities.State;
import com.mt.services.CountryService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

public class ShowAddNewUser extends ActionSupport {

    private List<Country> countries;
    private CountryService countryService;

    public void setCountryService(CountryService countryService) {
        this.countryService = countryService;
    }

    @Override
    public String execute() throws Exception {

        countries = countryService.getAll();
        return SUCCESS;
    }

    public List<Country> getCountries() {
        return countries;
    }

    public List<State> getStates() {
        return new ArrayList<State>();
    }
}
