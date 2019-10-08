

import guest.Users;
import guest.UsersService;

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

/**
 * Servlet implementation class UpdatePassword
 */
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatePassword() {
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
		String token = request.getParameter("token");
		String upass = request.getParameter("password");
		String uemail = request.getParameter("email");
		try {

                UsersService usersService = new UsersService();


				System.out.println("*** Find - start ***");
				Users another = usersService.findById(uemail);
				if (another != null)
				{


					another.setPassword(upass);
					another.setResetToken("null");
					another.setDate("null");
					usersService.update(another);

					request.setAttribute("message", "Password is reseted successfully &#x1F600; ");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			else
			{
				request.setAttribute("message", "You can't reset anymore your password using this link &#x1F61E; Please clik again Forgot Password to get new link for reseting password.");
				request.getRequestDispatcher("login.jsp").forward(request, response);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}
