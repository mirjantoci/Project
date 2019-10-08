<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.File,org.eclipse.jgit.internal.storage.file.FileRepository, org.eclipse.jgit.lib.Ref, org.eclipse.jgit.lib.Repository, org.eclipse.jgit.revwalk.RevCommit, org.eclipse.jgit.revwalk.RevTree, org.eclipse.jgit.revwalk.RevWalk, org.eclipse.jgit.treewalk.TreeWalk, java.io.IOException"%>
<%@ page language="java" import="java.sql.*,java.io.FileOutputStream,java.io.OutputStream,org.eclipse.jgit.archive.ArchiveFormats,org.eclipse.jgit.api.Git,org.eclipse.jgit.api.errors.GitAPIException,org.eclipse.jgit.lib.*, java.text.SimpleDateFormat, java.util.Date, org.eclipse.jgit.api.Git" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%
	

	
	
	
	try  {
		 
		
		String repo;
		
		String repType= (String)request.getParameter("repo");

		String repositoryType = "public";
		String repName = "public";
		

		if (repType.equals(repositoryType))
		{repo = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git";
		repName = "public";

		}

		else
		{
			repo=(String)session.getAttribute("privateRepository");
			repName = (String)session.getAttribute("repPrivate");

			

		}
listFilesForFolder1(out,repo,repName);
%>

<jsp:forward page="createArchive.jsp"></jsp:forward>
<%
}

	
	catch(Exception e)
    {
   	    out.println("Wrote ");
   	 %>
   		<jsp:forward page="createArchive.jsp"></jsp:forward>
<%

   	 
}
	
%>




<%!
public void listFilesForFolder1(JspWriter out,String repo,String repName) {
	
    System.out.println("Wrote ----------------------------------");


            
        	 try  {
        		 
                         Repository repository = new FileRepository(repo );
                         
                         
                 // make the included archive formats known
                 ArchiveFormats.registerAll();
                 System.out.println("Wrote ----------------------------------");

                 try {
                     write(out, repository, ".zip", "zip",repName);
                     
                     
                 } finally {
                     ArchiveFormats.unregisterAll();
                 }
             }
         
         catch(Exception e)
         {
        	 
        	 %>
        		<jsp:forward page="createArchive.jsp"></jsp:forward>
     <%!
        	    //out.println("Wrote ");

        	 
	}
}
	 

			
	%>
	<%!

private static void write(JspWriter out,Repository repository, String suffix, String format, String filename) throws IOException, GitAPIException {
    // this is the file that we write the archive to
    try{
    File file = File.createTempFile(filename, suffix,new File("C:/Users/Mirjan/Downloads"));
    try (OutputStream out1 = new FileOutputStream(file)) {
        // finally call the ArchiveCommand to write out using the various supported formats
        try (Git git = new Git(repository)) {
            git.archive()
                    .setTree(repository.resolve("master"))
                    .setFormat(format)
                    .setOutputStream(out1)
                    .call();
        }
    }

    System.out.println("Wrote " + file.length() + " bytes to " + file);

    // clean up here to not keep using more and more disk-space for these samples
    //FileUtils.forceDelete(file);
    }
    catch(Exception e)
    {
   	    out.println("Wrote " + e);
   	 %>
		<jsp:forward page="createArchive.jsp"></jsp:forward>
<%!
   	 
}
}

%>
	
	
</body>
</html>