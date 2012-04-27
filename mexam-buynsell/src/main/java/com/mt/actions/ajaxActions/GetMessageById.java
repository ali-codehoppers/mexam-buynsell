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

/**
 *
 * @author Muaz
 */
public class GetMessageById extends AuthenticatedAction {
    
    private MessageService messageService;
    private int id;
    private String jsonString="";

    public void setId(int id) {
        this.id = id;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }
    
    
   public String execute() throws Exception{
       Message message = messageService.getById(id);
       HashMap hashMap = new HashMap();
       hashMap.put("senderName", message.getSentBy().getFirstName()+" "+message.getSentBy().getLastName());
       hashMap.put("subject", message.getSubject());
       hashMap.put("message", message.getMessage());
       hashMap.put("sentTo", message.getSendTo().getName());
       
       jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(hashMap);
       return SUCCESS;
   }

    public String getJsonString() {
        return jsonString;
    }
   
    
}
