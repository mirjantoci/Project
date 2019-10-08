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
body {
  background: #1F5C7B;
  /* fallback for old browsers */
  background: -webkit-linear-gradient(to top, #1F5C7B, #1F5C7B);
  background: -moz-linear-gradient(to top, #1F5C7B, #1F5C7B);
  background: -o-linear-gradient(to top, #1F5C7B, #1F5C7B);
  background: linear-gradient(to top, #1F5C7B, #1F5C7B);
  background-attachment: fixed;
  margin: 0;

	padding:0;

	font-family: Arial, Helvetica, sans-serif;

	font-size: 12px;

	line-height: 1.5em;

	color: #fff;

	width: 100%;

	display: table;
}

</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Guest User</title>
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
<style>
#templatemo_background_section_top {

	width: 100%;
	
	height: 163px;

	background: url(images/templatemo_top_section_bg.jpg) repeat-x;

}
.templatemo_container {

	width: 960px;
	margin: auto;

}

.templatemo_container {

	text-align: left;
	
}


#templatemo_header{
	height: 163px;
	width: 100%;
	background:url(images/templatemo_header.jpg) no-repeat;
}

#templatemo_logo {

	width: 280px;
	height: 65px;
	margin-top: 35px;
	margin-left: 40px;
	padding: 0;
	float: left;
	display: inline;
		
}
#templatemo_logo h1 {

	margin-top: 4px;
	font-size: 35px;
	color: #8fdaff;
	line-height: 0.8em;
	
}

#templatemo_logo h2 {

	margin-top: 4px;
	font-size: 11px;
	color: #1aa3e8;

}
</style>
<div id="templatemo_background_section_top">
		<div class="templatemo_container">
			<div id="templatemo_header">
				<div id="templatemo_logo">
					<h1>Software Project Management</h1>
				</div>
				</div>
				</div>
				</div>
	<!-- main -->
	<div class="main-w3layouts wrapper">
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
String firstName = request.getParameter("firstName");
System.out.println("firstname eshte " + firstName);

String lastName = request.getParameter("lastName");
System.out.println("lastname eshte " + lastName);

String privateRepository1 = request.getParameter("privateRepository");
System.out.println("privateRepository eshte " + privateRepository1);

%>
<br><br>

</h1>
<br>
<br>
<table align="center" style="width:70%">
  <tr>
    <th ></th>
    <th></th> 
    
  </tr>
  <tr>
    <td></td>
    <td> </td> 
    
  </tr>
  
 
	<tr>
	
	<td>
		
		<h2 align="center">Public Repository</h2>
		<form  action="removedoc.jsp" onsubmit="return valids1()" name="form2">
		<table title="YOUR DOCUMENTS" align="center" border="0">
			<tr align="center">
				<td align = "center">Document name</td>
				<td align = "center" style="width:30%">Type</td>
				<td align = "center" style="width:20%">Versions</td>
				<td align = "center" style="width:20%">Size</td>
				
			</tr>
		
	<%

listFilesForFolder1(out);	%>

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


<%!
public void listFilesForFolder1(JspWriter out) throws IOException {

	
	 try (
             Repository repository = new FileRepository( "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git" )
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
                		 String publicRep = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git";

                		

        	        	 Repository repository1 = new FileRepository( "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git" );
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

           	                    String repType1 = "publice";

        	                    out.print("<tr>");
                 	        	out.print("<td>");
                 	        	out.print("<input type=\"checkbox\" name=\"mine\" value=" +treeWalk.getPathString() +">");
                 	        	out.print("<a href=getversion1.jsp?fileName=" +treeWalk.getPathString() +"&reptype="+repType1+"&versions=" + count + ">"+treeWalk.getPathString()+"</a><br>");
                 	       	   
                 	        	 FileMode fileMode = treeWalk.getFileMode(0);
                   	             ObjectLoader loader = repository.open(treeWalk.getObjectId(0));
                   	             System.out.println("README.md: " + getFileMode(fileMode) + ", type: " + fileMode.getObjectType() + ", mode: " + fileMode +
                   	                     " size: " + loader.getSize());
                   	          out.print("<td align = \"center\">" +getFileMode(fileMode)+"</td>");
              	       	    
            	                   out.print("<td align = \"center\">" +count +"</td>");
                   	          out.print("<td align = \"center\">" + loader.getSize() +"</td>");
        	                  
         	        	
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
		
			
		</table>
		</form>
	</td>
	
	
	
 
 <td>
		
		<h2></h2>
		<form  action="removedoc.jsp" onsubmit="return valids1()" name="form2">
		<table title="YOUR DOCUMENTS" align="center" border="0">
			<tr>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		
		</table>
		</form>
	</td>
 
 </tr>
 
 
 
 
 
 
</table>

	</div>
	<!-- //main -->
	<div class="butoni">
	<a href="login.jsp" class="btn btn-info btn-lg" id ="login">
          <span class="glyphicon glyphicon-log-out"></span> Go to log in page
        </a>
        </div>
</body>
</html>