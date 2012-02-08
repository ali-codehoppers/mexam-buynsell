package com.mt.actions.paypal;

import java.sql.Timestamp;

public class PaymentInfo {

    private int id;
    private Timestamp paymentTimestamp;
    private String firstName;
    private String lastName;
    private Address address;
    private String zip;
    private String ccNum;
    private String cvv2;
    private PaymentInfoType ccType;
    private Integer expYear;
    private Integer expMonth;
    private String emailAddress;
    private Integer orderId;
    private String transactionId;
    private double finalTotal;

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

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getCcNum() {
        return ccNum;
    }

    public void setCcNum(String ccNum) {
        this.ccNum = ccNum;
    }

    public void setCcType(PaymentInfoType ccType) {
        this.ccType = ccType;
    }

    public void setCvv2(String cvv2) {
        this.cvv2 = cvv2;
    }

    public void setExpMonth(Integer expMonth) {
        this.expMonth = expMonth;
    }

    public void setExpYear(Integer expYear) {
        this.expYear = expYear;
    }

    public PaymentInfoType getCcType() {
        return ccType;
    }

    public String getCvv2() {
        return cvv2;
    }

    public Integer getExpMonth() {
        return expMonth;
    }

    public Integer getExpYear() {
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

}
