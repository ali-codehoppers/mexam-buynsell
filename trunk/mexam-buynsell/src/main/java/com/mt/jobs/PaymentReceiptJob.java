/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.jobs;

import com.mt.emails.PaymentReceiptEmail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 *
 * @author Muaz
 */
public class PaymentReceiptJob extends QuartzJobBean {

    private PaymentReceiptEmail paymentReceiptEmail;

    public void setPaymentReceiptEmail(PaymentReceiptEmail paymentReceiptEmail) {
        this.paymentReceiptEmail = paymentReceiptEmail;
    }
    @Override
    protected void executeInternal(JobExecutionContext jec) throws JobExecutionException {
        try {
            paymentReceiptEmail.execute();
        } catch (Exception e) {
            throw new JobExecutionException(e);
        }
    }
}
