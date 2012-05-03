/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.paypal;

import com.google.gson.GsonBuilder;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Country;
import com.mt.hibernate.entities.User;
import com.mt.services.CompanyService;
import com.mt.services.CountryService;
import com.mt.services.StateService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Muaz
 */
public class PayPayment extends ActionSupport {

    private String address;
    private String city;
    private int stateId;
    private String state;
    private String zip;
    private User user;
    private String countriesJson;
    private List<Country> countries;
    private CompanyService companyService;
    private CountryService countryService;
    private StateService stateService;

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public void setStateService(StateService stateService) {
        this.stateService = stateService;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public void setCountryService(CountryService countryService) {
        this.countryService = countryService;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String execute() throws Exception {
        Company myCompany = companyService.getById(user.getCompanyId());
        address = myCompany.getAddress();
        city = myCompany.getCity();
        zip = myCompany.getZip();
        stateId = myCompany.getStateId();
        state = stateService.getById(stateId).getName();
        List<HashMap> maps = new ArrayList<HashMap>();
        countries = countryService.getAll();

        for (Country country : countries) {
            HashMap hashMap = new HashMap();
            hashMap.put("id", country.getId());
            hashMap.put("name", country.getName());
            maps.add(hashMap);
            System.out.println(country.getName());
        }
        countriesJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(maps);
        return SUCCESS;
    }

    public String getAddress() {
        return address;
    }

    public String getCity() {
        return city;
    }

    public CompanyService getCompanyService() {
        return companyService;
    }

    public int getStateId() {
        return stateId;
    }

    public StateService getStateService() {
        return stateService;
    }

    public String getZip() {
        return zip;
    }

    public String getCountriesJson() {
        return countriesJson;
    }
}
