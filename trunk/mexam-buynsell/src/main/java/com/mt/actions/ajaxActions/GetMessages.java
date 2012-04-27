/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.actions.ajaxActions;

import com.google.gson.GsonBuilder;
import com.google.gson.annotations.Expose;
import com.mt.actions.AuthenticatedAction;
import com.mt.hibernate.entities.Message;
import com.mt.services.MessageService;
import com.mt.util.RecordsJson;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Muaz
 */
public class GetMessages extends AuthenticatedAction {

    private int rows = 0;
    private int page = 0;
    private String type;
    private String sidx;
    private String sord;
    private String searchField;
    private String searchString;
    private String searchOper;
    private List<String> searchFields;
    private List<String> searchStrings;
    private List<String> searchOpers;
    private String jsonString = "";
    private MessageService messageService;
    private List<MessageExtended> messagesExtended;

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public void setSearchStrings(List<String> searchStrings) {
        this.searchStrings = searchStrings;
    }

    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public void setSord(String sord) {
        this.sord = sord;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String execute() throws Exception {
        searchFields = new ArrayList<String>();
        searchOpers = new ArrayList<String>();
        searchStrings = new ArrayList<String>();

        searchFields.add("sendToId");
        searchOpers.add("eq");
        searchStrings.add("" + getUser().getCompanyId());
        searchFields.add("type");
        searchOpers.add("eq");
        searchStrings.add("'" + type + "'");
        searchFields.add("deleted");
        searchOpers.add("eq");
        searchStrings.add("0");
        System.out.println(type);
        List<Message> messages = messageService.getBy(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers), sidx, sord, rows, page);
        long total = messageService.getRecordsCount(getStringArray(searchFields), getStringArray(searchStrings), getStringArray(searchOpers));
        messagesExtended = new ArrayList<MessageExtended>();
        for (Message message : messages) {
            MessageExtended messageExtended = new MessageExtended(message);
            messagesExtended.add(messageExtended);
        }

        RecordsJson<MessageExtended> recordsJson = new RecordsJson<MessageExtended>(page, rows, total, messagesExtended);
        jsonString = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(recordsJson);
        return SUCCESS;
    }

    public String getJsonString() {
        return jsonString;
    }

    protected String[] getStringArray(List<String> list) {
        return list.toArray(new String[list.size()]);
    }

    private class MessageExtended extends Message {

        @Expose
        private int id;
        @Expose
        private String senderName;
        @Expose
        private String subject;
        @Expose
        private String message;
        @Expose
        private boolean unread;

        public MessageExtended(Message message) {
            this.setId(message.getId());
            this.setSubject(message.getSubject());
            this.setMessage(message.getMessage());
            this.setUnread(message.isUnread());
            this.senderName=message.getSentBy().getFirstName()+" "+message.getSentBy().getLastName();
        }

        public String getSenderName() {
            return senderName;
        }
        
        
    }
}
