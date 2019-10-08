

import guest.Users;
import guest.UsersService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
/**
 * Servlet implementation class PasswordRecovery
 */
public class PasswordRecovery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordRecovery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
	    String uemail = request.getParameter("email");
		try{
			UsersService usersService = new UsersService();


			System.out.println("*** Find - start ***");
			Users another = usersService.findById(uemail);
			if (another != null)
			{


		    	  String userName = another.getFirstName();
					String userSurname = another.getLastName();
		    	  Date objDate = new Date(); // Current System Date and time is assigned to objDate
		    	  //System.out.println(objDate);
		    	  String strDateFormat = "hh:mm:ss"; //Date format is Specified
		    	  SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); //Date format string is passed as an argument to the Date format object
		    	  System.out.println(objSDF.format(objDate)); //Date formatting is applied to the current date
		    	

	        String uuid = UUID.randomUUID().toString();

				another.setDate(objSDF.format(objDate));
				another.setResetToken(uuid);
				usersService.update(another);
			
            String link = "http://192.168.0.164:8088/SPM_project/resetPassword.jsp?token=" + uuid + "&email=" + uemail;
            String to = uemail;
            String messageText = "Dear " + userName + " " + userSurname + ",\r\n" +
            		"There was a request to reset your password for your Login System Online account.\r\n" + 
            		"Please click the link below to set a new password.\r\n" +
            		link + 
            		"\r\nIf you didn’t ask to change your password, don’t worry! Your password is still safe and you can ignore this email.\r\n" + 
            		"Cheers,\r\n" + 
            		"Login System Online";
            boolean sessionDebug = false;

				  MessageServiceInjector injector = null;
				  Consumer app = null;

				  injector = new EmailServiceInjector();
				  app = injector.getConsumer();
				  app.processMessages(messageText, to);

           request.setAttribute("message", "We have sent an email to reset the password &#x1F600; Go there and click the link.");
           request.getRequestDispatcher("login.jsp").forward(request, response);
   		
           //response.sendRedirect("http://localhost:8080/SPM_project/pageAfterResetPassword.jsp");
		      }else {
		    	  request.setAttribute("message", "This user does not exist &#x1F61E; Please check your email.");
		           request.getRequestDispatcher("PasswordRecovery.jsp").forward(request, response);
		   		

		      }
           
        }catch(Exception ex)
        {
            System.out.println(ex);
        }
	}

}
