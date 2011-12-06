package com.mt.email;

import java.util.List;

import com.mt.email.exceptions.ConfigException;
import com.mt.email.exceptions.EmailException;
import com.mt.email.vo.Configuration;
import com.mt.email.vo.EmailMessage;

public class EmailReceiveService 
{
	private Configuration config;
	private String configPath;
	
	
	public EmailReceiveService(Configuration config){
		this.config = config;
	}
	
	public EmailReceiveService(String configPath){
		try {
			config = Configuration.loadConfig(configPath);
		} catch (ConfigException e) {
			System.out.println("Exception occured while loading configuration");
			e.printStackTrace();
		}
	}
	
	public List<EmailMessage> getAllMessages(String folderName) throws EmailException {
		List<EmailMessage> emailMessages = null;
		try {
			
			EmailLogger.setLogger(config.getLogger(), config.getLogFilePath());
			emailMessages = EmailProcessor.getAllMessages(folderName, config);
			
		}catch (Exception e) {
			EmailLogger.getLogger().warn("Exception occured while processing email");
		}
		return emailMessages;
	}
	
	public EmailMessage getMessage(String folderName, int messageId, Configuration config) throws EmailException {
		EmailMessage emailMessage = null;
		try {
			emailMessage = EmailProcessor.getMessage(folderName, messageId, config);
		}catch (Exception e) {
			EmailLogger.getLogger().warn("Exception occured while processing email");
		}
		return emailMessage;
	}
	
	
	public Configuration getConfig() {
		return config;
	}
	public void setConfig(Configuration config) {
		this.config = config;
	}
	public String getConfigPath() {
		return configPath;
	}
	public void setConfigPath(String configPath) {
		this.configPath = configPath;
	}

}
