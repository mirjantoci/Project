

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;
import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.internal.storage.file.FileRepository;
import org.eclipse.jgit.lib.Repository;

/**
 * Servlet implementation class upload
 */
@WebServlet("/upload")
@MultipartConfig
public class upload1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upload1() {
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
		
		
		String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
	    Part filePart = request.getPart("uploadfile"); // Retrieves <input type="file" name="file">
	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
	    InputStream fileContent = filePart.getInputStream();
	    // ... (do your job here)
	    System.out.println(filePart);
	    System.out.println(fileName);
	    
	    
		   HttpSession session = request.getSession();

		   String repo;
		   String repoCom;
			
			String repType= (String)request.getParameter("repo");
            System.out.println("Rep qe kam marr eshte " + repType); 

			

			String repositoryType = "public";

			if (repType.equals(repositoryType))
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
	    File source = new File("C:\\Users\\Mirjan\\Downloads\\"+fileName);
	    File dest = new File(repo+"/"+fileName);
	    try {
	        FileUtils.copyFile(source, dest);
            System.out.println("File moved successfully"); 
            System.out.println(dest); 

	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    
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
  
  
	    
	    
	    //copyFileUsingStream("C:/Users/Mirjan/Desktop/New.TXT" ,"C:/Users/Thinkopen/Desktop/Repositories/publicrepository");
		
	    
	    /*
        File file = new File("C:/Users/Mirjan/Desktop/New.TXT"); 
        if(file.renameTo 
                (new File("C:/Users/Thinkopen/Desktop/Repositories/publicrepository/New.TX"))) 
             { 
                 // if file copied successfully then delete the original file 
                
                 System.out.println("File moved successfully"); 
             } 
	    */
  
  /*
  try
  {
	 
	  String contentType = request.getContentType();
		//here we are checking the content type is not equal to Null and  as well as the passed 
		//data from mulitpart/form-data is greater than or equal to 0
		if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
			
	 		DataInputStream in = new DataInputStream(request.getInputStream());
			//we are taking the length of Content type data
			int formDataLength = request.getContentLength();
			byte dataBytes[] = new byte[formDataLength];
			int byteRead = 0;
			int totalBytesRead = 0;
			//this loop converting the uploaded file into byte code
			while (totalBytesRead < formDataLength) {
				byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
				totalBytesRead += byteRead;
				}
			String file = new String(dataBytes);
			//for saving the file name
			String saveFile = file.substring(file.indexOf("filename=\"") + 10);
			saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
			saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
			int lastIndex = contentType.lastIndexOf("=");
			String boundary = contentType.substring(lastIndex + 1,contentType.length());
			int pos;
			//extracting the index of file 
			pos = file.indexOf("filename=\"");
			pos = file.indexOf("\n", pos) + 1;
			pos = file.indexOf("\n", pos) + 1;
			pos = file.indexOf("\n", pos) + 1;
			int boundaryLocation = file.indexOf(boundary, pos) - 4;
			int startPos = ((file.substring(0, pos)).getBytes()).length;
			int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
			String author="Mirjan";
			String docname="toci";
			Integer docid=1;
			String version="1";
			String des="2";
			//saveFile=author+docname+version+saveFile;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","tocimirjan1994");
			Statement st1=con.createStatement();
			Statement st2=con.createStatement();
			String s=docname+version;
			String flag="true";

			// creating a new file with the same name and writing the content in new file
				if(flag.equals("true")){
					String filePath = "C:\\Users\\Mirjan\\Desktop\\" + saveFile;
					FileOutputStream fileOut = new FileOutputStream(filePath);
					fileOut.write(dataBytes, startPos, (endPos - startPos));
					fileOut.flush();
					fileOut.close();
					st1.executeUpdate("insert into documentload values('"+docname+"','"+des+"','"+docid+"','"+version+"','"+author+"','"+formDataLength+"','created','"+saveFile+"')");	
			}	
			}
		else {
				//out.print("not recieved");
			}
	
	  
	  
	  
  }
  catch (Exception e) {
	// TODO: handle exception
}
  
  */
	    response.sendRedirect("upload.jsp");

	    
	    
	}

	



}
