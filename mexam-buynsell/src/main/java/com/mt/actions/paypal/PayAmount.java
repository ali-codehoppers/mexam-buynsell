/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.paypal;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Transaction;
import com.mt.services.CompanyService;
import com.mt.services.TransactionService;
import com.paypal.sdk.core.nvp.NVPDecoder;
import java.sql.Timestamp;

public class PayAmount extends AuthenticatedAction {

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
    private int expdate_month;
    private int expdate_year;
    private String membershipType;
    private int duration;
    ////////////////////////////
    private CompanyService companyService;
    private TransactionService transactionService;

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

    public void setExpdate_month(int expdate_month) {
        this.expdate_month = expdate_month;
    }

    public void setExpdate_year(int expdate_year) {
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

    @Override
    public String execute() throws Exception {

        PaymentInfo paymentInfo = new PaymentInfo();
        paymentInfo.setCcNum(creditCardNumber);
        paymentInfo.setCcNum(cvv2Number);
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


        paymentInfo.setCcNum("4025851196140692");
        PaypalIntegration paypalIntegration = new PaypalIntegration();
        NVPDecoder response = paypalIntegration.DoDirectPaymentCode("Authorization", paymentInfo, "" + amount);

        if (response.get("ACK").compareTo("Failure") == 0) {
            return "fail";
        } else {
            Company company = companyService.getById(getUser().getCompanyId());

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
            }
            else 
            {
                Timestamp expiryDate = company.getExpiryDate();
                expiryDate.setMonth(transactionTime.getMonth() + duration);
                company.setExpiryDate(expiryDate);
            }
            company.setIsExpired(false);
            companyService.update(company);
            transactionService.addNew(transaction);
            return SUCCESS;

        }

    }
}
