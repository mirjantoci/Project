

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import guest.Users;
import guest.UsersService;
import org.eclipse.jgit.api.Git;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String REMOTE_URL = "https://mirjantoci@bitbucket.org/mirjantoci/";

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
	    String uname = request.getParameter("email");
	    String upass = request.getParameter("password");
	    String rep1 = null;
	    String repository;
	    try {

			UsersService usersService = new UsersService();


			System.out.println("*** Find - start ***");
			Users another = usersService.findById(uname);
			if (another != null)
			{
				System.out.println("User Exist, lets check password");
				String userPassword = another.getPassword();
				if (userPassword.equals(upass))
				{

					System.out.println("User Exist, password is ok");
					String userName =  another.getFirstName();
					String userSurname = another.getLastName();
					String password = another.getPassword();
					String email = another.getEmail();
					String matricula = another.getMatricula();
					repository = another.getRepository();

					String rep = "C:/Users/Thinkopen/Desktop/Repositories/"+repository+"/.git"; // 034556

					System.out.println(rep);
					//out.println("<jsp:forward page=\"WelcomeUser.jsp\"></jsp:forward>");

					HttpSession session = request.getSession();
					//session.setAttribute("userid","My user id is 123" );
					session.setAttribute("firstName",  userName);
					session.setAttribute("lastName",  userSurname);
					session.setAttribute("privateRepository",  rep);
					session.setAttribute("password",  password);
					session.setAttribute("email",  email);
					session.setAttribute("matricula",  matricula);
					//Name of the private repository
					session.setAttribute("repPrivate",  repository);

					//Name of the public repository
					session.setAttribute("repPublice",  repository);



					response.sendRedirect("WelcomeUser.jsp");



				}

				else
				{
					response.sendRedirect("loginError.jsp");
					System.out.println("User Exist, but wrong pass");
				}


			}
			else
			{
				response.sendRedirect("loginError.jsp");
				System.out.println("User does not Exist");
			}
	  } catch (Exception e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    }
	
	}

}
