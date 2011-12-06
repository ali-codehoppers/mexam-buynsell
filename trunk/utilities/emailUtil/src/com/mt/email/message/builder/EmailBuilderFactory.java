package com.mt.email.message.builder;

import com.mt.email.exceptions.EmailBuilderException;
import com.mt.email.vo.EmailBuilderVo;

public class EmailBuilderFactory {

	public static EmailBuilder getBuilder(EmailBuilderVo builderVo) throws EmailBuilderException {
		EmailBuilder builder = null;
		
		if(null != builderVo && null != builderVo.getType()) {
			if(null == builderVo.getTemplate()) {
				throw new EmailBuilderException("Email Template missing.");
			}
			if(null == builderVo.getParameters()) {
				throw new EmailBuilderException("Email Parameters missing.");
			}
			
			switch (builderVo.getType()) {
			case SIMPLE:
				builder = new TextBuilder(builderVo.getTemplate(), builderVo.getParameters());
				break;
			}
		}
		
		
		return builder;
	}
}
