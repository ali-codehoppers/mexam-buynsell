/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.interceptor;

import com.mt.hibernate.entities.Message;
import com.mt.hibernate.entities.User;
import com.mt.services.MessageService;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Administrator
 */
public class Autherntication extends AbstractInterceptor {

    private MessageService messageService;
    public final static String MUST_AUTHENTICATE = "mustAuthenticate";

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public String intercept(ActionInvocation invocation) throws Exception {
        User user = null;
        HttpServletRequest request = ServletActionContext.getRequest();

        try {
            user = (User) request.getSession().getAttribute("user");

        } catch (IllegalStateException ise) {
            user = null;
            System.out.println("Session already expired : " + ise.toString());
        }


        if (user == null) {
            System.out.println("redirecting to login");
            return MUST_AUTHENTICATE;
        } else {
            invocation.getStack().setValue("user", user);
            List<Message> messages = messageService.findCountByType(user.getCompanyId());
            long totalMessageCount = 0;
            long rfqMessageCount = 0;
            long userMessageCount = 0;
            long bnsMessageCount = 0;
            for (int i = 0; i < messages.size(); i++) {
                if (messages.get(i).getType().compareTo("RFQ") == 0) {
                    rfqMessageCount = messages.get(i).getCount();
                } else if (messages.get(i).getType().compareTo("USER") == 0) {
                    userMessageCount = messages.get(i).getCount();
                } else if (messages.get(i).getType().compareTo("BNS") == 0) {
                    bnsMessageCount = messages.get(i).getCount();
                }
                totalMessageCount += messages.get(i).getCount();
            }
            request.getSession().putValue("totalMessageCount", totalMessageCount);
            request.getSession().putValue("userMessageCount", userMessageCount);
            request.getSession().putValue("rfqMessageCount", rfqMessageCount);
            request.getSession().putValue("bnsMessageCount", bnsMessageCount);
            return invocation.invoke();
        }
    }
}
