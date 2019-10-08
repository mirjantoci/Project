import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;
 
public class HelloServlet extends HttpServlet {
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
               throws IOException, ServletException {
      // Set the response message's MIME type
      response.setContentType("text/html;charset=UTF-8");
      // Allocate a output writer to write the response message into the network socket
      PrintWriter out = response.getWriter();
 
      // Write the response message, in an HTML page
      try {
    	  
		   HttpSession session = request.getSession();

			String repoDirPublic = "C:/Users/Mirjan/Desktop/Repositories/publicrepository";
			String repoDirPrivate = "C:/Users/Mirjan/Desktop/Repositories/"+ (String)session.getAttribute("repPrivate");

    	  out.println("<!DOCTYPE html>");
          out.println("<html><head>");
          out.println("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
          out.println("<title>Hello, World</title></head>");
          out.println("<body>");
          out.println("<h1>Hello, world!</h1>");  // says Hello
    	  String[] lines = request.getParameterValues("mine");
			int size = lines.length;
			List<File> files = new ArrayList<File>();
			int y=0;
			
			
			for (int i=0; i<size; i++)
		    {
			  if (lines[i].equals("stopPrivateRep"))
			  {
				  y=i;
			  }
			  
		    }
			
			
			  for (int i=0; i<y; i++)
			    {
				  //files.add(new File( repoDirPrivate + "/" + lines[i]));
				  //System.out.println(lines[i]);
			         out.println("<p>Private : " + repoDirPrivate + "/" + lines[i] + "</p>");

					

			    }

			  for (int i=y+1; i<size; i++)
			    {
				  //files.add(new File( repoDirPublic + "/" + lines[i]));
					
				  //System.out.println(lines[i]);
				  
			         out.println("<p> Publice : " + repoDirPublic + "/" + lines[i] + "</p>");


			    }
        
         // Echo client's request information
         out.println("<p>Request URI: " + request.getRequestURI() + "</p>");
         out.println("<p>Protocol: " + request.getProtocol() + "</p>");
         out.println("<p>PathInfo: " + request.getPathInfo() + "</p>");
         out.println("<p>Remote Address: " + request.getRemoteAddr() + "</p>");
         // Generate a random number upon each request
         out.println("<p>A Random Number: <strong>" + Math.random() + "</strong></p>");
         out.println("</body>");
         out.println("</html>");
      } finally {
         out.close();  // Always close the output writer
      }
   }
}