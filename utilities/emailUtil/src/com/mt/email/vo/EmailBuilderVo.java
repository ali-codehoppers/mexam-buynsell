package com.mt.email.vo;
import java.util.Hashtable;

import com.mt.email.message.builder.EmailBuilderType;

public class EmailBuilderVo {

	private String template;
	private Hashtable<String, String> parameters;
	private EmailBuilderType type;
	
	public String getTemplate() {
		return template;
	}
	public void setTemplate(String template) {
		this.template = template;
	}
	public Hashtable<String, String> getParameters() {
		return parameters;
	}
	public void setParameters(Hashtable<String, String> parameters) {
		this.parameters = parameters;
	}
	public EmailBuilderType getType() {
		return type;
	}
	public void setType(EmailBuilderType type) {
		this.type = type;
	}
	
	
	
}
