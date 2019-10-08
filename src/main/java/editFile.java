

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.internal.storage.file.FileRepository;
import org.eclipse.jgit.lib.Repository;



/**
 * Servlet implementation class editFile
 */
public class editFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editFile() {
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
		
		
		
		
		
		String filename = request.getParameter("fileName");
		String comment = request.getParameter("comment");
	   String repType = request.getParameter("repo");
	   String repo = request.getParameter("repo");
       System.out.println(filename);
       System.out.println(comment);
       System.out.println(repo);

	   HttpSession session = request.getSession();

       String repositoryType = "public";

   	if (repType.equals(repositoryType))
   	{repo = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git";

   	}

   	else
   	{
   		repo=(String)session.getAttribute("privateRepository");
   		

   	}
  
	   final File localPath;
       try 
                {
           Repository repository = new FileRepository(repo );
           localPath = repository.getWorkTree();

           System.out.println("Listing local branches:");
           try (Git git = new Git(repository)) {
               // set up a file
               String fileName = filename;
               File tempFile = new File(repository.getDirectory().getParentFile(), fileName);
              
               Path tempFilePath = tempFile.toPath();

               // write some initial text to it
               String initialText =comment;
               System.out.println("Writing text [" + initialText + "] to file [" + tempFile.toString() + "]");
               Files.write(tempFilePath, initialText.getBytes());

               // add the file and commit it
               git.add().addFilepattern(fileName).call();
               git.commit().setMessage("Added untracked file " + fileName + "to repo").call();

               // modify the file
               Files.write(tempFilePath, "Some modifications".getBytes(), StandardOpenOption.APPEND);

               // assert that file's text does not equal initialText
               if (initialText.equals(getTextFromFilePath(tempFilePath))) {
                   throw new IllegalStateException("Modified file's text should not equal " +
                           "its original state after modification");
               }

               System.out.println("File now has text [" + getTextFromFilePath(tempFilePath) + "]");

               // revert the changes
               git.checkout().addPath(fileName).call();

               // text should no longer have modifications
               if (!initialText.equals(getTextFromFilePath(tempFilePath))) {
                   throw new IllegalStateException("Reverted file's text should equal its initial text");
               }

               System.out.println("File modifications were reverted. " +
                       "File now has text [" + getTextFromFilePath(tempFilePath) + "]");
               request.setAttribute("message", "Your file is created successfuly");
	           request.getRequestDispatcher("fileedit.jsp").forward(request, response);
               
           }
       }
       catch(Exception e)
       {
    	   System.out.println(e);
       }
       
       
       
       
	}
	private static String getTextFromFilePath(Path file) throws IOException {
        byte[] bytes = Files.readAllBytes(file);
        CharBuffer chars = Charset.defaultCharset().decode(ByteBuffer.wrap(bytes));
        return chars.toString();
    }

}
