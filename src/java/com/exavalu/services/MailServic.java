/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.Appointment;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author anich
 */
public class MailServic {

    /**
     *
     * @param from
     * @param password
     * @param to
     * @param sub
     * @param msg
     */
    public static void send(final String from, final String password, String to, String sub, String msg) {
        //Get properties object    
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "25");
        //get Session   
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });
        //compose message    
        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setText(msg);
            //send message  
            Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

    /**
     *
     * @param appointment
     */
    public static void sendAppointment(Appointment appointment) {

        String to_email = appointment.getEmailAddress();
        String sub = "Appointment Details";
        String body = "Hi , \n"
                + "\n"
                + "Thanks for getting in touch. \n"
                + "\n"
                + "This is a confirmation email regarding your appointment at OHMS  with Dr "+appointment.getDoctorFirstName()+" "+ appointment.getDoctorLastName()+" at "+appointment.getTime()+" on "+appointment.getAppointmentDate()+". Please be available 30 minutes prior to your appointed time.  \n"
                + "\n"
                + "To learn more about us,Click Here. \n"
                + "\n"
                + " \n"
                + "\n"
                + "To reschedule or cancel your appointment, please call 1234567890. \n"
                + "\n"
                + "Regards, \n"
                + "\n"
                + "OHMS TEAM \n"
                + "\n"
                + "ADMIN";
        
       send("anichakraborty0007@gmail.com","icesuzcamsjmrsts",appointment.getEmailAddress(),sub,body);
      
    }
}
