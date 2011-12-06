package com.mt.email.exceptions;

public class ReceiverException extends Exception
{

	private static final long serialVersionUID = 1L;

	public ReceiverException() 
	{
		super();
	}
	
	public ReceiverException(String message)
	{
		super(message);
	}
	
	public ReceiverException(Throwable cause) 
	{
		super(cause);
	}
	
	public ReceiverException(String message, Throwable cause) 
	{
		super(message, cause);
	}
}
