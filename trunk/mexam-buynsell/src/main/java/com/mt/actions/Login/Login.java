/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Login;

import com.mt.hibernate.entities.User;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.CookiesAware;
import org.apache.struts2.interceptor.ServletResponseAware;

/**
 *
 * @author CodeHopper
 */
public class Login extends ActionSupport implements CookiesAware, ServletResponseAware {

    private String message;
    private String error = "";
    private String hasError = "";
    private String info;
    private String userName;
    private String password;
    private boolean rememberMe;
    private User user;
    private List<User> userList;
    private UserService userService;
    private String jsonString = "";
    private String userCookie;
    private Map cookiesMap;
    private HttpServletResponse response;

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setCookiesMap(Map cookiesMap) {
        this.cookiesMap = cookiesMap;
    }

    public void setUserCookie(String userCookie) {
        this.userCookie = userCookie;
    }

    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    public void setRememberMe(boolean rememberMe) {
        this.rememberMe = rememberMe;
    }

    @Override
    public void validate() {
        if (userName == null || userName.length() == 0) {
            addFieldError("userName", "User Name is required");
        }

        if (password == null || password.length() == 0) {
            addFieldError("password", getText("Password is required"));
        }
    }

    @Override
    public String execute() throws Exception {

        userList = userService.findByUsername(userName);

        if (userList == null || userList.isEmpty()) {
            error = "The username or password you entered is incorrect.";
            return "fail";
        } else {
            for (int i = 0; i < userList.size(); i++) {
                MessageDigest mdEnc = MessageDigest.getInstance("MD5"); // Encryption algorithm
                mdEnc.update(password.getBytes(), 0, password.length());
                String md5Password = new BigInteger(1, mdEnc.digest()).toString(16);
                if (userList.get(i).getPassword().compareTo(md5Password) == 0) {
                    User user = userList.get(i);
                    if (user.getCompany().getExpiryDate().compareTo(new Timestamp(System.currentTimeMillis())) < 0) {
                        user.getCompany().setIsExpired(true);
                        userService.update(user);
                    }
                    if (rememberMe) {
                        Cookie cookie = new Cookie("userCookie", userName);
                        cookie.setMaxAge(14 * 24 * 60 * 60);
                        ServletActionContext.getResponse().addCookie(cookie);

                        //System.out.println("In Remember");
                    }

                    Map session = ActionContext.getContext().getSession();
                    session.put("user", userList.get(i));


                    if (user.getCompany().isIsExpired()) {
                        return "expired";
                    } else {
                        return SUCCESS;
                    }
                }
            }
            error = "The username or password you entered is incorrect.";
        }
        return "fail";
    }

    public String getMessage() {
        return message;
    }

    public String getUserName() {
        return userName;
    }

    public String getError() {
        return error;
    }

    public String getInfo() {
        return info;
    }

    public String getJsonString() {
        return error;
    }

    public Map getCookiesMap() {
        return cookiesMap;
    }

    public String getUserCookie() {
        return userCookie;
    }
}
