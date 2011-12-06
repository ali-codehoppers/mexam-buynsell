package com.mt.email.vo;

public class EmailResponse {
	
	public static final EmailResponse SUCCESS = new EmailResponse("SS", "Success");
	public static final EmailResponse FAILURE = new EmailResponse("FE", "Failure.");
	public static final EmailResponse CONFIGURATION_MISSING = new EmailResponse("CE", "Configuration Missing.");
	public static final EmailResponse CONFIGURATION_FILE_ERROR = new EmailResponse("FE", "Configuration File Error.");
	public static final EmailResponse LOADER_ERROR = new EmailResponse("LE", "Loader Error.");
	public static final EmailResponse BUILDER_ERROR = new EmailResponse("BE", "Builder Error");
	public static final EmailResponse SENDER_ERROR = new EmailResponse("SE", "Sender Error");
	public static final EmailResponse LOGGER_ERROR = new EmailResponse("GE", "Logger Error");
	
	private final String code;
	private final String description;
	private String message;
	private Exception exception;
	
	public EmailResponse(String code, String description) {
		this.code = code;
		this.description = description;
	}

	public EmailResponse(String code, String description, String message) {
		this.code = code;
		this.description = description;
		this.message = message;
	}
	
	

	public EmailResponse(String code, String description, String message, Exception exception) {
		this.code = code;
		this.description = description;
		this.message = message;
		this.exception = exception;
	}

	public String getCode() {
		return code;
	}
	public String getDescription() {
		return description;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public boolean equals(EmailResponse response) {
		return this.code.equals(response.getCode());
	}
	
	public EmailResponse get() {
		return get(null);
	}
	
	public EmailResponse get(String message) {
		return new EmailResponse(this.getCode(), this.getDescription(), message);
	}

	public Exception getException() {
		return exception;
	}

	public void setException(Exception exception) {
		this.exception = exception;
	}
	
}
