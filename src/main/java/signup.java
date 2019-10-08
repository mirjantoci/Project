

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

import guest.Users;
import guest.UsersService;
import org.eclipse.jgit.api.Git;
import java.io.*;

/**
 * Servlet implementation class signup
 */
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,  IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
	    String uname = request.getParameter("firstName");
	    String ulastname = request.getParameter("lastName");
	    String umail = request.getParameter("email");
	    String upass = request.getParameter("password");
	    String umatrucula = request.getParameter("matricula");
	    try {

			UsersService usersService = new UsersService();


			System.out.println("*** Find - start ***");
			Users another = usersService.findById(umail);
			if (another != null)
			{

				request.setAttribute("message", "There is a user with this email. Plese check your data.");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
		      else
		      {
			 File localPath = File.createTempFile(uname, "", new File("C:/Users/Thinkopen/Desktop/Repositories"));

		        if(!localPath.delete()) {
		            throw new IOException("Could not delete temporary file " + localPath);
		        }
		        String rep;
		        String str ="";
		        String repository ;
		        // create the directory
		        try (Git git = Git.init().setDirectory(localPath).call()) {
		           System.out.println("Having repository: " + git.getRepository().getDirectory());
		           rep = git.getRepository().getDirectory().toString();
		           System.out.println("Rep eshte " +rep);
		           String[] parts = rep.split("Repositories");
			        
			        String part2 = parts[1].substring(1); // 034556
		        	//System.out.println(part2);

			        String[] parts1 = part2.split(".git");
			        String final1 = parts1[0]; // 034556
			        
			        str = final1.substring(0, final1.length() - 1);
			      

		        }
		        catch(Exception e)
		        {
		        	System.out.println(e);
		        }
			
/*
				String query = " insert into Users (email, password, first_name, last_name,matricula,repository,public_rep)"
				        + " values (?, ?, ?, ?,?,?,?)";

				      // create the mysql insert preparedstatement
				//Name of the public repository
				String public_rep = "publicrepository";
				      PreparedStatement preparedStmt = con.prepareStatement(query);
				      preparedStmt.setString (1, umail);
				      preparedStmt.setString (2, upass);
				      preparedStmt.setString (3, uname);
				      preparedStmt.setString (4, ulastname);
				      preparedStmt.setString (5, umatrucula);
				      //Name of the private repository
				      preparedStmt.setString (6, str);
				      preparedStmt.setString (7, public_rep);
				      // execute the preparedstatement
				      preparedStmt.execute();
				      con.close();
*/
				  String public_rep = "publicrepository";
				  Users city1 = new Users( umail, uname,ulastname,umatrucula,upass,str,public_rep);
				  Users user = new Users();
				  System.out.println("*** Persist - start ***");
				  usersService.persist(city1);

			doGet(request, response);

			request.setAttribute("message", "Your account is created successfully");
			response.sendRedirect("accountCreated.jsp");

		      }
	    } catch (Exception e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    }
	}

}
