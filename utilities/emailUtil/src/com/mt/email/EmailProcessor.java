package com.mt.email;

import java.util.List;

import com.mt.email.exceptions.EmailBuilderException;
import com.mt.email.exceptions.EmailException;
import com.mt.email.exceptions.SenderException;
import com.mt.email.message.builder.EmailBuilder;
import com.mt.email.message.builder.EmailBuilderFactory;
import com.mt.email.message.builder.EmailBuilderType;
import com.mt.email.receiver.IReceiver;
import com.mt.email.receiver.ReceiverImpl;
import com.mt.email.sender.ISender;
import com.mt.email.sender.SenderImpl;
import com.mt.email.vo.Configuration;
import com.mt.email.vo.EmailBuilderVo;
import com.mt.email.vo.EmailInfo;
import com.mt.email.vo.EmailMessage;
import com.mt.email.vo.EmailResponse;

public class EmailProcessor {
	
	public static EmailResponse sendEmail(EmailMessage message, EmailInfo info, Configuration config) {
		EmailResponse response = null;
		EmailLogger.getLogger().info("Processing Email.");
		try {
			if(null != info.getBuilderType() && EmailBuilderType.NONE != info.getBuilderType()) {
				EmailLogger.getLogger().info("Creating Builder");
				EmailBuilderVo builderVo = new EmailBuilderVo();
				builderVo.setType(info.getBuilderType());
				builderVo.setTemplate(message.getBody());
				builderVo.setParameters(info.getParameters());
				
				EmailBuilder builder = EmailBuilderFactory.getBuilder(builderVo);
				message.setBody(builder.build());
			}
			
			ISender sender = new SenderImpl();
			sender.send(message, config);
			
			response = EmailResponse.SUCCESS;
		} catch (EmailBuilderException e) {
			response = EmailResponse.BUILDER_ERROR.get("Error while building message.");
			response.setException(e);
		} catch (SenderException e) {
			response = EmailResponse.SENDER_ERROR.get("Error while sending message.");
			response.setException(e);
		} catch (Exception e) {
			response = EmailResponse.FAILURE.get("Unable to send message due to some reason.");
			response.setException(e);
		}
		return response;
	}
	
	public static List<EmailMessage> getAllMessages(String folderName, Configuration config) throws EmailException {
		List<EmailMessage> emailMessages = null;
		try {
			IReceiver receiver = new ReceiverImpl(config);
			emailMessages = receiver.receiveAllMessages(folderName);
		}catch (Exception e) {
			EmailLogger.getLogger().warn("Exception occured while processing email");
		}
		return emailMessages;
	}
	
	public static EmailMessage getMessage(String folderName, int messageId, Configuration config) throws EmailException {
		EmailMessage emailMessage = null;
		try {
			IReceiver receiver = new ReceiverImpl(config);
			emailMessage = receiver.receiveMessage(folderName, messageId);
		}catch (Exception e) {
			EmailLogger.getLogger().warn("Exception occured while processing email");
		}
		return emailMessage;
	}
}
