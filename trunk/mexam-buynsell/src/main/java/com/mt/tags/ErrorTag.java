/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.tags;

import com.opensymphony.xwork2.ActionContext;
import java.io.IOException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class ErrorTag extends TagSupport {

    String name = "";

    @Override
    public int doStartTag() throws JspException {
        JspWriter out = pageContext.getOut();
//        HttpSession session = pageContext.getSession();
//
//        if(session.getAttribute(id))
        ServletRequest request = pageContext.getRequest();
        Map session = ActionContext.getContext().getSession();
        if (request.getAttribute(name) != null) {
            try {
                out.print(request.getAttribute(name));
            } catch (IOException ex) {
                Logger.getLogger(ErrorTag.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (name != null && name.length() > 0) {
            if (session.containsKey(name)) {
                try {
                    out.print(session.get(name).toString());
                    session.remove(name);
                } catch (IOException ex) {
                    Logger.getLogger(ErrorTag.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return SKIP_BODY;
    }

    public void setName(String name) {
        this.name = name;
    }
}
