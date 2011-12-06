package com.mt.email.vo;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.Logger;

import com.mt.email.exceptions.ConfigException;

public class Configuration {
	
	private String server;
	private String port;
	private String user;
	private String password;
	private boolean authentication;
	private boolean tlsEnable;
	private String socketFactoryPort;
	private String socketFactoryClass;
	private String socketFactoryFallback;
	private String storeType;
	private Logger logger;
	private String logFilePath;
	
	public String getServer() {
		return server;
	}
	public void setServer(String server) {
		this.server = server;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public boolean isAuthentication() {
		return authentication;
	}
	public void setAuthentication(boolean authentication) {
		this.authentication = authentication;
	}
	public static Configuration loadConfig(String filePath) throws ConfigException {
		Configuration config = new Configuration();
		FileInputStream fis;
		
		try {
			fis = new FileInputStream(new File(filePath));
			Properties properties = new Properties();
			properties.load(fis);
			
			config.setServer(properties.getProperty("mail.server"));
			config.setPort(properties.getProperty("mail.port"));
			config.setAuthentication("true".equalsIgnoreCase(properties.getProperty("mail.authentication")));
			config.setUser(properties.getProperty("mail.username"));
			config.setPassword(properties.getProperty("mail.password"));

			config.setSocketFactoryClass(properties.getProperty("mail.socket.factory.class"));
			config.setSocketFactoryFallback(properties.getProperty("mail.socket.factory.fallback"));
			config.setSocketFactoryPort(properties.getProperty("mail.socket.factory.port"));
			config.setStoreType(properties.getProperty("mail.store.type"));
			config.setTlsEnable("true".equalsIgnoreCase(properties.getProperty("mail.tls.enable")));
			
			
		} catch (FileNotFoundException e) {
			throw new ConfigException("Unable to load configuration.",e);
		} catch (IOException e) {
			throw new ConfigException("Unable to load configuration.",e);
		}
		return config;
		
	}
	public boolean isTlsEnable() {
		return tlsEnable;
	}
	public void setTlsEnable(boolean tlsEnable) {
		this.tlsEnable = tlsEnable;
	}
	public String getSocketFactoryPort() {
		return socketFactoryPort;
	}
	public void setSocketFactoryPort(String socketFactoryPort) {
		this.socketFactoryPort = socketFactoryPort;
	}
	public String getSocketFactoryClass() {
		return socketFactoryClass;
	}
	public void setSocketFactoryClass(String socketFactoryClass) {
		this.socketFactoryClass = socketFactoryClass;
	}
	public String getSocketFactoryFallback() {
		return socketFactoryFallback;
	}
	public void setSocketFactoryFallback(String socketFactoryFallback) {
		this.socketFactoryFallback = socketFactoryFallback;
	}
	public String getStoreType() {
		return storeType;
	}
	public void setStoreType(String storeType) {
		this.storeType = storeType;
	}
	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public String getLogFilePath() {
		return logFilePath;
	}
	public void setLogFilePath(String logFilePath) {
		this.logFilePath = logFilePath;
	}
	
}
