package com.mt.email.receiver;

import java.util.List;

import com.mt.email.exceptions.ReceiverException;
import com.mt.email.vo.EmailMessage;
import com.mt.email.vo.EmailMsgHeader;

public interface IReceiver {

	public abstract EmailMessage receiveMessage(String folderName,int messageId) throws ReceiverException;
	public abstract List<EmailMessage> receiveAllMessages(String folderName) throws ReceiverException;
	public abstract List<EmailMsgHeader> receiveAllMsgHeaders(String folderName) throws ReceiverException;
	
}
