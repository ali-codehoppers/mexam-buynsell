/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.User;

import com.mt.hibernate.entities.User;
import com.mt.services.UserService;
import com.opensymphony.xwork2.ActionSupport;
import java.math.BigInteger;
import java.security.MessageDigest;

/**
 *
 * @author Muaz
 */
public class SaveEditPassword extends ActionSupport {

    private String oldPassword;
    private String newPassword;
    private User user;
    private String errorType;
    private UserService userService;

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String execute() throws Exception {
        boolean valid = true;
        if (oldPassword == null || oldPassword.length() == 0) {
            valid = false;
        }
        if (newPassword == null || newPassword.length() == 0) {
            valid = false;
        }
        if (valid == false) {
            errorType = "PASSWORD_EMPTY";
            return "fail";
        }
        MessageDigest mdEnc = MessageDigest.getInstance("MD5"); // Encryption algorithm
        mdEnc.update(oldPassword.getBytes(), 0, oldPassword.length());
        String oldPasswordMD5 = new BigInteger(1, mdEnc.digest()).toString(16);
        if (user.getPassword().compareTo(oldPasswordMD5) == 0) {
            mdEnc = MessageDigest.getInstance("MD5"); // Encryption algorithm
            mdEnc.update(newPassword.getBytes(), 0, newPassword.length());
            String newPasswordMD5 = new BigInteger(1, mdEnc.digest()).toString(16);
            user.setPassword(newPasswordMD5);
            userService.addOrUpdate(user);
            return SUCCESS;
        } else {
            errorType = "PASSWORD_MISMATCH";
            return "fail";
        }
    }

    public String getErrorType() {
        return errorType;
    }
}
