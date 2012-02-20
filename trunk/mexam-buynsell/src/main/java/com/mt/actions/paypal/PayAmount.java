/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.paypal;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Transaction;
import com.mt.hibernate.entities.User;
import com.mt.services.CompanyService;
import com.mt.services.TransactionService;
import com.opensymphony.xwork2.ActionContext;
import com.paypal.sdk.core.nvp.NVPDecoder;
import java.sql.Timestamp;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class PayAmount extends AuthenticatedAction implements SessionAware {

    private String firstName;
    private String lastName;
    private String address1;
    private String address2;
    private String zip;
    private String city;
    private String state;
    private double amount;
    private String creditCardNumber;
    private String cvv2Number;
    private String creditCardType;
    private String expdate_month;
    private String expdate_year;
    private String membershipType;
    private int duration;
    ////////////////////////////
    private CompanyService companyService;
    private TransactionService transactionService;
    private Map session;

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setCreditCardNumber(String creditCardNumber) {
        this.creditCardNumber = creditCardNumber;
    }

    public void setCreditCardType(String creditCardType) {
        this.creditCardType = creditCardType;
    }

    public void setCvv2Number(String cvv2Number) {
        this.cvv2Number = cvv2Number;
    }

    public void setExpdate_month(String expdate_month) {
        this.expdate_month = expdate_month;
    }

    public void setExpdate_year(String expdate_year) {
        this.expdate_year = expdate_year;
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

    public void setZip(String zip) {
        this.zip = zip;
    }

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setTransactionService(TransactionService transactionService) {
        this.transactionService = transactionService;
    }

    public void setMembershipType(String membershipType) {
        this.membershipType = membershipType;
        duration = Integer.parseInt(membershipType);
    }

    public void setSession(Map map) {
        this.session = map;
    }

    @Override
    public String execute() throws Exception {

//        creditCardNumber = "4025851196140692";

        
        
        PaymentInfo paymentInfo = new PaymentInfo();
        paymentInfo.setCcNum(creditCardNumber);
        paymentInfo.setCvv2(cvv2Number);
        paymentInfo.setFirstName(firstName);
        paymentInfo.setLastName(lastName);
        paymentInfo.setExpMonth(expdate_month);
        paymentInfo.setExpYear(expdate_year);
        paymentInfo.setZip(zip);
        paymentInfo.setBillingList1(address1);
        paymentInfo.setBillingList2(address2);
        paymentInfo.setCity(city);
        paymentInfo.setState(state);
        paymentInfo.setCountryCode("US");
        paymentInfo.setPaymentType(creditCardType);
//        paymentInfo.setEmailAddress(email);
//        paymentInfo.setTelephone(telephone);

        if (membershipType.equals("1")) {
            amount = 5.0;
        } else if (membershipType.equals("3")) {
            amount = 10.0;
        } else if (membershipType.equals("12")) {
            amount = 25.0;
        }

        PaypalIntegration paypalIntegration = new PaypalIntegration();
        NVPDecoder response = paypalIntegration.DoDirectPaymentCode("Authorization", paymentInfo, "" + amount);

        if (response.get("ACK").compareTo("Failure") == 0) {
            return "fail";
        } else {
            User user = getUser();
            Company company = companyService.getById(user.getCompanyId());

            Transaction transaction = new Transaction();

            Timestamp transactionTime = new Timestamp(System.currentTimeMillis());

            transaction.setCompany(company);
            transaction.setAmount(amount);
            transaction.setTransactionDate(transactionTime);
            transaction.setCreatedBy(getUser().getId());
            transaction.setCreationDate(transactionTime);
            transaction.setTransactionId(response.get("TRANSACTIONID"));
            transaction.setSubscriptionDuration(duration);

            if (company.getExpiryDate() != null && company.getExpiryDate().compareTo(transactionTime) <= 0) {
                Timestamp expiryDate = transactionTime;
                expiryDate.setMonth(transactionTime.getMonth() + duration);
                company.setExpiryDate(transactionTime);
            } else {
                Timestamp expiryDate = company.getExpiryDate();
                expiryDate.setMonth(expiryDate.getMonth() + duration);
                company.setExpiryDate(expiryDate);
            }
            user.getCompany().setIsExpired(false);
            company.setIsExpired(false);
            
            session.put("user", user);

            companyService.update(company);
            transactionService.addNew(transaction);

            session.put("firstName", firstName);
            session.put("lastName", lastName);
            session.put("address1", address1);
            session.put("address2", address2);
            session.put("zip", zip);
            session.put("city", city);
            session.put("state", state);
            session.put("amount", amount);
            session.put("creditCardNumber", creditCardNumber);
            session.put("creditCardType", creditCardType);

            return SUCCESS;

        }

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

    public String getSecureCreditCardNumber() {
        int length = creditCardNumber.length();
        String secureString = "XXXXXXXXXXXXXXXXXXXX";
        return (secureString.substring(0, length - 4) + creditCardNumber.substring(length - 4));
    }

    public String getCreditCardType() {
        return creditCardType;
    }

    public String getExpdate_month() {
        return expdate_month;
    }

    public String getExpdate_year() {
        return expdate_year;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getState() {
        return state;
    }

    public String getZip() {
        return zip;
    }
}
