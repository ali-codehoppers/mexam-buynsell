/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.jobs;

import com.mt.emails.RFQRequestedEmail;
import com.mt.emails.RFQRespondedEmail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 *
 * @author Muaz
 */
public class RFQRespondedJob extends QuartzJobBean {

    private RFQRespondedEmail rFQRespondedEmail;

    public void setrFQRespondedEmail(RFQRespondedEmail rFQRespondedEmail) {
        this.rFQRespondedEmail = rFQRespondedEmail;
    }

    protected void executeInternal(JobExecutionContext jec) throws JobExecutionException {
        try {
            rFQRespondedEmail.execute();
        } catch (Exception e) {
            throw new JobExecutionException(e);
        }
    }
}
