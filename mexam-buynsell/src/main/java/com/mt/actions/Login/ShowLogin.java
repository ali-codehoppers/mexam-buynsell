/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Login;

import com.opensymphony.xwork2.ActionSupport;

public class ShowLogin extends ActionSupport {

    private String message;
    private String error = "";
    private String info;

    public void setMessage(String message) {
        this.message = message;
    }

    public void setError(String error) {
        this.error = error;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    public String getMessage() {
        return message;
    }

    public String getError() {
        return error;
    }

    public String getInfo() {
        return info;
    }
}
