/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.paypal;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author AmierHaider
 */
public class PayAmount extends ActionSupport {
    
    private String amount;
    private String country;
    private String ccNumber;
    private String csc;
    private String firstName;
    private String lastName;
    private String billingLine1;
    private String billingLine2;
    private String zipCode;
    private String city;
    private String state;
    private int expirationMonth;
    private int expirationYear;
    private String paymentType;
    private String telephone;
    private String email;
    
    
    public void setBillingLine1(String billingLine1) {
        this.billingLine1 = billingLine1;
    }
    
    public void setBillingLine2(String billingLine2) {
        this.billingLine2 = billingLine2;
    }
    
    public void setCcNumber(String ccNumber) {
        this.ccNumber = ccNumber;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
    
    public void setCountry(String country) {
        this.country = country;
    }
    
    public void setCsc(String csc) {
        this.csc = csc;
    }
    
    public void setExpirationMonth(int expirationMonth) {
        this.expirationMonth = expirationMonth;
    }
    
    public void setExpirationYear(int expirationYear) {
        this.expirationYear = expirationYear;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public void setState(String state) {
        this.state = state;
    }
    
    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }
    
    public void setAmount(String amount) {
        this.amount = amount;
    }
    
    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    
    
    @Override
    public String execute() throws Exception {
        
        PaymentInfo paymentInfo = new PaymentInfo();
        paymentInfo.setCcNum(ccNumber);
        paymentInfo.setCcNum(csc);
        paymentInfo.setFirstName(firstName);
        paymentInfo.setLastName(lastName);
        paymentInfo.setExpMonth(expirationMonth);
        paymentInfo.setExpYear(expirationYear);
        paymentInfo.setZip(zipCode);
        paymentInfo.setBillingList1(billingLine1);
        paymentInfo.setBillingList2(billingLine2);
        paymentInfo.setCity(city);
        paymentInfo.setState("CA");
        paymentInfo.setCountryCode(country);
        paymentInfo.setPaymentType(paymentType);
        paymentInfo.setEmailAddress(email);
        paymentInfo.setTelephone(telephone);
        //paymentInfo.setCcType("Visa");
        //paymentInfo.setCcNum("4555754405343123");
        //paymentInfo.setCcNum("4826761716556965");
        paymentInfo.setCcNum("4025851196140692");
        //paymentInfo.setCvv2("3123");
        paymentInfo.setCvv2("696");
        //paymentInfo.setExpMonth(1);
        paymentInfo.setExpMonth(2);
        paymentInfo.setExpYear(17);
        
        PaypalIntegration paypalIntegration = new PaypalIntegration();
        String res = paypalIntegration.DoDirectPaymentCode("Authorization", paymentInfo, amount);
        
        return "";
        
    }
}
