package com.mt.email;

import com.mt.email.exceptions.ConfigException;
import com.mt.email.exceptions.EmailException;
import com.mt.email.vo.Configuration;
import com.mt.email.vo.EmailInfo;
import com.mt.email.vo.EmailMessage;
import com.mt.email.vo.EmailResponse;

public class EmailSendService 
{
	private EmailMessage message;
	private EmailInfo emailInfo;
	private Configuration config;
	private String configPath;
	
	public EmailResponse send() throws EmailException {
		EmailResponse response = null;
		try {
			
			EmailLogger.setLogger(emailInfo.getLogger(), emailInfo.getLogFilePath());
			
			if(getConfig() == null && getConfigPath() == null) {
				response = EmailResponse.CONFIGURATION_MISSING.get("Email Configuration not provided.");
			} else if(getConfig() == null && getConfigPath() != null) {
				config = Configuration.loadConfig(configPath);
			}
			response = EmailProcessor.sendEmail(message, emailInfo, config);

		} catch (ConfigException e) {
			response = EmailResponse.CONFIGURATION_FILE_ERROR.get("Exception while loading configuration form file " + getConfigPath());
			response.setException(e);
			EmailLogger.getLogger().warn("Exception occured while loading configuration");
		} catch (Exception e) {
			if(response == null) {
				response = EmailResponse.FAILURE.get("Failed while processing email.");
			}
			response.setException(e);
			EmailLogger.getLogger().warn("Exception occured while processing email");
		}
		return response;
	}
	
	public EmailMessage getMessage() {
		return message;
	}
	public void setMessage(EmailMessage message) {
		this.message = message;
	}
	public EmailInfo getEmailInfo() {
		return emailInfo;
	}
	public void setEmailInfo(EmailInfo emailInfo) {
		this.emailInfo = emailInfo;
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
