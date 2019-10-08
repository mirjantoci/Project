
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guest.Users;
import guest.UsersService;
import org.eclipse.jgit.api.Git;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import java.io.*;
import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class signup
 */
@WebServlet({"/resetPassword", ""})
public class resetPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public resetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        PrintWriter out = response.getWriter();
        response.setContentType("text/plain");

        String paramName = "token";
        String paramValue = request.getParameter(paramName);

        out.write(paramName);
        out.write(" = ");
        out.write(paramValue);
        out.write("n");

        out.close();

        SessionFactory factory;

        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }

        Session session = factory.openSession();

        Criteria criteria = session.createCriteria(Users.class);
        List<Users> list = criteria.add(Restrictions.eq("resetToken", paramValue)).list();

        String line ;
        if (list.size() != 0) {

            line = list.get(0).toString();
            String data = line.split(",")[0];


            Date objDate = new Date(); // Current System Date and time is assigned to objDate
            //System.out.println(objDate);
            String strDateFormat = "hh:mm:ss"; //Date format is Specified
            SimpleDateFormat objSDF = new SimpleDateFormat(strDateFormat); //Date format string is passed as an argument to the Date format object
            //out.println(data.compareTo(objSDF.format(objDate))); //Date formatting is applied to the current date
            String string = "004-034556";
            String[] parts = data.split(":");
            String[] parts1 = objSDF.format(objDate).split(":");
            String part1 = parts[0]; // 004
            String part2 = parts1[0];

            if (((Integer.parseInt(part2) - Integer.parseInt(part1)) > 4)) {
                request.setAttribute("message", "Please require again to recover the password because the link is not valid anymore");
                request.getRequestDispatcher("PasswordRecovery.jsp").forward(request, response);

//out.println(" Please require again to recover the password");
            }
            request.setAttribute("token", paramValue);
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);

        }
        else
        {
            request.setAttribute("message", "Please require again to recover the password because the link is not valid anymore");
            request.getRequestDispatcher("PasswordRecovery.jsp").forward(request, response);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,  IOException {
        // TODO Auto-generated method stub
        doGet(request, response);



    }

}
