package com.mt.email.receiver;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.InternetAddress;

import com.mt.email.exceptions.ReceiverException;
import com.mt.email.vo.Configuration;
import com.mt.email.vo.EmailAddress;
import com.mt.email.vo.EmailMessage;
import com.mt.email.vo.EmailMsgHeader;

public class ReceiverImpl implements IReceiver {

	Session session = null;
	Store store = null;

	public ReceiverImpl(Configuration config) {
		Properties props = new Properties();
		populateProperties(config, props);
		session = Session.getInstance(props, new SMTPAuthenticator(config
				.getUser(), config.getPassword()));
		try {
			store = session.getStore("pop3");
			store.connect();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	private void populateProperties(Configuration config, Properties props) {
		props.put("mail.pop3.host", config.getServer());
		props.put("mail.pop3.port", config.getPort());
		props.put("mail.pop3.starttls.enable", config.isTlsEnable() ? "true"
				: "false");
		props.put("mail.pop3.auth", config.isAuthentication() ? "true"
				: "false");
		props
				.put("mail.pop3.socketFactory.port", config
						.getSocketFactoryPort());
		props.put("mail.pop3.socketFactory.class", config
				.getSocketFactoryClass());
		props.put("mail.pop3.socketFactory.fallback", config
				.getSocketFactoryFallback());
	}

	@Override
	public List<EmailMessage> receiveAllMessages(String folderName)
			throws ReceiverException {

		List<EmailMessage> emailMessages = null;
		EmailMessage emailMsg = null;
		try {
			Folder folder = store.getFolder(folderName);
			if (!folder.exists()) {
				System.out.println("No '"+folderName+"'...");
			} else {
				emailMessages = new ArrayList<EmailMessage>();
				folder.open(Folder.READ_WRITE);
				Message[] msg = folder.getMessages();
				for (int i = 0; i < msg.length; i++) {
		        	System.out.println("------------ Message " + (i + 1) + " ------------");
		        	emailMsg = new EmailMessage();
		        	populateMessage(msg[i],emailMsg);
		        	emailMessages.add(emailMsg);
		        }
			}
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return emailMessages;
	}

	@Override
	public EmailMessage receiveMessage(String folderName, int messageId)
			throws ReceiverException {
		EmailMessage emailMessage = null;
		try {
			Folder folder = store.getFolder(folderName);
			if (!folder.exists()) {
				System.out.println("No '"+folderName+"'...");
			} else {
				folder.open(Folder.READ_WRITE);
				Message message = folder.getMessage(messageId);
				emailMessage = new EmailMessage();
				populateMessage(message, emailMessage);
			}
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return emailMessage;
	}

	private void populateMessage(Message msg, EmailMessage emailMessage) throws MessagingException,
			IOException {
		
		List<EmailAddress> toAddresses = new ArrayList<EmailAddress>();
		List<EmailAddress> ccAddresses = new ArrayList<EmailAddress>();
		List<EmailAddress> bccAddresses = new ArrayList<EmailAddress>();
		EmailAddress add = null;
		
		emailMessage.setSubject(msg.getSubject());
		emailMessage.setMessageId(""+msg.getMessageNumber());
		emailMessage.setFromAddress(new EmailAddress(InternetAddress.toString(msg.getFrom())));
		
		Address[] addresses = msg.getRecipients(Message.RecipientType.TO);
		for (Address address : addresses) {
			add = new EmailAddress(address.toString());
			toAddresses.add(add);
		}
		emailMessage.setToAddressList(toAddresses);
		
		addresses = msg.getRecipients(Message.RecipientType.CC);
		for (Address address : addresses) {
			add = new EmailAddress(address.toString());
			ccAddresses.add(add);
		}
		emailMessage.setCcAddressList(ccAddresses);
		
		addresses = msg.getRecipients(Message.RecipientType.BCC);
		for (Address address : addresses) {
			add = new EmailAddress(address.toString());
			bccAddresses.add(add);
		}
		emailMessage.setBccAddressList(bccAddresses);
		emailMessage.setDateTime(msg.getSentDate().toString());
		
		Multipart multipart = (Multipart) msg.getContent();
		for (int x = 0; x < multipart.getCount(); x++) {
			BodyPart bodyPart = multipart.getBodyPart(x);

			String disposition = bodyPart.getDisposition();

			if (disposition != null
					&& (disposition.equals(BodyPart.ATTACHMENT))) {
				System.out.println("Mail have some attachment : ");

				DataHandler handler = bodyPart.getDataHandler();
				System.out.println("file name : " + handler.getName());
			} else {
				emailMessage.setBody(bodyPart.getContent().toString());
			}
		}
	}
	
	private void populateMessageHeader(Message msg, EmailMsgHeader emailMessage) throws MessagingException,
			IOException {
		
		emailMessage.setSubject(msg.getSubject());
		emailMessage.setMessageId(""+msg.getMessageNumber());
		emailMessage.setFromAddress(new EmailAddress(InternetAddress.toString(msg.getFrom())));
		emailMessage.setDateTime(msg.getSentDate().toString());
		
	}

	private class SMTPAuthenticator extends javax.mail.Authenticator {
		private String userName = null;
		private String password = null;

		public SMTPAuthenticator(String userName, String password) {
			this.userName = userName;
			this.password = password;
		}

		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(userName, password);
		}
	}

	@Override
	public List<EmailMsgHeader> receiveAllMsgHeaders(String folderName)
			throws ReceiverException {
		List<EmailMsgHeader> emailMessageHeaders = null;
		EmailMsgHeader emailMsgHeader = null;
		try {
			Folder folder = store.getFolder(folderName);
			if (!folder.exists()) {
				System.out.println("No '"+folderName+"'...");
			} else {
				emailMessageHeaders = new ArrayList<EmailMsgHeader>();
				folder.open(Folder.READ_WRITE);
				Message[] msg = folder.getMessages();
				for (int i = 0; i < msg.length; i++) {
		        	System.out.println("------------ Message " + (i + 1) + " ------------");
		        	emailMsgHeader = new EmailMsgHeader();
		        	populateMessageHeader(msg[i],emailMsgHeader);
		        	emailMessageHeaders.add(emailMsgHeader);
		        }
			}
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return emailMessageHeaders;
	}

}
