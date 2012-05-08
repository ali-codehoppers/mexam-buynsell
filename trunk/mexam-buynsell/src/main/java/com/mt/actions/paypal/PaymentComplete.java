/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.paypal;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.State;
import com.mt.services.StateService;

import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class PaymentComplete extends AuthenticatedAction implements SessionAware {

    private String firstName;
    private String lastName;
    private String address1;
    private String address2;
    private String zip;
    private String city;
    private State state;
    private double amount;
    private String creditCardNumber;
    private String creditCardType;
    private Map session;
    private String payment_status;
    private StateService stateService;

    public void setPayment_status(String payment_status) {
        this.payment_status = payment_status;
    }

    public void setSession(Map map) {
        this.session = map;
    }

    public void setStateService(StateService stateService) {
        this.stateService = stateService;
    }

    @Override
    public String execute() throws Exception {

        firstName = (String) session.get("firstName");
        lastName = (String) session.get("lastName");
        address1 = (String) session.get("address1");
        address2 = (String) session.get("address2");
        zip = (String) session.get("zip");
        city = (String) session.get("city");
        int stateId = (Integer) session.get("state");
        state = stateService.getById(stateId);
        amount = (Double) session.get("amount");
        creditCardNumber = (String) session.get("creditCardNumber");
        creditCardType = (String) session.get("creditCardType");
        return SUCCESS;
    }

    public String getPayment_status() {
        return payment_status;
    }

    public String getAddress1() {
        return address1;
    }

    public String getAddress2() {
        return address2;
    }

    public double getAmount() {
        return amount;
    }

    public String getCity() {
        return city;
    }

    public String getCreditCardNumber() {
        return creditCardNumber;
    }

    public String getCreditCardType() {
        return creditCardType;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public State getState() {
        return state;
    }



    public String getZip() {
        return zip;
    }

    public String getSecureCreditCardNumber() {
        int length = creditCardNumber.length();
        String secureString = "XXXXXXXXXXXXXXXXXXXX";
        return (secureString.substring(0, length - 4) + creditCardNumber.substring(length - 4));
    }
}
