/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.jobs;

import com.mt.emails.ForgotPasswordEmail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 *
 * @author Muaz
 */
public class ForgotPasswordJob extends QuartzJobBean {

    private ForgotPasswordEmail forgotPasswordEmail;

    public void setForgotPasswordEmail(ForgotPasswordEmail forgotPasswordEmail) {
        this.forgotPasswordEmail = forgotPasswordEmail;
    }
    @Override
    protected void executeInternal(JobExecutionContext jec) throws JobExecutionException 
    {
        try {
            forgotPasswordEmail.execute();
        }
        catch(Exception e) { throw new JobExecutionException(e); }
    }
}
