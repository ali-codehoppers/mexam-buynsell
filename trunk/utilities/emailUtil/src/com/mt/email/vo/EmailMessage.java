package com.mt.email.vo;

import java.util.ArrayList;
import java.util.List;

public class EmailMessage 
{

	private String subject;
	
	private String messageId;
	private String dateTime;
	
	private String body;
	
	private EmailAddress fromAddress = new EmailAddress(null, null);
	
	private List<EmailAddress> toAddressList;
	
	private List<EmailAddress> ccAddressList;
	
	private List<EmailAddress> bccAddressList;
	
	private List<Attachment> attachmentList;

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public EmailAddress getFromAddress() {
		return fromAddress;
	}
	
	public void setFromAddress(EmailAddress fromAddress) {
		this.fromAddress = fromAddress;
	}

	public List<EmailAddress> getToAddressList() {
		return toAddressList;
	}

	public void setToAddressList(List<EmailAddress> toAddressList) {
		this.toAddressList = toAddressList;
	}
	
	public void addToAddress(EmailAddress address) {
		if(null == this.toAddressList) {
			this.toAddressList = new ArrayList<EmailAddress>();
		}
		this.toAddressList.add(address);
	}

	public List<EmailAddress> getCcAddressList() {
		return ccAddressList;
	}

	public void setCcAddressList(List<EmailAddress> ccAddressList) {
		this.ccAddressList = ccAddressList;
	}
	
	public void addCcAddress(EmailAddress address) {
		if(null == this.ccAddressList) {
			this.ccAddressList = new ArrayList<EmailAddress>();
		}
		this.ccAddressList.add(address);
	}

	public List<EmailAddress> getBccAddressList() {
		return bccAddressList;
	}

	public void setBccAddressList(List<EmailAddress> bccAddressList) {
		this.bccAddressList = bccAddressList;
	}
	
	public void addBccAddress(EmailAddress address) {
		if(null == this.bccAddressList) {
			this.bccAddressList = new ArrayList<EmailAddress>();
		}
		this.bccAddressList.add(address);
	}

	public List<Attachment> getAttachmentList() {
		return attachmentList;
	}

	public void setAttachmentList(List<Attachment> attachments) {
		this.attachmentList = attachments;
	} 
	
	public void addAttachment(Attachment attachment) {
		if(null == this.attachmentList) {
			this.attachmentList = new ArrayList<Attachment>();
		} 
		this.attachmentList.add(attachment);
	}

	public String getMessageId() {
		return messageId;
	}

	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
		
}
