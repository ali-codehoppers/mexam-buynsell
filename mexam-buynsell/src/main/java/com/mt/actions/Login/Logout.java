/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Login;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.Cookie;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.CookiesAware;

public class Logout extends ActionSupport implements CookiesAware {

    private Map cookiesMap;

    public void setCookiesMap(Map cookiesMap) {
        this.cookiesMap = cookiesMap;
    }

    @Override
    public String execute() throws Exception {

        Map session = ActionContext.getContext().getSession();
        if (session.containsKey("user")) {
            session.remove("user");
        }
        if (cookiesMap.containsKey("userCookie")) {
            Cookie cookie = new Cookie("userCookie", "");
            cookie.setMaxAge(0);
            ServletActionContext.getResponse().addCookie(cookie);
        }

        return SUCCESS;
    }
}
