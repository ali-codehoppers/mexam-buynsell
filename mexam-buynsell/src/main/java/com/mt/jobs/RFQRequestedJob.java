/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.jobs;

import com.mt.emails.RFQRequestedEmail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 *
 * @author Muaz
 */
public class RFQRequestedJob extends QuartzJobBean {
    private RFQRequestedEmail rFQRequestedEmail;

    public void setrFQRequestedEmail(RFQRequestedEmail rFQRequestedEmail) {
        this.rFQRequestedEmail = rFQRequestedEmail;
    }
    
    protected void executeInternal(JobExecutionContext jec) throws JobExecutionException {
        try {
            rFQRequestedEmail.execute();
        } catch (Exception e) {
            throw new JobExecutionException(e);
        }
    }
    
}
