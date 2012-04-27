/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.Message;

import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Message;
import com.mt.services.MessageService;
import java.util.List;

/**
 *
 * @author Muaz
 */
public class ShowMessages extends AuthenticatedAction {

    private MessageService messageService;
    private long rfqMessageCount = 0;
    private long userMessageCount = 0;
    private long bnsMessageCount = 0;
    private String type;

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String execute() throws Exception {
        List<Message> messages = messageService.findCountByType(getUser().getCompanyId());

        for (int i = 0; i < messages.size(); i++) {
            if (messages.get(i).getType().compareTo("RFQ") == 0) {
                rfqMessageCount = messages.get(i).getCount();
            } else if (messages.get(i).getType().compareTo("USER") == 0) {
                userMessageCount = messages.get(i).getCount();
            } else if (messages.get(i).getType().compareTo("BNS") == 0) {
                bnsMessageCount = messages.get(i).getCount();
            }

        }

        return SUCCESS;
    }

    public long getRfqMessageCount() {
        return rfqMessageCount;
    }

    public long getUserMessageCount() {
        return userMessageCount;
    }

    public long getBnsMessageCount() {
        return bnsMessageCount;
    }

    public String getType() {
        return type;
    }
    
}
