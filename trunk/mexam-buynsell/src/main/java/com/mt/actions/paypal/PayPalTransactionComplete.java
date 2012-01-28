/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.paypal;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.User;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class PayPalTransactionComplete extends AuthenticatedAction implements SessionAware {

    private String message;
    private String error;
    private String info;
    private Map session;
    private Map request;
    private User user;
    
    private String payment_status;

    public void setPayment_status(String payment_status) {
        this.payment_status = payment_status;
    }

    public void setSession(Map map) {
        this.session = map;
    }

    
    

    @Override
    public String execute() throws Exception {

        user = getUser();
        return SUCCESS;
    }

    public String getPayment_status() {
        return payment_status;
    }
    
}
