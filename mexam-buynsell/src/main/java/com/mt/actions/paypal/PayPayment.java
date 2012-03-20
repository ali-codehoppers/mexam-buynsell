/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.paypal;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.services.CompanyService;
import com.mt.services.StateService;

/**
 *
 * @author Muaz
 */
public class PayPayment extends AuthenticatedAction {

    private String address;
    private String city;
    private int stateId;
    private String state;
    private String zip;
    private CompanyService companyService;
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

    @Override
    public String execute() throws Exception {
        Company myCompany = companyService.getById(getUser().getCompanyId());
        address = myCompany.getAddress();
        city = myCompany.getCity();
        zip = myCompany.getZip();
        stateId = myCompany.getStateId();
        state = stateService.getById(stateId).getName();
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
}
