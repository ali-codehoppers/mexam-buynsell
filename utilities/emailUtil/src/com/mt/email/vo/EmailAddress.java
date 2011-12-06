package com.mt.email.vo;

public class EmailAddress
{
	
	private String address;
	private String alias;
	
	
	/**
	 * 
	 * @param address
	 * @param alias
	 */
	public EmailAddress(String address, String alias) 
	{
		this.address = address;
		this.alias = alias;
	}
	
	/**
	 * 
	 * @param address
	 */
	public EmailAddress(String address) 
	{
		this.address = address;
	}
	/**
	 * @return the email address
	 */
	public String getAddress() 
	{
		return address;
	}
	/**
	 * @param address the email address to set
	 */
	public void setAddress(String address) 
	{
		this.address = address;
	}
	/**
	 * @return the alias
	 */
	public String getAlias() 
	{
		return alias;
	}
	/**
	 * @param alias the alias to set
	 */
	public void setAlias(String alias) 
	{
		this.alias = alias;
	}
	
	/**
	 * @param address
	 * @param alias
	 */
	public void updateAddress (String address, String alias) 
	{
		this.address = address;
		this.alias = alias;
	}

}
