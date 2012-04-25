/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.emails;

import com.mt.hibernate.entities.Email;
import com.mt.hibernate.entities.RFQ;
import com.mt.hibernate.entities.Template;
import com.mt.hibernate.entities.User;
import com.mt.services.EmailService;
import com.mt.services.RFQService;
import com.mt.services.TemplateService;
import com.mt.services.UserService;
import java.util.ArrayList;
import java.util.List;
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
public class RFQRequestedEmail extends BaseEmail {

    private EmailService emailService;
    private UserService userService;
    private RFQService rFQService;
    private TemplateService templateService;

    public RFQRequestedEmail(EmailService emailService, UserService userService, RFQService rFQService, TemplateService templateService) {
        this.emailService = emailService;
        this.userService = userService;
        this.rFQService = rFQService;
        this.templateService = templateService;
    }

    
    
    public void sendEmail() {
        System.out.println("Sending RFQ Request emails");
        List<Email> emails = new ArrayList<Email>();
        emails = emailService.findByType("RFQ_REQUESTED");
        for (int i = 0; i < emails.size(); i++) {
            Email email = emails.get(i);
            try {
                RFQ rfq = rFQService.getById(email.getTransactionId());
                List<User> users = userService.findByCompanyId(rfq.getReceiverId());
                User sendTo = users.get(0);
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
                        InternetAddress.parse(sendTo.getEmail()));
                message.setSubject("RFQ Requested");
                List<Template> templates = templateService.findByType("RFQ_REQUESTED");
                String body = templates.get(0).getBody();
                body = body.replace("##Name##", sendTo.getFirstName()+" "+sendTo.getLastName());
                body = body.replace("##CompanyName##",rfq.getSender().getCompany().getName());
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
