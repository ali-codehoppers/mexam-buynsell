/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.emails;

import com.mt.hibernate.entities.Email;
import com.mt.hibernate.entities.Template;
import com.mt.hibernate.entities.Transaction;
import com.mt.hibernate.entities.User;
import com.mt.services.EmailService;
import com.mt.services.TemplateService;
import com.mt.services.TransactionService;
import com.mt.services.UserService;
import java.text.Format;
import java.text.SimpleDateFormat;
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
public class PaymentReceiptEmail extends BaseEmail {

    private EmailService emailService;
    private UserService userService;
    private TransactionService transactionService;
    private TemplateService templateService;

    public PaymentReceiptEmail(EmailService emailService, UserService userService, TransactionService transactionService, TemplateService templateService) {
        this.emailService = emailService;
        this.userService = userService;
        this.transactionService = transactionService;
        this.templateService = templateService;
    }

    public void sendEmail() {
        System.out.println("Sending Payment Recipts");
        List<Email> emails = new ArrayList<Email>();
        emails = emailService.findByType("PAYMENT_RECEIPT");
        for (int i = 0; i < emails.size(); i++) {
            Email email = emails.get(i);
            try {

                Transaction transaction = transactionService.getById(emails.get(i).getTransactionId());
                User user = userService.getById((int) emails.get(i).getCreatedBy());
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
                message.setSubject("Payment Receipt");
                List<Template> templates = templateService.findByType("PAYMENT_RECEIPT");
                String body = templates.get(0).getBody();
                Format format = new SimpleDateFormat("MM/dd/yy");
                String date = format.format(transaction.getCompany().getExpiryDate());
                body = body.replace("##ExpiryDate##", date);
                body = body.replace("##CompanyName##", transaction.getCompany().getName());
                body = body.replace("##Address##", transaction.getBillingAddress().getAddress1()+" "+transaction.getBillingAddress().getAddress2());
                body = body.replace("##City##", transaction.getCompany().getCity());
                body = body.replace("##State##", transaction.getBillingAddress().getState().getName());
                body = body.replace("##Country##", transaction.getBillingAddress().getState().getCountry().getName());
                body = body.replace("##Zip##", transaction.getBillingAddress().getZip());
                body = body.replace("##Amount##", "" + transaction.getAmount());
                body = body.replace("##Months##", "" + transaction.getSubscriptionDuration());
                //message.setText(body);
                message.setContent(body, "text/html; charset=utf-8");
                Transport.send(message);
                email.setIsSent(1);
                emailService.addOrUpdate(email);

            } catch (Exception e) {
                e.printStackTrace();
                email.setNumberOfTries(email.getNumberOfTries() + 1);
                emailService.addOrUpdate(email);
            }
        }

    }
}
