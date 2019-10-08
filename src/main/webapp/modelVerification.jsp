
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.File,org.eclipse.jgit.internal.storage.file.FileRepository, org.eclipse.jgit.lib.Ref, org.eclipse.jgit.lib.Repository, org.eclipse.jgit.revwalk.RevCommit, org.eclipse.jgit.revwalk.RevTree, org.eclipse.jgit.revwalk.RevWalk, org.eclipse.jgit.treewalk.TreeWalk, java.io.IOException"%>
<%@ page language="java" import="java.sql.*,org.eclipse.jgit.lib.*, java.text.SimpleDateFormat, java.util.Date, org.eclipse.jgit.api.Git" %>

<!DOCTYPE html>
<html lang="en">
<title>SPM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: "Lato", sans-serif}
.mySlides {display: none}
</style>
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
<h1 align="center">
 Here you can verify the validity of your designed model,
 <br>
 <br>
  which means ensuring the model respects the BPMN standard

</h1>
<br>
<br>
<table align="center" style="width:70%">
 
  
 
	<tr>
	
	<td>
		
		<h2 align="center">Private Repository</h2>
		<form  action="verifyValidity.jsp" onsubmit="return valids1()" name="form2">
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
listFilesForFolder(out, uanme);	%>

<%!
public void listFilesForFolder(JspWriter out, String uanme) throws IOException {

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

       	                    
       	                 String fileName = treeWalk.getPathString();
   	                    String search = ".bpmn";
    	                 if (fileName.matches("(?i:.*"+search+".*)"))

 	                    {
    	                	 
    	                	 
    	                	 
 	                    
       	                    out.print("<tr>");
                	        	out.print("<td>");
                	        	out.print("<input type=\"checkbox\" name=\"mine\" value=" +treeWalk.getPathString() +">");
                	        	
                	        	out.print("<font size=\"3\" color=\"black\">" + treeWalk.getPathString() + "</font>");

       	                FileMode fileMode = treeWalk.getFileMode(0);
       	             ObjectLoader loader = repository.open(treeWalk.getObjectId(0));
       	             System.out.println("README.md: " + getFileMode(fileMode) + ", type: " + fileMode.getObjectType() + ", mode: " + fileMode +
       	                     " size: " + loader.getSize());
       	          out.print("<td align = \"center\">" +getFileMode(fileMode)+"</td>");
  	       	    
	                   out.print("<td align = \"center\">" +count +"</td>");
       	          out.print("<td align = \"center\">" + loader.getSize() +"</td>");
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
					<input type="submit" value="Verification" name="s" >
					
					 <input type="hidden" id="custId" name="repo" value="private">
					
				</td>
			</tr>
			
				
			
		</table>
		</form>
	</td>
	
	
	
 
 <td>
		
		<h2 align="center">Public Repository</h2>
		<form  action="verifyValidity.jsp?" onsubmit="return valids1()" name="form2">
		<table title="YOUR DOCUMENTS" align="center" border="0">
			<tr align="center">
				<th>document name</th>
				<th style="width:30%">type</th>
				<th style="width:20%">Versions</th>
				<th style="width:20%">Size</th>
				
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

           	                    
           	                 String fileName = treeWalk.getPathString();
        	                    String search = ".bpmn";
         	                 if (fileName.matches("(?i:.*"+search+".*)"))

      	                    {
        	                    out.print("<tr>");
                 	        	out.print("<td>");
                 	        	out.print("<input type=\"checkbox\" name=\"mine\" value=" +treeWalk.getPathString() +">");
                	        	out.print("<font size=\"3\" color=\"black\">" + treeWalk.getPathString() + "</font>");
                 	       	   
                 	        	 FileMode fileMode = treeWalk.getFileMode(0);
                   	             ObjectLoader loader = repository.open(treeWalk.getObjectId(0));
                   	             System.out.println("README.md: " + getFileMode(fileMode) + ", type: " + fileMode.getObjectType() + ", mode: " + fileMode +
                   	                     " size: " + loader.getSize());
                   	          out.print("<td align = \"center\">" +getFileMode(fileMode)+"</td>");
              	       	    
            	                   out.print("<td align = \"center\">" +count +"</td>");
                   	          out.print("<td align = \"center\">" + loader.getSize() +"</td>");
        	                  
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
				<input type="submit" value="Verification" name="s" >

					 <input type="hidden" id="custId" name="repo" value="public">
					
				</td>
			</tr>
			</tr>
			
		</table>
		</form>
	</td>
 
 </tr>
 
 
 
 
 
 
</table>

	</div>
	<!-- //main -->
        <div>
<!-- The Contact Section -->
  <div class="w3-container w3-content w3-padding-64" style="max-width:800px" id="contact">
    <h2 class="w3-wide w3-center">CONTACT</h2>
    <p class="w3-opacity w3-center"><i>Do you have any problem? Send us an email!</i></p>
    <div class="w3-row w3-padding-32">
      <div class="w3-col m6 w3-large w3-margin-bottom">
        <i class="fa fa-map-marker" style="width:30px"></i> Camerino, Italy<br>
        <i class="fa fa-phone" style="width:30px"></i> Phone: +00 151515<br>
        <i class="fa fa-envelope" style="width:30px"> </i> Email: mirjantoci@gmail.com<br>
      </div>
      <div class="w3-col m6">
        <form action="contactEmail.jsp?" target="_blank">
          <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
            <div class="w3-half">
              <input class="w3-input w3-border" type="text" placeholder="Name" required name="Name">
            </div>
            <div class="w3-half">
              <input class="w3-input w3-border" type="text" placeholder="Email" required name="Email">
            </div>
          </div>
          <input class="w3-input w3-border" type="text" placeholder="Message" required name="Message">
          <button class="w3-button w3-black w3-section w3-right" type="submit">SEND</button>
        </form>
      </div>
    </div>
  </div>
  
<!-- End Page Content -->
</div>

<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge">
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
  <p class="w3-medium">Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">UNICAM</a></p>
</footer>

<script>
// Automatic Slideshow - change image every 4 seconds
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 4000);    
}

// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}

// When the user clicks anywhere outside of the modal, close it
var modal = document.getElementById('ticketModal');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</body>
</html>
