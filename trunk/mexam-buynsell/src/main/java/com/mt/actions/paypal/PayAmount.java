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
public class PayAmount  extends ActionSupport{
    
     @Override
    public String execute() throws Exception {
         
         PaypalIntegration paypalIntegration = new PaypalIntegration();
         String res = paypalIntegration.DoDirectPaymentCode("", new PaymentInfo(), "100");
         return "";
         
     }
    
    
}
