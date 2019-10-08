<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.File,org.eclipse.jgit.internal.storage.file.FileRepository, org.eclipse.jgit.lib.Ref, org.eclipse.jgit.lib.Repository, org.eclipse.jgit.revwalk.RevCommit, org.eclipse.jgit.revwalk.RevTree, org.eclipse.jgit.revwalk.RevWalk, org.eclipse.jgit.treewalk.TreeWalk, java.io.IOException"%>
<%@ page language="java" import="java.sql.*,org.eclipse.jgit.lib.*, java.text.SimpleDateFormat, java.util.Date, org.eclipse.jgit.api.Git" %>

<!--
Author: Colorlib
Author URL: https://colorlib.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>

<title>SPM</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<!-- //Custom Theme files -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- //web font -->
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<%
	//String search=request.getParameter("srch");
%>


<%
	String firstName=(String)session.getAttribute("firstName");
	String lastName=(String)session.getAttribute("lastName");
	String privateRepository1=(String)session.getAttribute("privateRepository");
	//out.println(privateRepository1);
%>

		<% 
request.getSession(false);
if (session == null) { %>
  
  <a href="login.jsp"> Login</a>
  <% 
} else {
    // Already created.
    %>
  <% 
}

//System.out.println("firstname eshte " + firstName);

//System.out.println("lastname eshte " + lastName);

//System.out.println("privateRepository eshte " + privateRepository1);

%>
<br><br>

<br>
<br>
<table align="center" style="width:70%">
 
  
 
	<tr>
	
	<td>
		
		<h2 align="center">Files</h2>
		<form  action="removedoc.jsp" onsubmit="return valids1()" name="form2">
		<table title="YOUR DOCUMENTS" align="center" border="0">
			<tr>
				<th>document name</th>
				<th style="width:30%">type</th>
				<th style="width:20%">Versions</th>
				<th style="width:20%">Size</th>
			</tr>
		
		
		<%
String uanme = "";
uanme = (String)session.getAttribute("privateRepository");
System.out.println("Ajo cka morra eshte " + uanme);
String search=request.getParameter("srch");
String us=request.getParameter("st");
if(us.equals("in")){
	String repType = "private";
	listFilesForFolder(out, uanme,search, repType);
}
else
{
	String repType = "publice";

	listFilesForFolder(out,  "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git",search, repType);
	}
	%>

<%!
public void listFilesForFolder(JspWriter out, String uanme, String search,String tipiRep) throws IOException {

	System.out.println("inside repository");
	System.out.println(uanme);

	try (
            Repository repository = new FileRepository( uanme)
            ) {
        Ref head = repository.findRef("HEAD");

        // a RevWalk allows to walk over commits based on some filtering that is defined
        try (RevWalk walk = new RevWalk(repository)) {
            RevCommit commit = walk.parseCommit(head.getObjectId());
            RevTree tree = commit.getTree();
            //System.out.println("Having tree: " + tree);

            // now use a TreeWalk to iterate over all files in the Tree recursively
            // you can set Filters to narrow down the results if needed
            try (TreeWalk treeWalk = new TreeWalk(repository)) {
                treeWalk.addTree(tree);
                treeWalk.setRecursive(true);
                while (treeWalk.next()) {
               	 //if (treeWalk.getPathString().equals("README.md"))
               	 //{
               		 
               	// }
               	 //else{
               		
               		

       	        	 Repository repository1 = new FileRepository(uanme);
       	                Git git = new Git(repository1);
       	                    Iterable<RevCommit> logs = git.log()
       	                            .call();
       	                    int count = 0;
       	                   
       	                    logs = git.log()
       	                            // for all log.all()
       	                            .addPath(treeWalk.getPathString())
       	                            .call();
       	                    count = 0;
       	                    for (RevCommit rev : logs) {
       	                        System.out.println("Commit: " + rev /* + ", name: " + rev.getName() + ", id: " + rev.getId().getName() */);
       	                        count++;
       	                    }
       	                    System.out.println("Had " + count + " commits on " + treeWalk.getPathString());
       	                    String repType = "private";


       	                    //if (search.equals(treeWalk.getPathString()))
       	                    //{
       	                    	
       	                   // }
       	                   // else
       	                	   String fileName = treeWalk.getPathString();
       	                if (fileName.matches("(?i:.*"+search+".*)"))

       	                    {
       	                    
       	                    //start of file
       	                    out.print("<tr>");
                	        	out.print("<td>");
                	        	out.print("<input type=\"checkbox\" name=\"mine\" value=" +treeWalk.getPathString() +">"); //checkbox
                	        	out.print("<a href=getversion.jsp?fileName=" +treeWalk.getPathString() +"&reptype="+tipiRep+"&versions=" + count + ">"+treeWalk.getPathString()+"</a><br>");
                	       	   
       	                   
       	                   
       	                FileMode fileMode = treeWalk.getFileMode(0);
       	             ObjectLoader loader = repository.open(treeWalk.getObjectId(0));
       	             System.out.println("README.md: " + getFileMode(fileMode) + ", type: " + fileMode.getObjectType() + ", mode: " + fileMode +
       	                     " size: " + loader.getSize());
       	          out.print("<td align = \"center\">" +getFileMode(fileMode)+"</td>"); //type of the file
  	       	    
	                   out.print("<td align = \"center\">" +count +"</td>");
       	          out.print("<td align = \"center\">" + loader.getSize() +"</td>");
       	          
       	          //end of file
       	                    }
               	 //out.println("found: " + treeWalk.getPathString());
               	 }
                }
            }
        }
        catch(Exception e)
        {
	}
	 }

%>
		
			<tr align="center">
				<td colspan="8">
					<input type="submit" value="Delete" name="s" >
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Edit" name="s">
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Share" name="s">&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Move" name="s">&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Download" name="s">&nbsp;&nbsp;&nbsp;&nbsp;
					
					 <input type="hidden" id="custId" name="repo" value="private">
					
				</td>
			</tr>
			
				
			
		</table>
		</form>
	</td>
	
	
	
 
 <%!
private static String getFileMode(FileMode fileMode) {
    if (fileMode.equals(FileMode.EXECUTABLE_FILE)) {
        return "Executable File";
    } else if (fileMode.equals(FileMode.REGULAR_FILE)) {
        return "Normal File";
    } else if (fileMode.equals(FileMode.TREE)) {
        return "Directory";
    } else if (fileMode.equals(FileMode.SYMLINK)) {
        return "Symlink";
    } else {
        // there are a few others, see FileMode javadoc for details
        throw new IllegalArgumentException("Unknown type of file encountered: " + fileMode);
    }
}

%>
 
 </tr>
 
 
 
 
 
 
</table>

	</div>
	<!-- //main -->
        <div>
</body>
</html>