/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.interceptor;

import com.mt.hibernate.entities.User;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SessionFactory;

/**
 *
 * @author Administrator
 */
public class BaseAuthenticationInterceptor extends AbstractInterceptor {

    private UserService userService;
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    public final static String MUST_AUTHENTICATE = "mustAuthenticate";

    public String intercept(ActionInvocation invocation) throws Exception {
        User user = null;
        HttpServletRequest request = ServletActionContext.getRequest();
        userService.setSessionFactory(sessionFactory);
        try {
            if (request != null) {
                user = (User) request.getSession().getAttribute("user");
                if (user == null) {
                    Cookie cookies[] = request.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("userCookie")) {
                                String username = cookie.getValue();
                                List<User> userList = userService.findByUsername(username);
                                if (userList.size() > 0) {
                                    user = userList.get(0);
                                    request.getSession().putValue("user", user);
                                }
                            }
                        }
                    }
                }
            }
        } catch (IllegalStateException ise) {
            user = null;
            ise.printStackTrace();
        }
        return invocation.invoke();
    }
}
