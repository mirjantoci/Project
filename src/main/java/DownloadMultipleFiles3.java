import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Downloading Multiple Files As Zip
 * 
 * @author JavaDigest
 */
public class DownloadMultipleFiles3 extends HttpServlet {

	private static final long serialVersionUID = -7767828383799037391L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
try
{
	
	
	   HttpSession session = request.getSession();

	

		// Set the content type based to zip
		response.setContentType("Content-type: text/zip");
		response.setHeader("Content-Disposition",
				"attachment; filename=files.zip");

		//String filePath = repoDir1 + "/" + s;
		
		String[] lines = request.getParameterValues("mine");
		int size = lines.length;
		List<File> files = new ArrayList<File>();
		
		  int y=1;
			
			
			for (int i=0; i<size; i++)
		    {
			  if (lines[i].equals("stopPrivateRep"))
			  {
				  y=i;
			  }
			  
		    }
			
			String repoDirPrivate = "C:/Users/Thinkopen/Desktop/Repositories/"+ (String)session.getAttribute("repPrivate");

			  for (int i=0; i<y; i++)
			    {
				  files.add(new File( repoDirPrivate + "/" + lines[i]));
				  
					

			    }
              
			  for (int i=y+1; i<size; i++)
			    {
				  files.add(new File( "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/"+ lines[i]));
					
				 

			    }
			  
			  
			  
		

		ServletOutputStream out = response.getOutputStream();
		ZipOutputStream zos = new ZipOutputStream(new BufferedOutputStream(out));
		
		for (File file : files) {

			System.out.println("Adding " + file.getName());
			zos.putNextEntry(new ZipEntry(file.getName()));

			// Get the file
			FileInputStream fis = null;
			try {
				fis = new FileInputStream(file);

			} catch (FileNotFoundException fnfe) {
				// If the file does not exists, write an error entry instead of
				// file
				// contents
				zos.write(("ERRORld not find file " + file.getName())
						.getBytes());
				zos.closeEntry();
				System.out.println("Couldfind file "
						+ file.getAbsolutePath());
				continue;
			}

			BufferedInputStream fif = new BufferedInputStream(fis);

			// Write the contents of the file
			int data = 0;
			while ((data = fif.read()) != -1) {
				zos.write(data);
			}
			fif.close();

			zos.closeEntry();
			System.out.println("Finishedng file " + file.getName());
		}

		zos.close();
}
catch(Exception e)
{
	}
	}
}