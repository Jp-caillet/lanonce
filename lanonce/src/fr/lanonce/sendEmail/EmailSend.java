package fr.lanonce.sendEmail;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;

public class EmailSend {

	public void sendEmail(String fromEmail, String username, String password, String toEmail, String subject, String message) {
        try{
            String host ="smtp.gmail.com" ;
            //String username = "benedearnaud@gmail.com";
            //String password = "";
            //String toEmail = "arnaudbenede@hotmail.fr";
            //String fromEmail = "";
            //String subject = "This is confirmation number for your expertprogramming account. Please insert this number to activate your account.";
            //String message = "Your Is Test Email :";
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(fromEmail));
            InternetAddress[] address = {new InternetAddress(toEmail)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            msg.setText(message);

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, username, password);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           System.out.println("message send successfully");
           
        	} catch(Exception ex) {
        		
            System.out.println(ex);
        }

    }
}
