

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
 * Servlet implementation class createFolder
 */
public class createFolder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createFolder() {
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
		String foldername = request.getParameter("folder_name");
		String repoDir = request.getParameter("repoDir");
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
		
	
		    try{
		    	new File(repoDir + "/" +foldername ).mkdirs();

		    } 
		    catch(SecurityException se){
		        //handle it
		    }        
		    
	    
	    final File localPath;
        // prepare a new test-repository
        try 
        {
            Repository repository = new FileRepository( repo );

            localPath = repository.getWorkTree();

            try (Git git = new Git(repository)) {
            	
              
                
             // Stage all files in the repo including new files
                git.add().addFilepattern(".").call();

                // and then commit the changes.
                git.commit()
                        .setMessage("Commit all changes including additions")
                        .call();

                 request.getRequestDispatcher("directory.jsp").forward(request, response);
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
