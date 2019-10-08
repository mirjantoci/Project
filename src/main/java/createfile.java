

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.internal.storage.file.FileRepository;
import org.eclipse.jgit.lib.Repository;

/**
 * Servlet implementation class createfile
 */
public class createfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createfile() {
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
		
		String filename = request.getParameter("file_name");
		String comment = request.getParameter("comment");
	   String repo;
	    
	   String repType= (String)request.getParameter("repo");

		String repositoryType = "public";

		if (repType.equals(repositoryType))
		{repo = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git";

		}

		else
		{
 		   HttpSession session = request.getSession();

			repo=(String)session.getAttribute("privateRepository");
			

		}
	    
	    final File localPath;
        // prepare a new test-repository
        try 
        {
            Repository repository = new FileRepository( repo );

            localPath = repository.getWorkTree();

            try (Git git = new Git(repository)) {
                // create the file
                File myFile = new File(repository.getDirectory().getParent(), filename);
                if(!myFile.createNewFile()) {
                    throw new IOException("Could not create file " + myFile);
                }

                try(PrintWriter writer = new PrintWriter(myFile)) {
                    writer.append(comment);
                }
                
             // Stage all files in the repo including new files
                git.add().addFilepattern(".").call();

                // and then commit the changes.
                git.commit()
                        .setMessage("Commit all changes including additions")
                        .call();

                System.out.println("Added file " + myFile + " to repository at " + repository.getDirectory());
                System.out.println(request.getParameter("repo"));                
                 request.getRequestDispatcher("file.jsp").forward(request, response);
            }
        }
        catch(Exception e)
        {
            
        }
     finally {
        // ... cleanup that will execute whether or not an error occurred ...
    }
		
		
		
		
		
	}

}
