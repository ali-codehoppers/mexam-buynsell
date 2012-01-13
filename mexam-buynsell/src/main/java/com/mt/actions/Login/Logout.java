/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Login;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

public class Logout extends ActionSupport {

    @Override
    public String execute() throws Exception {

        Map session = ActionContext.getContext().getSession();
        if (session.containsKey("user")) {
            session.remove("user");
        }
        return SUCCESS;
    }
}
