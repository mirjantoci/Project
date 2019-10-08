

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jgit.api.Git;

/**
 * Servlet implementation class editProfile
 */
public class editProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editProfile() {
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
		
		   HttpSession session = request.getSession();

	    String uname = request.getParameter("firstName");
	    String ulastname = request.getParameter("lastName");
		String umail=(String)session.getAttribute("email");
	    String upass = request.getParameter("password");
	    String umatrucula = request.getParameter("matricula");
	    
	    try {
		    
	    	 Class.forName("com.mysql.jdbc.Driver");
		      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbname?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","tocimirjan1994");
		      Statement stmt = con.createStatement();
		    
		      stmt.executeUpdate("UPDATE Users SET first_name ='" + uname + "', last_name='"+ ulastname + "', password='"+upass+"', matricula='" + umatrucula +"'  where email = '" + umail +"'");
			con.close();		     
		    	  request.setAttribute("message", "Your Profile is updated successfully");
		           request.getRequestDispatcher("profileUpdated.jsp").forward(request, response);
		   	
	    } catch (ClassNotFoundException e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    } catch (SQLException e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    }
	    
	 
	    
	    
	}

}
