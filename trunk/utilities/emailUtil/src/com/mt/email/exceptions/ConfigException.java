package com.mt.email.exceptions;

public class ConfigException extends Exception 
{

	private static final long serialVersionUID = 1L;	
	public ConfigException() 
	{
		super();
	}
	
	public ConfigException(String message)
	{
		super(message);
	}
	
	public ConfigException(Throwable cause) {
		super(cause);
	}
	
	public ConfigException(String message, Throwable cause) 
	{
		super(message, cause);
	}

}
