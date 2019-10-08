<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.io.PrintWriter,java.util.*,javax.mail.*,javax.mail.internet.*,java.util.UUID,javax.servlet.http.HttpServletResponse,javax.servlet.http.HttpSession,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServlet,javax.servlet.ServletException,java.io.IOException"  %>

<!--
Author: Colorlib
Author URL: https://colorlib.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>SPM</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<!-- //Custom Theme files -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- //web font -->
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<h1 align="center">

</h1>
<br>

<style>
.butoni {
    position: absolute;
right:    0;
bottom:   0;
}
 table.center {
    margin-left: auto;
    margin-right: auto;
}
input {
  width: 15%;
  font-weight: bold;
  background-color: transparent;
  border: 1px solid;
  font-size: 13px;
  font-family: Arial;
  float: center;
}
td 
{
    height: 200px;
    width: 500px;
}
#cssTable td 
{
    text-align: center; 
    vertical-align: middle;
}
</style>
<body>
	
<%

//PrintWriter out = response.getWriter();
String uemail = request.getParameter("Email");
String name = request.getParameter("Name");
String msg1 = request.getParameter("Message");
try{
	
    String uuid = UUID.randomUUID().toString();

   
	
    String host ="smtp.gmail.com" ;
    String user = "test69637@gmail.com";
    String pass = "Test12345678";
    String to = "mirjantoci@gmail.com";
    String from = "test69637@gmail.com";
    String subject = "Message from the users";
    String messageText = "USER: " + name + "\r\n User's email: " + uemail + "\r\n User's message: " + msg1;
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
   out.println("<center>");
   out.println("<h3>The message is sent successfully &#x1F600; </h3>");
   out.println("<br>");
   out.println("<h3>We will contact you as soon as possible</h3>");
   out.println("</center>");
 
   
}catch(Exception ex)
{
    System.out.println(ex);
}



%>

</body>
</html>