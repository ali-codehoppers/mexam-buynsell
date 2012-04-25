/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Email;
import com.mt.hibernate.entities.RFQ;
import com.mt.hibernate.entities.RFQItem;
import com.mt.services.EmailService;
import com.mt.services.RFQItemService;
import com.mt.services.RFQService;
import java.sql.Timestamp;

/**
 *
 * @author Muaz
 */
public class UpdateRFQ extends AuthenticatedAction {

    private int id;
    private int price;
    private int quantity;
    private boolean shouldEmail;
    private RFQItemService rFQItemService;
    private EmailService emailService;
    private RFQService rFQService;

    public void setPrice(int price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setShouldEmail(boolean shouldEmail) {
        this.shouldEmail = shouldEmail;
    }

    public void setrFQItemService(RFQItemService rFQItemService) {
        this.rFQItemService = rFQItemService;
    }

    public void setEmailService(EmailService emailService) {
        this.emailService = emailService;
    }

    public void setrFQService(RFQService rFQService) {
        this.rFQService = rFQService;
    }

    @Override
    public String execute() throws Exception {
        RFQItem rfqItem = rFQItemService.getById(id);
        rfqItem.setPrice(price);
        rfqItem.setQuantity(quantity);
        rFQItemService.update(rfqItem);
        /*
         * List<String> searchFields = new ArrayList<String>(); List<String>
         * searchOpers = new ArrayList<String>(); List<String> searchStrings =
         * new ArrayList<String>(); // search if already entered.. based on
         * type, transaction id, &created by /earchFields.add("createdBy");
         * searchOpers.add("eq"); searchStrings.add(""+getUser().getId());
         * searchFields.add("transactionId"); searchOpers.add("eq");
         * searchStrings.add(""+rfqItem.getRfqId()); searchFields.add("type");
         * searchOpers.add("eq"); searchStrings.add("RFQ_RESPONDED"); =
         * .getBy(getStringArray(searchFields), getStringArray(searchStrings),
         * getStringArray(searchOpers), sidx, sord, rows, page);
         */
        
        if (shouldEmail) {
            RFQ rfq = rfqItem.getRfq();
            rfq.setIsReplied(true);
            rFQService.addOrUpdate(rfq);
            Email email = new Email();
            email.setIsSent(0);
            email.setTransactionId(rfqItem.getRfqId());
            email.setType("RFQ_RESPONDED");
            email.setCreatedBy((long) getUser().getId());
            email.setUpdatedBy((long) getUser().getId());
            email.setCreationDate(new Timestamp(System.currentTimeMillis()));
            email.setUpdateDate(new Timestamp(System.currentTimeMillis()));
            emailService.addNew(email);
        }

        return SUCCESS;
    }
}
