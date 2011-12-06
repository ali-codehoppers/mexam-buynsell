package com.mt.email.message.builder;

import java.util.Enumeration;
import java.util.Hashtable;

import com.mt.email.EmailLogger;
import com.mt.email.exceptions.EmailBuilderException;

public class TextBuilder extends EmailBuilder {

	protected TextBuilder(String template, Hashtable<String, String> parameters) {
		super(template, parameters);
	}

	@Override
	public String build() throws EmailBuilderException{
		
		Enumeration<String> eKey = parameters.keys();
		String actual = new String(template);
		EmailLogger.getLogger().info("Building Text Template");
		while (eKey.hasMoreElements()) {
			String key = eKey.nextElement();
			String value = parameters.get(key);
			EmailLogger.getLogger().info("Filling placeholders");
			if(EmailLogger.getLogger().isDebugEnabled()) {
				EmailLogger.getLogger().debug("$" + key + " : " + value);
			}
			actual = actual.replace("$" + key, value);
		}
		EmailLogger.getLogger().info("Message built successfully.");
		return actual;
	}

}
