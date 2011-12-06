package com.mt.email.message.builder;

import java.util.Hashtable;

import com.mt.email.exceptions.EmailBuilderException;

public abstract class EmailBuilder {
	
	protected String template;
	
	protected Hashtable<String, String> parameters;
	
	
	protected EmailBuilder(String template, Hashtable<String, String> parameters) {
		super();
		this.template = template;
		this.parameters = parameters;
	}

	public abstract String build() throws EmailBuilderException;

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
}
