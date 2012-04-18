/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.emails;

import com.mt.hibernate.entities.Email;
import com.mt.hibernate.entities.Template;
import com.mt.hibernate.entities.User;
import com.mt.services.EmailService;
import com.mt.services.TemplateService;
import com.mt.services.UserService;
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
public class ForgotPasswordEmail extends BaseEmail {

    private int count = 0;
    private EmailService emailService;
    private UserService userService;
    private TemplateService templateService;

    /*
     * public String execute() throws Exception { return SUCCESS; }
     */
    public ForgotPasswordEmail(EmailService emailService, UserService userService, TemplateService templateService) {
        this.emailService = emailService;
        this.userService = userService;
        this.templateService = templateService;
    }

    public void sendEmail() {
        System.out.println("Sending Forgot Password Emails");
        List<Email> emails = new ArrayList<Email>();
        emails = emailService.findByType("FORGOT_PASSWORD");
        for (int i = 0; i < emails.size(); i++) {
            Email email = emails.get(i);
            try {
                /*String a = null;
                a.charAt(1);*/
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
                List<Template> templates = templateService.findByType("FORGOT_PASSWORD");
                String body = templates.get(0).getBody();
                body = body.replace("##Name##", user.getFirstName());
                body = body.replace("##password##", newPassword);
                //message.setText(body);
                message.setContent(body, "text/html; charset=utf-8");
                Transport.send(message);
                email.setIsSent(1);
                emailService.addOrUpdate(email);

            } catch (Exception e) {
                email.setNumberOfTries(email.getNumberOfTries() + 1);
                emailService.addOrUpdate(email);
            }
        }
    }
}
