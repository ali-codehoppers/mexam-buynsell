/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.paypal;

import com.paypal.sdk.exceptions.PayPalException;
import com.paypal.sdk.profiles.APIProfile;
import com.paypal.sdk.profiles.ProfileFactory;
//import com.paypal.sdk.services.CallerServices;
import com.paypal.sdk.services.NVPCallerServices;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author AmierHaider
 */
public class PaypalIntegration__ {

    public final static String COUNTRY_CODE = "US";
    public final static String CURRENCY_CODE = "USD";
    private final static String CLASS_NAME = PaypalIntegration__.class.getName();
    private final static Logger LOGGER = Logger.getLogger(CLASS_NAME);
    public static String paypalEnvironment;
    public static String paypalAPIUsername;
    public static String paypalAPIPassword;
    public static String paypalAPIPvtKeyPassword;
    public static String paypalAPICertFile;
    private NVPCallerServices caller = null;
    public final static String returnURL = "/payPalComplete";
    public final static String cancelURL = "/paypalCancel";
    Properties prop = new Properties();

//
//    
//
//    private static CreditCardTypeType convertToPaypalCcType(PaymentInfo paymentInfo) {
//        String ccType = paymentInfo.getCcType();
//        if (ccType.equals(PaymentInfo.paymentOption_VISA)) {
//            return CreditCardTypeType.Visa;
//        }
//        if (ccType.equals(PaymentInfo.paymentOption_MASTERCARD)) {
//            return CreditCardTypeType.MasterCard;
//        }
//        if (ccType.equals(PaymentInfo.paymentOption_AMEX)) {
//            return CreditCardTypeType.Amex;
//        }
//        if (ccType.equals(PaymentInfo.paymentOption_DISCOVER)) {
//            return CreditCardTypeType.Discover;
//        }
//        return null;
//    }
    public PaypalIntegration__() throws Exception {
        InputStream is = PaypalIntegration__.class.getResourceAsStream("/payPal.properties");
        prop.load(is);

        paypalAPIUsername = prop.getProperty("paypalAPIUsername");
        paypalAPIPassword = prop.getProperty("paypalAPIPassword");
        paypalAPIPvtKeyPassword = prop.getProperty("paypalAPIPvtKeyPassword");
        paypalAPICertFile = prop.getProperty("paypalAPICertFile");
        paypalEnvironment = prop.getProperty("paypalEnvironment");

    }

    public String DoDirectPaymentCode(String paymentAction, PaymentInfo paymentInfo, String amount) {

      //  CallerServices caller = new CallerServices();
        try {

            APIProfile profile = ProfileFactory.createSSLAPIProfile();

            profile.setAPIUsername(paypalAPIUsername);
            profile.setAPIPassword(paypalAPIPassword);
            profile.setPrivateKeyPassword(paypalAPIPvtKeyPassword);
            profile.setCertificateFile(paypalAPICertFile);
            profile.setEnvironment(paypalEnvironment);
            caller.setAPIProfile(profile);
            
      
        } catch (PayPalException ex) {
            Logger.getLogger(PaypalIntegration__.class.getName()).log(Level.SEVERE, null, ex);

            ex.printStackTrace();
        }



        return "";

    }
//    public String DoDirectPaymentCode(String paymentAction, PaymentInfo paymentInfo, String amount) {
//
////        CallerServices caller = new CallerServices();
//
//        NVPEncoder encoder = new NVPEncoder();
//        NVPDecoder decoder = new NVPDecoder();
//
//        try {
//            caller = new NVPCallerServices();
//            APIProfile profile = ProfileFactory.createSSLAPIProfile();
//
//            profile.setAPIUsername(paypalAPIUsername);
//            profile.setAPIPassword(paypalAPIPassword);
//            profile.setPrivateKeyPassword(paypalAPIPvtKeyPassword);
//            //profile.setSignature("AVGidzoSQiGWu.lGj3z15HLczXaaAcK6imHawrjefqgclVwBe8imgCHZ");
//            File file = new File(paypalAPICertFile);
//            boolean res = file.exists();
//            profile.setCertificateFile(paypalAPICertFile);
//            profile.setEnvironment(paypalEnvironment);
//            caller.setAPIProfile(profile);
//
//            encoder.add("VERSION", "86.0");
//            encoder.add("METHOD", "DoDirectPayment");
//            // Add request-specific fields to the request string.
//
//
//
//            encoder.add("PAYMENTACTION", paymentAction);
//            //encoder.add("AMT", amount);
//            encoder.add("AMT", "100");
//            encoder.add("CURRENCYCODE", CURRENCY_CODE);
//            encoder.add("CREDITCARDTYPE", paymentInfo.getPaymentType());
//            encoder.add("ACCT", paymentInfo.getCcNum());
//            //encoder.add("EXPDATE", "01/2017");
//            encoder.add("EXPDATE", paymentInfo.getExpMonth() + "/" + paymentInfo.getExpYear());
//            encoder.add("CVV2", paymentInfo.getCvv2());
//            encoder.add("FIRSTNAME", paymentInfo.getFirstName());
//            encoder.add("LASTNAME", paymentInfo.getLastName());
//            encoder.add("STREET", paymentInfo.getBillingList1());
//            encoder.add("CITY", paymentInfo.getCity());
//            encoder.add("STATE", paymentInfo.getState());
//            encoder.add("ZIP", paymentInfo.getZip());
//            encoder.add("COUNTRYCODE", paymentInfo.getCountryCode());
//            encoder.add("EMAIL", paymentInfo.getEmailAddress());
//            ////
//            //encoder.add("RETURNURL", returnURL);
//            //encoder.add("CANCELURL", cancelURL);
//
//            //paypalAPIPvtKeyPassword // Execute the API operation and obtain the response.
//            String NVPRequest = encoder.encode();
//            String NVPResponse = (String) caller.call(NVPRequest);
//            decoder.decode(NVPResponse);
//
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        return decoder.get("ACK");
//
//
//    }

    /*
     * public String RefundTransactionCode(String refundType, String
     * transactionId, String amount, String note) { NVPEncoder encoder = new
     * NVPEncoder(); NVPDecoder decoder = new NVPDecoder(); NVPCallerServices
     * caller = null;
     *
     * try { caller = new NVPCallerServices(); APIProfile profile =
     * ProfileFactory.createSignatureAPIProfile(); /* WARNING: Do not embed
     * plaintext credentials in your application code. Doing so is insecure and
     * against best practices. Your API credentials must be handled securely.
     * Please consider encrypting them for use in any production environment,
     * and ensure that only authorized individuals may view or modify them.
     */
    // Set up your API credentials, PayPal end point, API operation and version.
/*
     * profile.setAPIUsername("sdk-three_api1.sdk.com");
     * profile.setAPIPassword("QFZCWN5HZM8VBG7Q");
     * profile.setSignature("AVGidzoSQiGWu.lGj3z15HLczXaaAcK6imHawrjefqgclVwBe8imgCHZ");
     * profile.setEnvironment("sandbox"); profile.setSubject("");
     * caller.setAPIProfile(profile); encoder.add("VERSION", "51.0");
     * encoder.add("METHOD", "RefundTransaction");
     *
     * // Add request-specific fields to the request string.
     * encoder.add("REFUNDTYPE", refundType); encoder.add("TRANSACTIONID",
     * transactionId); if ((refundType != null) && (refundType.length() > 0) &&
     * (refundType.equalsIgnoreCase("Partial"))) { encoder.add("AMT", amount); }
     * encoder.add("NOTE", note);
     *
     * // Execute the API operation and obtain the response. String NVPRequest
     * = encoder.encode(); String NVPResponse = (String)
     * caller.call(NVPRequest); decoder.decode(NVPResponse); } catch (Exception
     * ex) {
     *
     * ex.printStackTrace(); } return decoder.get("ACK"); }
     */
}
