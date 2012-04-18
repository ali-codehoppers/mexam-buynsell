/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.paypal;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Company;
import com.mt.hibernate.entities.Transaction;
import com.mt.hibernate.entities.Address;
import com.mt.hibernate.entities.Email;
import com.mt.hibernate.entities.User;
import com.mt.services.AddressService;
import com.mt.services.CompanyService;
import com.mt.services.EmailService;
import com.mt.services.TransactionService;
import com.paypal.sdk.core.nvp.NVPDecoder;
import java.sql.Timestamp;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class PayAmount extends AuthenticatedAction implements SessionAware {

    private String firstName;
    private String lastName;
    private String billingAddress1;
    private String billingAddress2;
    private String billingZip;
    private String billingCity;
    private String billingState;
    private String shippingAddress1;
    private String shippingAddress2;
    private String shippingZip;
    private String shippingCity;
    private String shippingState;
    private int shippingIsSame;
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
    private AddressService addressService;
    private EmailService emailService;   
    private Map session;

    public void setAmount(double amount) {
        this.amount = amount;
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

    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }

    public void setTransactionService(TransactionService transactionService) {
        this.transactionService = transactionService;
    }

    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

    public void setEmailService(EmailService emailService) {
        this.emailService = emailService;
    }

    public void setMembershipType(String membershipType) {
        this.membershipType = membershipType;
        duration = Integer.parseInt(membershipType);
    }

    public void setSession(Map map) {
        this.session = map;
    }

    public void setBillingAddress1(String billingAddress1) {
        this.billingAddress1 = billingAddress1;
    }

    public void setBillingAddress2(String billingAddress2) {
        this.billingAddress2 = billingAddress2;
    }

    public void setBillingCity(String billingCity) {
        this.billingCity = billingCity;
    }

    public void setBillingState(String billingState) {
        this.billingState = billingState;
    }

    public void setBillingZip(String billingZip) {
        this.billingZip = billingZip;
    }

    public void setShippingAddress1(String shippingAddress1) {
        this.shippingAddress1 = shippingAddress1;
    }

    public void setShippingAddress2(String shippingAddress2) {
        this.shippingAddress2 = shippingAddress2;
    }

    public void setShippingCity(String shippingCity) {
        this.shippingCity = shippingCity;
    }

    public void setShippingState(String shippingState) {
        this.shippingState = shippingState;
    }

    public void setShippingZip(String shippingZip) {
        this.shippingZip = shippingZip;
    }

    public void setShippingIsSame(int shippingIsSame) {
        this.shippingIsSame = shippingIsSame;
    }

    @Override
    public String execute() throws Exception {

        boolean valid = true;
        if (firstName == null || firstName.length() < 1) {
            session.put("paypal_firstName", "First name is missing.");
            valid = false;
        }

        if (lastName == null || lastName.length() < 1) {
            session.put("paypal_lastName", "Last name is missing.");
            valid = false;
        }

        if (billingAddress1 == null || billingAddress1.length() < 1) {
            session.put("paypal_address1", "Address is missing.");
            valid = false;
        }

        if (billingCity == null || billingCity.length() < 1) {
            session.put("paypal_city", "City is missing.");
            valid = false;
        }

        if (billingZip == null || billingZip.length() < 1) {
            session.put("paypal_zip", "Zip code is missing.");
            valid = false;
        } else if (billingZip.length() < 5) {
            session.put("paypal_zip", "Zip code is invalid.");
            valid = false;
        }

        if (billingState == null || billingState.length() < 1) {
            session.put("paypal_state", "State is missing.");
            valid = false;
        }

        if (creditCardNumber == null || creditCardNumber.length() < 1) {
            session.put("paypal_creditCardNumber", "Creditcard number is missing.");
            valid = false;
        } else if (creditCardNumber.length() < 14) {
            session.put("paypal_creditCardNumber", "Invalid creditcard number.");
            valid = false;
        }


        if (cvv2Number == null || cvv2Number.length() < 1) {
            session.put("paypal_cvv2Number", "Verification number is missing.");
            valid = false;

        } else if (cvv2Number.length() < 3) {
            session.put("paypal_cvv2Number", "Invalid verification number.");
            valid = false;
        }


        if (!valid) {
            return INPUT;
        }
        PaymentInfo paymentInfo = new PaymentInfo();
        paymentInfo.setCcNum(creditCardNumber);
        paymentInfo.setCvv2(cvv2Number);
        paymentInfo.setFirstName(firstName);
        paymentInfo.setLastName(lastName);
        paymentInfo.setExpMonth(expdate_month);
        paymentInfo.setExpYear(expdate_year);
        paymentInfo.setZip(billingZip);
        paymentInfo.setBillingList1(billingAddress1);
        paymentInfo.setBillingList2(billingAddress2);
        paymentInfo.setCity(billingCity);
        paymentInfo.setState(billingState);
        paymentInfo.setCountryCode(
                "US");
        paymentInfo.setPaymentType(creditCardType);
//        paymentInfo.setEmailAddress(email);
//        paymentInfo.setTelephone(telephone);


        if (membershipType.equals(
                "1")) {
            amount = 5.0;
        } else if (membershipType.equals(
                "3")) {
            amount = 10.0;
        } else if (membershipType.equals(
                "12")) {
            amount = 25.0;
        }
        PaypalIntegration paypalIntegration = new PaypalIntegration();
        NVPDecoder response = paypalIntegration.DoDirectPaymentCode("Authorization", paymentInfo, "" + amount);
        if (response == null || response.get("ACK") == null) {
            return "null";
        }
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
            int transId = transactionService.addNew(transaction);
            Address address = new Address();
            address.setTransId(transId);
            address.setAddress1(billingAddress1);
            address.setAddress2(billingAddress2);
            address.setCity(billingCity);
            address.setState(billingState);
            address.setZip(billingZip);
            address.setCountry("US");
            address.setType("b");
            int billingId = addressService.addNew(address);
            address = new Address();
            address.setTransId(transId);
            address.setAddress1(shippingAddress1);
            address.setAddress2(shippingAddress2);
            address.setCity(shippingCity);
            address.setState(shippingState);
            address.setZip(shippingZip);
            address.setCountry("US");
            address.setType("s");
            int shippingId = addressService.addNew(address);
            if (shippingIsSame != 1) {
                shippingIsSame = 0;
            }
            transaction = transactionService.getById(transId);
            transaction.setBillingAddressId(billingId);
            transaction.setShippingAddressId(shippingId);
            transaction.setShippingIsSame(shippingIsSame);
            transactionService.update(transaction);
            session.put("firstName", firstName);
            session.put("lastName", lastName);
            session.put("address1", billingAddress1);
            session.put("address2", billingAddress2);
            session.put("zip", billingZip);
            session.put("city", billingCity);
            session.put("state", billingState);
            session.put("amount", amount);
            session.put("creditCardNumber", creditCardNumber);
            session.put("creditCardType", creditCardType);

            Email email = new Email();
            email.setIsSent(0);
            email.setType("PAYMENT_RECEIPT");
            email.setTransactionId(transId);
            email.setCreatedBy(user.getId());
            emailService.addNew(email);
            
            return SUCCESS;

        }
    }

    public double getAmount() {
        return amount;
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

    public String getBillingAddress1() {
        return billingAddress1;
    }

    public String getBillingAddress2() {
        return billingAddress2;
    }

    public String getBillingCity() {
        return billingCity;
    }

    public String getBillingState() {
        return billingState;
    }

    public String getBillingZip() {
        return billingZip;
    }

    public String getShippingAddress1() {
        return shippingAddress1;
    }

    public String getShippingAddress2() {
        return shippingAddress2;
    }

    public String getShippingCity() {
        return shippingCity;
    }

    public String getShippingState() {
        return shippingState;
    }

    public String getShippingZip() {
        return shippingZip;
    }

    public int getShippingIsSame() {
        return shippingIsSame;
    }
}
