package com.mt.actions.paypal;

import java.sql.Timestamp;

public class PaymentInfo {

    private int id;
    private Timestamp paymentTimestamp;
    private String firstName;
    private String lastName;
    private String billingList1;
    private String billingList2;
    private String city;
    private String state;
    private String countryCode;
    //private Address address;
    private String zip;
    private String ccNum;
    private String cvv2;
    private PaymentInfoType__ ccType;
    private String expYear;
    private String expMonth;
    private String emailAddress;
    private Integer orderId;
    private String transactionId;
    private double finalTotal;
    private String paymentType;
    private String telephone;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getPaymentTimestamp() {
        return paymentTimestamp;
    }

    public void setPaymentTimestamp(Timestamp paymentTimestamp) {
        this.paymentTimestamp = paymentTimestamp;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getBillingList1() {
        return billingList1;
    }

    public void setBillingList1(String billingList1) {
        this.billingList1 = billingList1;
    }

    public String getBillingList2() {
        return billingList2;
    }

    public void setBillingList2(String billingList2) {
        this.billingList2 = billingList2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    
//    public Address getAddress() {
//        return address;
//    }
//
//    public void setAddress(Address address) {
//        this.address = address;
//    }

    public String getCcNum() {
        return ccNum;
    }

    public void setCcNum(String ccNum) {
        this.ccNum = ccNum;
    }

    public void setCcType(PaymentInfoType__ ccType) {
        this.ccType = ccType;
    }

    public void setCvv2(String cvv2) {
        this.cvv2 = cvv2;
    }

    public void setExpMonth(String expMonth) {
        this.expMonth = expMonth;
    }

    public void setExpYear(String expYear) {
        this.expYear = expYear;
    }

    public PaymentInfoType__ getCcType() {
        return ccType;
    }

    public String getCvv2() {
        return cvv2;
    }

    public String getExpMonth() {
        return expMonth;
    }

    public String getExpYear() {
        return expYear;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public double getFinalTotal() {
        return finalTotal;
    }

    public void setFinalTotal(double finalTotal) {
        this.finalTotal = finalTotal;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    
    
}
