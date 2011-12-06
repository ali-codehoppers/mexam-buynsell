package com.mt.email;

import org.apache.log4j.Logger;
import org.apache.log4j.RollingFileAppender;

public class EmailLogger {
	
	private static Logger logger;
	
	public static void setLogger(Logger logger, String logFilePath) {
		if(null != logger) {
			EmailLogger.logger = logger;
		} else {
			EmailLogger.logger = Logger.getLogger(EmailLogger.class);
		}
		
		RollingFileAppender appender = (RollingFileAppender) logger.getAppender("file");
		if(null != logFilePath) {
			appender.setFile(logFilePath);
		}
		
		logger.info("**** Email API - Log File Path : " + appender.getFile());
		
	}

	public static Logger getLogger() {
		return logger;
	}
	
}
