<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" import="java.io.File,java.io.*,java.io.FileInputStream,java.io.FileOutputStream,java.util.zip.ZipEntry,java.util.zip.ZipOutputStream,java.nio.file.*,java.util.zip.*,org.apache.commons.io.FileUtils,java.io.IOException, org.eclipse.jgit.api.Git, org.eclipse.jgit.lib.Repository, org.eclipse.jgit.internal.storage.file.FileRepository" %>

<!DOCTYPE html>
<html>
<head>
<style>
.butoni {
    position: absolute;
right:    0;
bottom:   0;
}

 table.center {
    margin-left: auto;
    margin-right: auto;
}
</style>
<title>SignIn Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<!-- //Custom Theme files -->
<!-- web font -->
<!-- //web font -->
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<style>
body {
    text-align: center;
}
form {
    display: inline-block;
}
</style>
<%
	String s=request.getParameter("mine");
	String v[]=request.getParameterValues("share");
	String ds=request.getParameter("s");
	String repo;
	String repPrivate=(String)session.getAttribute("repPrivate");

	String repType= (String)request.getParameter("repo");

	String repositoryType = "public";
	String repoPublicDir="";
	String repoPrivateDir="";
	String repToCommitPublic="";
	String repToCommitPrivate="";
	

	if (repType.equals(repositoryType))
	{
		repoPublicDir = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository";
		repo = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git";
		repToCommitPublic = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git";

	}

	else
	{
		repo=(String)session.getAttribute("privateRepository");
		
		String[] parts = repo.split("\\.git");
		String part1 = parts[0]; // 004
		repoPrivateDir = part1;
		

	}
	

		String s1 = "C:/Users/Mirjan/Desktop/files/"+s;
        //out.println(s1); 
        if(ds.equals("Delete")){
		//String repo = (String)request.getAttribute("repo");

		
				String[] files = request.getParameterValues("mine");
				int size = files.length;


		
		try
		{
			
			Repository repository = new FileRepository( repo );

			Git git = new Git(repository);

			

			for (int i=0; i<size; i++)
		    {
				 git.rm().addFilepattern(files[i]).call();
			 

		    }
	           
				//FileUtils.forceDelete(file);
				 // Stage all files in the repo including new files
	            git.commit().setMessage("delete files").call();

            out.println("File deleted successfully"); 
		}
		catch(Exception e)
		{
			out.println(e);
		}
		 
        }
        if(ds.equals("createfile")){
        	//out.println(request.getParameter("repo"));
        	
        	%>
        	<h1> Adding a file </h1>
        	<br>
        	<br>
        	<form action=createfile method="post">
			<input class="text" type="text" name="file_name" placeholder="Name of the file" required=""><br>
			<br>
			<textarea rows="4" cols="50" name="comment">Write your text inside the file</textarea>
			<div class="registrationFormAlert" id="divCheckPasswordMatch">
</div>
</font>
<br>
			<input type="submit" value="Add file">
			<input type="hidden" id="custId" name="repo" value="<%= request.getParameter("repo")%>">
			
		</form>
        <%
        	
        }
        
        
        if(ds.equals("Edit")){
        	//out.println(request.getParameter("repo"));
        	
        	%>
        	<h1> Edit your file </h1>
        	<br>
        	<br>
        	<form action=editFile method="post">
			<input class="text" type="text" name="file_name" readonly placeholder="Name of the file" value="<%= request.getParameter("mine")%> "><br>
			<br>
			<textarea rows="4" cols="50" name="comment">Write your text inside the file</textarea>
			<div class="registrationFormAlert" id="divCheckPasswordMatch">
</div>
</font>
<br>
			<input type="submit" value="Edit file">
			<input type="hidden" id="custId" name="repo" value="<%= (String)request.getParameter("repo")%>">
			<input type="hidden" id="custId" name="fileName" value="<%= request.getParameter("mine")%>">
			
		</form>
        <%
        	
        }
        if(ds.equals("Share")){
        	
        	if (repType.equals(repositoryType))
        	{
        		
        		
				
				
        		//File source = new File("C:/Users/Thinkopen/Desktop/Repositories/publicrepository/"+s);
        	    //File dest = new File("C:/Users/Thinkopen/Desktop/Repositories/" +repPrivate+"/"+s);
               

        	    try {
        	    	String[] files1 = request.getParameterValues("mine");
    				int size1 = files1.length;
        	    	for (int i=0; i<size1; i++)
        		    {
        	    		File source = new File("C:/Users/Thinkopen/Desktop/Repositories/publicrepository/"+files1[i]);
                	    File dest = new File("C:/Users/Thinkopen/Desktop/Repositories/" +repPrivate+"/"+files1[i]);
            	        FileUtils.copyFile(source, dest);        			 

        		    }
        	        //FileUtils.copyFile(source, dest);
                    System.out.println("File copied successfully"); 
                    //System.out.println(dest); 
                    out.println("File copied successfully to the private repository"); 

                    
                    final File localPath1;
                    try 
                                {
                    
                  	  Repository repository1 = new FileRepository("C:/Users/Thinkopen/Desktop/Repositories/" +repPrivate+"/.git");
                              localPath1 = repository1.getWorkTree();

                              try (Git git = new Git(repository1)) {
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


                                  System.out.println("Committed all changes to repository at " + repository1.getDirectory());
                              }
                          }
                    catch(Exception e)
                    {
                        System.out.println(e);
                    }
                    
                    

        	    } catch (IOException e) {
        	        e.printStackTrace();
        	    }
        	}

        	else
        	{
        		//File dest = new File("C:/Users/Thinkopen/Desktop/Repositories/publicrepository/"+s);
        	    //File source = new File(repoPrivateDir+"/"+s);
        	    try {
        	    	
        	    	String[] files2 = request.getParameterValues("mine");
    				int size2 = files2.length;
        	    	for (int i=0; i<size2; i++)
        		    {
        	    		
        	    		File dest = new File("C:/Users/Thinkopen/Desktop/Repositories/publicrepository/"+files2[i]);
                	    File source = new File(repoPrivateDir+"/"+files2[i]);
                	    FileUtils.copyFile(source, dest);      			 

        		    }
        	    	
        	    	
        	        
                    System.out.println("File copied successfully"); 
                    //System.out.println(dest); 
                    out.println("File copied successfully to the public repository"); 

                    
                    final File localPath;
                    try 
                                {
                    
                  	  Repository repository = new FileRepository(repo);
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

        	    } catch (IOException e) {
        	        e.printStackTrace();
        	    }
        		

        	}
        	
        	
            final File localPath;
            try 
                        {
            
                Repository repository = new FileRepository( "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git" );
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
        
        	
        }
        
 if(ds.equals("Move")){
	 
	 String repo1;
		String repoDir1;
		
		String repType1= (String)request.getParameter("repo");

		String repositoryType1 = "public";

		if (repType1.equals(repositoryType1))
		{repo1 = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git";
		repoDir1 = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/";

		}

		else
		{
			repo1=(String)session.getAttribute("privateRepository");
			repoDir1 = "C:/Users/Thinkopen/Desktop/Repositories/"+ (String)session.getAttribute("repPrivate");
			

		}
		
		int x = 0;
	 File dir1 = new File(repoDir1); // current directory

		File[] files1 = dir1.listFiles();
		for (File file : files1) {
			if (file.isDirectory()) {
				
				if (!file.getName().equals(".git"))
			     x++;
				
			} 
		}
		
		
		if (x>0)
		{
	 
	 out.println("<H2>");
	 out.println("Select the folder where you want to move the file");
	 
	 out.println("</H2>");

		}
		else
		{
			out.println("<H2>");
			 out.println("Sorry &#x1F61E; , we did not find any folder inside your repository");
			 out.println("</br>");
			 
			 out.println("Please create folder first and then try to move files");
			 
			 out.println("</H2>");
		}
	 String fileName = "";
	 String[] files3 = request.getParameterValues("mine");
	 int size3 = files3.length;
 	for (int i=0; i<size3; i++)
	    {
 		fileName += "fileName=" +files3[i] + "&";

	    }
 	
 	String fileNamesFinal = fileName.substring(0, fileName.length() - 1);
 	
 	
 	
 	
        	
	 out.print("<form action=\"moveFile.jsp?" + fileNamesFinal +"&reptype=" + repType1 + "\" method=\"POST\">");
	 out.print("<select name=\"ver\" > ");
	 
		File dir = new File(repoDir1); // current directory

			File[] files = dir.listFiles();
			for (File file : files) {
				if (file.isDirectory()) {
					
					if (!file.getName().equals(".git"))
				     out.print("<option value=" + file.getName() +">" + file.getName() +"</option>");

					
				} 
			}
			if (x>0)
			{
		 
		 

			
	
	 %>

	 </select>   
	 <input type="submit" value="Move"/>


	 </form>
	 <%
			}
			else
			{
				
				 %>

				 </select>   
				 <input type="submit" value="Move" disabled />


				 </form>
				 <%
				
			}
        }


if(ds.equals("Download")){
	 
	 String repo1;
		String repoDir1;
		
		String repType1= (String)request.getParameter("repo");

		String repositoryType1 = "public";

		if (repType1.equals(repositoryType1))
		{repo1 = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git";
		repoDir1 = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository";

		}

		else
		{
			repo1=(String)session.getAttribute("privateRepository");
			repoDir1 = "C:/Users/Thinkopen/Desktop/Repositories/"+ (String)session.getAttribute("repPrivate");
			

		}
        	
		
		
    	byte[] buffer = new byte[1024];

		try {
			
			
			String filePath = repoDir1 + "/" + s;
			File downloadFile = new File(filePath);
			FileInputStream inStream = new FileInputStream(downloadFile);
			
			// if you want to use a relative path to context root:
			String relativePath = getServletContext().getRealPath("");
			System.out.println("relativePath = " + relativePath);
			
			// obtains ServletContext
			ServletContext context = getServletContext();
			
			// gets MIME type of the file
			String mimeType = context.getMimeType(filePath);
			if (mimeType == null) {			
				// set to binary type if MIME mapping not found
				mimeType = "application/octet-stream";
			}
			System.out.println("MIME type: " + mimeType);
			
			// modifies response
			response.setContentType(mimeType);
			response.setContentLength((int) downloadFile.length());
			
			// forces download
			String headerKey = "Content-Disposition";
			String headerValue = String.format("attachment; filename=\"%s\"", downloadFile.getName());
			response.setHeader(headerKey, headerValue);
			
			// obtains response's output stream
			OutputStream outStream = response.getOutputStream();
			
			byte[] buffer1 = new byte[4096];
			int bytesRead = -1;
			
			while ((bytesRead = inStream.read(buffer1)) != -1) {
				outStream.write(buffer1, 0, bytesRead);
			}
			
			inStream.close();
			outStream.close();
			
            
			
			
			/*
    		System.out.println(repoDir1 + "/" + s );

            FileOutputStream fos = new FileOutputStream("C:/Users/Mirjan/Downloads/" + s+".zip");
    		ZipOutputStream zos = new ZipOutputStream(fos);
    		ZipEntry ze= new ZipEntry(repoDir1 + "/" + s );
    		zos.putNextEntry(ze);
    		FileInputStream in = new FileInputStream(repoDir1 + "/" + s );
   	   
    		int len;
    		while ((len = in.read(buffer)) > 0) {
    			zos.write(buffer, 0, len);
    		}

    		in.close();
    		zos.closeEntry();
           
    		//remember close it
    		zos.close();
    		
    		*/
            //out.println("File Downloaded successfully "); 

 
        } catch (FileNotFoundException ex) {
            System.err.format("The file %s does not exist", "C:/Users/Mirjan/Downloads/temptFile.TXT");
        } catch (IOException ex) {
            System.err.println("I/O error: " + ex);
        }
	
	
	 %>

	 <% 	
        }
%>


</body>
</html>