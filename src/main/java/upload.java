

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.internal.storage.file.FileRepository;
import org.eclipse.jgit.lib.Repository;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class upload
 */
@WebServlet("/upload")
@MultipartConfig
public class upload extends HttpServlet {
	private static final long serialVersionUID = 1L;    
	private String dbURL = "jdbc:mysql://localhost:3306/dbname?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private String dbUser = "root";
    private String dbPass = "tocimirjan1994";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload() {
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

		   String repo;
		   String repoCom;
			
			String repType = (String)session.getAttribute("repToUpdate");

            System.out.println("Rep qe kam marr eshte " + repType); 

			

			//String repositoryType = "public";

			if (repType.equals("public"))
			{repo = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository";
			repoCom = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git";

			}

			else
			{
				repo=(String)session.getAttribute("privateRepository");
				repoCom = (String)session.getAttribute("privateRepository");

			
				String[] parts = repo.split("\\.git");
				String part1 = parts[0]; // 004
				repo = part1;
				
				
				

			}
	    
	    String path = repo + "//";
			try {
				ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
				List<FileItem> multifiles = sf.parseRequest(request);

				for (FileItem item : multifiles) {
					System.out.println(item.getName());

					item.write(new File(path + item.getName()));
				}

			} catch (Exception e) {
				// TODO: handle exception
			}
			System.out.println("File uploded");
	    
	    final File localPath;
	    
  try 
                
                

              {
	  Repository repository = new FileRepository(repoCom);
            localPath = repository.getWorkTree();

            try (Git git = new Git(repository)) {
                // create the file
                //File myFile = new File(repository.getDirectory().getParent(), "testfile");
                //if(!myFile.createNewFile()) {
                 //   throw new IOException("Could not create file " + myFile);
                //}

                // Stage all files in the repo including new files
                git.add().addFilepattern(".").call();

                // and then commit the changes.
                git.commit()
                        .setMessage("Commit all changes including additions")
                        .call();

               // try(PrintWriter writer = new PrintWriter(myFile)) {
                //    writer.append("Hello, world!");
                //}

                // Stage all changed files, omitting new files, and commit with one command
                git.commit()
                        .setAll(true)
                        .setMessage("Commit changes to all files")
                        .call();


                System.out.println("Committed all changes to repository at " + repository.getDirectory());
            }
        }
  catch(Exception e)
  {
      System.out.println(e);
  }
  
  
  response.sendRedirect("upload.jsp");

   
	}

	



}
