package com.mt.email.exceptions;

public class EmailBuilderException extends Exception
{
	private static final long serialVersionUID = 1L;
	
	public EmailBuilderException() 
	{
		super();
	}
	
	public EmailBuilderException(String message)
	{
		super(message);
	}
	
	public EmailBuilderException(Throwable cause) 
	{
		super(cause);
	}
	
	public EmailBuilderException(String message, Throwable cause) 
	{
		super(message, cause);
	}
}
