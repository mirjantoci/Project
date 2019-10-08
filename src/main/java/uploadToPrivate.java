

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.internal.storage.file.FileRepository;
import org.eclipse.jgit.lib.Repository;

/**
 * Servlet implementation class uploadToPrivate
 */
public class uploadToPrivate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadToPrivate() {
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

		String repo=(String)session.getAttribute("privateRepository");

	
		String[] parts = repo.split("\\.git");
		String part1 = parts[0]; // 004
		repo = part1;
		try {
			ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
			List<FileItem> multifiles = sf.parseRequest(request);

			for (FileItem item : multifiles) {
				System.out.println(item.getName());

				item.write(new File(repo + "//" + item.getName()));
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("File uploded");
    
		
		
    final File localPath;

try 
            
            

          {
	String repoCom = (String)session.getAttribute("privateRepository");
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
