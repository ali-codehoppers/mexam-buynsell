/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Registration;

import com.mt.hibernate.entities.Email;
import com.mt.hibernate.entities.User;
import com.mt.services.EmailService;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Muaz
 */
public class VerifyEmailAddress extends ActionSupport implements SessionAware{

    private String email;
    private UserService userService;
    private EmailService emailService;
    private Map session;

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public void setEmailService(EmailService emailService) {
        this.emailService = emailService;
    }
    

    public String execute() throws Exception {
        List<User> users = userService.findByEmail(email);
        session.put("emailInCheck", email);
        if (users.size() <= 0) {
            return "error";
        } else {
            Email email = new Email();
            email.setIsSent(0);
            email.setTransactionId(users.get(0).getId());
            email.setType("FORGOT_PASSWORD");
            emailService.addNew(email);
            return SUCCESS;
        }

    }
}
