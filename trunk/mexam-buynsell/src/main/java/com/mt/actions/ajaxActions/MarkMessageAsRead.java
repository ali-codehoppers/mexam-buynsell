/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Message;
import com.mt.services.MessageService;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Muaz
 */
public class MarkMessageAsRead extends AuthenticatedAction {

    private MessageService messageService;
    private int id;
    private String jsonString = "";

    public void setId(int id) {
        this.id = id;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public String execute() throws Exception {
        Message message = messageService.getById(id);
        message.setUnread(false);
        messageService.addOrUpdate(message);
        List<Message> messages = messageService.findCountByType(getUser().getCompanyId());
        HashMap hashMap = new HashMap();
        long totalMessageCount = 0;
        long rfqMessageCount = 0;
        long userMessageCount = 0;
        long bnsMessageCount = 0;
        for (int i = 0; i < messages.size(); i++) {
            if (messages.get(i).getType().compareTo("RFQ") == 0) {
                rfqMessageCount = messages.get(i).getCount();
            } else if (messages.get(i).getType().compareTo("USER") == 0) {
                userMessageCount = messages.get(i).getCount();
            } else if (messages.get(i).getType().compareTo("BNS") == 0) {
                bnsMessageCount = messages.get(i).getCount();
            }
            totalMessageCount += messages.get(i).getCount();
        }
        hashMap.put("totalMessageCount", totalMessageCount);
        hashMap.put("rfqMessageCount", rfqMessageCount);
        hashMap.put("userMessageCount", userMessageCount);
        hashMap.put("bnsMessageCount", bnsMessageCount);
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(hashMap);
        return SUCCESS;

    }

    public String getJsonString() {
        return jsonString;
    }
}
