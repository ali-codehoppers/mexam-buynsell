/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Message;
import com.mt.services.MessageService;

/**
 *
 * @author Muaz
 */
public class DeleteMessage extends AuthenticatedAction {

    private int id;
    private String opers;
    private MessageService messageService;

    public void setId(int id) {
        this.id = id;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public void setOpers(String opers) {
        this.opers = opers;
    }

    public String execute() throws Exception {
        Message message = messageService.getById(id);
        message.setDeleted(true);
        messageService.addOrUpdate(message);
        return SUCCESS;
    }
}
