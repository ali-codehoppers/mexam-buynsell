package com.mt.email.sender;

import com.mt.email.exceptions.SenderException;
import com.mt.email.vo.Configuration;
import com.mt.email.vo.EmailMessage;

public interface ISender 
{
	public abstract void send(EmailMessage message, Configuration config) throws SenderException;
	
}
