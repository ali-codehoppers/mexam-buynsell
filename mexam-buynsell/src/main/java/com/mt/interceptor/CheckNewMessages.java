/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.interceptor;

import com.mt.hibernate.entities.Message;
import com.mt.hibernate.entities.User;
import com.mt.services.MessageService;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SessionFactory;

/**
 *
 * @author Muaz
 */
public class CheckNewMessages extends AbstractInterceptor {

    private MessageService messageService;
    private UserService userService;
    private SessionFactory sessionFactory;
    public final static String MUST_AUTHENTICATE = "mustAuthenticate";

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public String intercept(ActionInvocation invocation) throws Exception {
        User user = null;
        HttpServletRequest request = ServletActionContext.getRequest();
        int messageCount;
        userService.setSessionFactory(sessionFactory);
        user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            System.out.println("redirecting to login");
            return MUST_AUTHENTICATE;
        } else {
            invocation.getStack().setValue("user", user);

            List<Message> messages = messageService.findCountByType(user.getCompanyId());
            long totalCount = 0;
            for (int i = 0; i < messages.size(); i++) {
                if (messages.get(i).getType().compareTo("RFQ") == 0) {
                    request.getSession().putValue("rfqMessageCount", messages.get(i).getCount());
                } else if (messages.get(i).getType().compareTo("USER") == 0) {
                    request.getSession().putValue("userMessageCount", messages.get(i).getCount());
                }
                totalCount += messages.get(i).getCount();
            }
            request.getSession().putValue("totalMessageCount", totalCount);
            return invocation.invoke();
        }
    }
}