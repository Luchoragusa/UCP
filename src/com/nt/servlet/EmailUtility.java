package com.nt.servlet;

import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.util.Date;
import java.util.Properties;

import com.mysql.cj.Session;
import com.mysql.cj.protocol.Message;

public class EmailUtility {

	public static void sendEmail(String host, String port, final String userName, final String password, String toAddress, String subject, String message) throws AddresException, MessagingException{
		
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.ensable", "true");
		
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAthentication() {
				return new PasswordAuthentication(userName, password);
			}
		};
		
		Session session = Session.getInstance(properties, auth);
		
		Message msg = new MimeMessage(session);
		
		msg.setFrom(new InternetAddress(userName));
		InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
		msg.setRecipients(Message.RecipientType.TO, toAddress);
		msg.setSubject(subject);
		msg.setSentDate(new Date());
		msg.setText(message);
		
		Transport.send(msg);
		
	}
	
	
}
