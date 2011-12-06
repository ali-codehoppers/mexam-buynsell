package com.mt.email.exceptions;

public class SenderException extends Exception
{

	private static final long serialVersionUID = 1L;

	public SenderException() 
	{
		super();
	}
	
	public SenderException(String message)
	{
		super(message);
	}
	
	public SenderException(Throwable cause) 
	{
		super(cause);
	}
	
	public SenderException(String message, Throwable cause) 
	{
		super(message, cause);
	}
}
