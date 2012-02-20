/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.interceptor;

import com.mt.hibernate.entities.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Administrator
 */
public class MembershipAuthentication extends AbstractInterceptor {

    public final static String MEMBERSHIP_EXPIRED = "membershipExpired";

    public String intercept(ActionInvocation invocation) throws Exception {
        User user;
        HttpServletRequest request = ServletActionContext.getRequest();
        try {
            user = (User) request.getSession().getAttribute("user");
        } catch (IllegalStateException ise) {
            user = null;
            System.out.println("Session already expired : " + ise.toString());
        }

        if (user == null || user.getCompany().isIsExpired()) {
            return MEMBERSHIP_EXPIRED;
        } else {
            return invocation.invoke();
        }
    }
}
