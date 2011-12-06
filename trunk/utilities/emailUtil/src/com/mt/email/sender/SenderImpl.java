package com.mt.email.sender;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

import com.mt.email.EmailLogger;
import com.mt.email.exceptions.SenderException;
import com.mt.email.vo.Attachment;
import com.mt.email.vo.Configuration;
import com.mt.email.vo.EmailAddress;
import com.mt.email.vo.EmailMessage;

public class SenderImpl implements ISender
{
	
	@Override
	public void send(EmailMessage message, Configuration config) throws SenderException
	{
		EmailLogger.getLogger().info("Sending Email.");
		Properties jProps = new Properties();
		
		jProps.put("mail.smtp.host", config.getServer());
		
		if(null != config.getPort()) 
		{
			jProps.put("mail.smtp.port", config.getPort());
		}
		
		if(config.isAuthentication()) {
			EmailLogger.getLogger().info("Authenticating user.");
			PasswordAuthentication authentication = new PasswordAuthentication(config.getUser(), config.getPassword());
			jProps.setProperty("mail.smtp.auth", "true");
			jProps.setProperty("mail.smtp.submitter", authentication.getUserName());
		}
		
		Session session = Session.getDefaultInstance(jProps);
		
		Message jMsg = new MimeMessage(session);
		
		try 
		{
			
			jMsg.setFrom(new InternetAddress(message.getFromAddress().getAddress()));
			addRecipent(jMsg, Message.RecipientType.TO, message.getToAddressList());
			addRecipent(jMsg, Message.RecipientType.CC, message.getCcAddressList());
			addRecipent(jMsg, Message.RecipientType.BCC, message.getBccAddressList());
			
			jMsg.setSubject(message.getSubject());
			Multipart multipart = new MimeMultipart();
			
			//Setting Body
			BodyPart bodyPart = new MimeBodyPart();
			bodyPart.setContent(message.getBody(),"text/html");
			bodyPart.setDescription("body");
			bodyPart.setDisposition(MimeBodyPart.INLINE);
			multipart.addBodyPart(bodyPart);
			
			addAttachments(multipart, message.getAttachmentList());
			jMsg.setContent(multipart);
			
			Transport.send(jMsg);
			EmailLogger.getLogger().info("Email sent successfully.");

		} 
		catch (MessagingException e) 
		{
			throw new SenderException(e);
		}
		catch (Exception e) 
		{
			throw new SenderException("Exception while sending message.", e);
		}
	}
	
	private void addAttachments(Multipart multipart, List<Attachment> attachments) throws SenderException   
	{
		try
		{
			if(null != attachments) 
			{
				EmailLogger.getLogger().info("Preparing attachments.");
				for(int i=0; i<attachments.size(); i++)
				{
					BodyPart part = new MimeBodyPart();
			        Attachment attachment = attachments.get(i);
			        DataSource dataSource = new ByteArrayDataSource(attachment.getData(), "text/html");
			        DataHandler handler = new DataHandler(dataSource);
			        part.setDataHandler(handler);
			        part.setFileName(attachment.getFileName());
			        part.setDisposition(MimeBodyPart.ATTACHMENT);
			        multipart.addBodyPart(part);
				}
				
				EmailLogger.getLogger().info("Attachments prepared.");
			}
		}
		catch (MessagingException  e) {
			throw new SenderException("Exception while sending attachment.",e);
		}
	}

	private void addRecipent(Message jMsg , Message.RecipientType type, List<EmailAddress> addressList) throws SenderException 
	{
		
		if(null != addressList)
		{
			try 
			{
				for(int i=0; i<addressList.size(); i++) 
				{
					jMsg.addRecipient(type, new InternetAddress(addressList.get(i).getAddress(), addressList.get(i).getAlias()));
				}
			}
			catch (UnsupportedEncodingException e) {
				throw new SenderException("Exception while adding recipent(s)",e);
			} catch (MessagingException e) {
				throw new SenderException("Exception while adding recipent(s)",e);
			}
		
		}
		else 
		{
			if(type == Message.RecipientType.TO) 
			{
				throw new SenderException("No recipend address is defined for the type TO");
			}
		}
		
	}
	
}
