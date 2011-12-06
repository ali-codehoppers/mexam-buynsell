package com.mt.email.vo;

import java.util.Hashtable;

import org.apache.log4j.Logger;

import com.mt.email.message.builder.EmailBuilderType;

public class EmailInfo {
	
	private EmailBuilderType builderType;
	private Hashtable<String, String> parameters;
	private Logger logger;
	private String logFilePath;
	
	
	public EmailBuilderType getBuilderType() {
		return builderType;
	}
	public void setBuilderType(EmailBuilderType builderType) {
		this.builderType = builderType;
	}
	public Hashtable<String, String> getParameters() {
		return parameters;
	}
	public void setParameters(Hashtable<String, String> parameters) {
		this.parameters = parameters;
	}
	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public String getLogFilePath() {
		return logFilePath;
	}
	public void setLogFilePath(String logFilePath) {
		this.logFilePath = logFilePath;
	}
		
}
