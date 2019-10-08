<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="org.eclipse.jgit.internal.storage.file.FileRepository, org.eclipse.jgit.lib.Ref, org.eclipse.jgit.lib.Repository, org.eclipse.jgit.revwalk.RevCommit, org.eclipse.jgit.revwalk.RevTree, org.eclipse.jgit.revwalk.RevWalk, org.eclipse.jgit.treewalk.TreeWalk, java.io.IOException,org.eclipse.jgit.lib.ObjectId,org.eclipse.jgit.lib.ObjectLoader, org.eclipse.jgit.lib.Constants, org.eclipse.jgit.treewalk.filter.PathFilter,java.io.ByteArrayOutputStream , org.eclipse.jgit.api.Git, org.eclipse.jgit.api.errors.GitAPIException, org.eclipse.jgit.internal.storage.file.FileRepository, org.eclipse.jgit.lib.Constants, org.eclipse.jgit.lib.ObjectId, org.eclipse.jgit.lib.ObjectLoader, org.eclipse.jgit.lib.Repository, org.eclipse.jgit.revwalk.RevCommit, org.eclipse.jgit.revwalk.RevTree, org.eclipse.jgit.revwalk.RevWalk, org.eclipse.jgit.treewalk.TreeWalk, org.eclipse.jgit.treewalk.filter.PathFilter"  %>

<!--
Author: Colorlib
Author URL: https://colorlib.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>SignIn Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
.butoni {
    position: absolute;
right:    0;
bottom:   0;
}

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
body {
  background: #1F5C7B;
  /* fallback for old browsers */
  background: -webkit-linear-gradient(to top, #1F5C7B, #1F5C7B);
  background: -moz-linear-gradient(to top, #1F5C7B, #1F5C7B);
  background: -o-linear-gradient(to top, #1F5C7B, #1F5C7B);
  background: linear-gradient(to top, #1F5C7B, #1F5C7B);
  background-size: cover;
  background-attachment: fixed;
  font-family: 'Roboto', sans-serif;
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
<h1 align="center">
<% 
out.println(request.getParameter("fileName"));
%>

</h1>
<br>

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
input {
  width: 15%;
  font-weight: bold;
  background-color: transparent;
  border: 1px solid;
  font-size: 13px;
  font-family: Arial;
  float: center;
}
td 
{
    height: 200px;
    width: 500px;
}
#cssTable td 
{
    text-align: center; 
    vertical-align: middle;
}
</style>

	<table border="1" align="center">
	<tr>
	
	
	
	
	
	
<%
String s=request.getParameter("fileName");
String repType= (String)request.getParameter("reptype");
String rep = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/.git";


String ver = request.getParameter("ver");
int maxver = Integer.parseInt(ver);
//out.println(repType);
//out.println(s);
//out.println(rep);
//out.println(ver);
readFile(out,  rep, s,maxver);	%>

<%!
public void readFile(JspWriter out, String url, String fileName, int maxver) throws IOException,  GitAPIException {
	int c = 0;
	 try (
             Repository repository = new FileRepository( url);
             ) {
         try (Git git = new Git(repository)) {
             Iterable<RevCommit> logs = git.log()
                     .call();
             int count = 0;
             for (RevCommit rev : logs) {
                 //System.out.println("Commit: " + rev /* + ", name: " + rev.getName() + ", id: " + rev.getId().getName() */);
                 count++;
             }
             System.out.println("Had " + count + " commits overall on current branch");
             //out.println("Had " + count + " commits overall on current branch");
             logs = git.log()
                     // for all log.all()
                     .addPath(fileName)
                     .call();
             count = 0;
             for (RevCommit rev : logs) {
                 System.out.println("Commit: " + rev /* + ", name: " + rev.getName() + ", id: " + rev.getId().getName() */);
                 //out.println("Commit: " + rev /* + ", name: " + rev.getName() + ", id: " + rev.getId().getName() */);
                 count++;
             
             
             
                 
                 // find the HEAD
                 ObjectId lastCommitId = repository.resolve(Constants.HEAD);
                 // a RevWalk allows to walk over commits based on some filtering that is defined
                 try (RevWalk revWalk1 = new RevWalk(repository)) {
                     RevCommit commit1 = revWalk1.parseCommit(rev);
                     //System.out.println("Having tree: " + lastCommitId);
                     //552965f69c99bc5c4f8efdab92a47285f7017f12
                     // and using commit's tree find the path
                     RevTree tree = commit1.getTree();
                     //System.out.println("Having tree: " + tree);
                     // now try to find a specific file
                     try (TreeWalk treeWalk = new TreeWalk(repository)) {
                         //System.out.print(treeWalk);
                         treeWalk.addTree(tree);
                         treeWalk.setRecursive(true);
                         treeWalk.setFilter(PathFilter.create(fileName));
                         System.out.print(treeWalk);
                         if (!treeWalk.next()) { 
                             throw new IllegalStateException("Did not find expected file 'README.md'");
                         }
                         ObjectId objectId = treeWalk.getObjectId(0);
                         ObjectLoader loader = repository.open(objectId);
                         // and then one can the loader to read the file
                        final ByteArrayOutputStream stream = new ByteArrayOutputStream();
                        
                         loader.copyTo(stream );
                         if (maxver == c)
                         {
                         out.print("<td style=\"text-align: center; \"> <br>"+stream+"<br></td>");
                         }
                         c++;
                         
                     }
                     revWalk1.dispose();
                 }
             
                 
                 
                 System.out.println("");
             
             
             }
             System.out.println("Had " + count + " commits on miro");
         }
     }
 
}
%>


	
</tr>
	

	</table>
					<div class="butoni">
	<a href="nonregister.jsp" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-log-out"></span> Go to public files
        </a>
        </div>
	
</body>
</html>