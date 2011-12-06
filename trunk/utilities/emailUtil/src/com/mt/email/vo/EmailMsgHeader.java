package com.mt.email.vo;


public class EmailMsgHeader 
{

	private String subject;
	private String messageId;
	private String dateTime;
	
	private EmailAddress fromAddress = new EmailAddress(null, null);
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public EmailAddress getFromAddress() {
		return fromAddress;
	}
	
	public void setFromAddress(EmailAddress fromAddress) {
		this.fromAddress = fromAddress;
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
