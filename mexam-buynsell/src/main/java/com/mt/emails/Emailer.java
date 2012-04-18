/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mt.emails;

import java.util.Properties;



/**
 *
 * @author Muaz
 */
public class Emailer{

    static Properties properties = new Properties();

    static {
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.socketFactory.port", "465");
        properties.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "465");
    }


    public static Properties getProperties() {
        return properties;
    }

    public static void setProperties(Properties properties) {
        Emailer.properties = properties;
    }
}
