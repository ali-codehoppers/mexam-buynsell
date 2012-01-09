package com.mt.actions.part;

import com.mt.actions.AuthenticatedAction;

public class ShowAddPart extends AuthenticatedAction {

    private String message;
    private String error = "";
    private String info;

    public void setError(String error) {
        this.error = error;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public void setMessage(String message) {
        this.message = message;
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
