import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailServiceImpl implements MessageService {

    @Override
    public void sendMessage(String messageText, String rec) {
        //logic to send email

        try{
        String host ="smtp.gmail.com" ;
        String user = "test69637@gmail.com";
        String pass = "thinkopen1A";
        String to = rec;
        String from = "test69637@gmail.com";
        String subject = "Reset Login System Online account password";
        boolean sessionDebug = false;

        Properties props = System.getProperties();

        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.startssl.required", "true");

        //java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        Session mailSession = Session.getDefaultInstance(props, null);
        mailSession.setDebug(sessionDebug);
        Message msg = new MimeMessage(mailSession);
        msg.setFrom(new InternetAddress(from));
        InternetAddress[] address = {new InternetAddress(to)};
        msg.setRecipients(Message.RecipientType.TO, address);
        msg.setSubject(subject); msg.setSentDate(new Date());
        msg.setText(messageText);

        Transport transport=mailSession.getTransport("smtp");
        transport.connect(host, user, pass);
        transport.sendMessage(msg, msg.getAllRecipients());
        transport.close();
        System.out.println("Email sent to "+rec+ " with Message="+msg);
        }
        catch (Exception e)
            {
                System.out.println(e);
            }
    }

}

