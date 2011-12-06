package com.mt.email.vo;


public class Attachment 
{
	
	private String fileName;
	
	private byte[] data;

	public String getFileName() {
		return fileName;
	}
	
	public Attachment(String fileName, byte[] data) {
		this.fileName = fileName;
		this.data = data;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}
	
	
}
