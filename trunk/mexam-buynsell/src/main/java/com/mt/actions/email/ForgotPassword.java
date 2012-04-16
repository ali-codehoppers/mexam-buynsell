/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.email;

import com.mt.hibernate.entities.Email;
import com.mt.hibernate.entities.User;
import com.mt.services.EmailService;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionSupport;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.*;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Muaz
 */
public class ForgotPassword extends ActionSupport {

    private int count = 0;
    private EmailService emailService;
    private UserService userService;

    public void setEmailService(EmailService emailService) {
        this.emailService = emailService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String execute() throws Exception {

        List<Email> emails = new ArrayList<Email>();
        emails = emailService.findByType("forgetPassword");
        for (int i = 0; i < emails.size(); i++) {
            User user = userService.getById(emails.get(i).getTransactionId());
            Random rand = new Random();
            String newPassword = "" + rand.nextInt(100000000);
            MessageDigest mdEnc = MessageDigest.getInstance("MD5"); // Encryption algorithm
            mdEnc.update(newPassword.getBytes(), 0, newPassword.length());
            String md5Password = new BigInteger(1, mdEnc.digest()).toString(16);
            user.setPassword(md5Password);
            userService.addOrUpdate(user);
            Session session = Session.getInstance(Emailer.properties,
                    new javax.mail.Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("buynsell.test@gmail.com", "codehoppers");
                        }
                    });


            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("buynsell.test@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(user.getEmail()));
            message.setSubject("Password Reset");
            message.setText("Your new password is "+newPassword);
            Transport.send(message);
        }
        return SUCCESS;
    }

    public void printMe() {
        // System.out.println("Muaz");
    }
}
