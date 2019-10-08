

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class testZipFolder
 */
public class testZipFolder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public testZipFolder() {
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
		
		
		try {
	        response.setContentType("application/zip");
	        response.setHeader("Pragma", "public");
	        response.setHeader("Content-Disposition", "attachment; filename=test.zip");
	 
	        ZipOutputStream zout = new ZipOutputStream(response.getOutputStream());
	 
	        //add an entry to zip, a file named test.txt
	        ZipEntry entry = new ZipEntry("C:\\Users\\Mirjan\\Desktop\\test.txt");
	        zout.putNextEntry(entry);
	 
	        Writer out = new OutputStreamWriter(zout);
	 
	//add content to test.txt
	out.write("THIS IS MY CONTENT IN THE FILE!");
	 
	            
	    } catch(Exception ex) {
	        ex.printStackTrace();
	    } 
		
		
	}

}
