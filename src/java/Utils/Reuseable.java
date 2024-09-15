/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

/**
 *
 * @author Administrator
 */
public class Reuseable {

    public static String loadImage(byte[] imageData) {
        if (imageData != null) {
            return "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageData);
        }
        return null;
    }

    public static String sendOTPEmail(String fromEmail, String appPassword, String toEmail, String subject, String message) throws UnsupportedEncodingException {
        String otpvalue = null;
        if (toEmail != null || !toEmail.isEmpty()) {
            otpvalue = String.format("%06d", new Random().nextInt(999999));
            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "465");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.socketFactory.port", "465");
            prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, appPassword);
                }
            });
            try {
                MimeMessage mimeMessage = new MimeMessage(session);
                mimeMessage.setFrom(new InternetAddress(fromEmail));
                mimeMessage.setRecipients(Message.RecipientType.TO, toEmail);
                mimeMessage.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
                MimeBodyPart messageBodyPart = new MimeBodyPart();
                messageBodyPart.setContent(message + otpvalue, "text/html; charset=UTF-8");
                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(messageBodyPart);
                mimeMessage.setContent(multipart);
                Transport.send(mimeMessage);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        }
        return otpvalue;
    }
    
    public static void sendEmail(String fromEmail, String appPassword, String toEmail, String subject, String message) throws UnsupportedEncodingException {
        if (toEmail != null || !toEmail.isEmpty()) {
            Properties prop = new Properties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "465");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.socketFactory.port", "465");
            prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, appPassword);
                }
            });
            try {
                MimeMessage mimeMessage = new MimeMessage(session);
                mimeMessage.setFrom(new InternetAddress(fromEmail));
                mimeMessage.setRecipients(Message.RecipientType.TO, toEmail);
                mimeMessage.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
                MimeBodyPart messageBodyPart = new MimeBodyPart();
                messageBodyPart.setContent(message, "text/html; charset=UTF-8");
                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(messageBodyPart);
                mimeMessage.setContent(multipart);
                Transport.send(mimeMessage);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
