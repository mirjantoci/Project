<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.File,java.net.URL,java.net.HttpURLConnection,java.io.*,java.io.FileInputStream,java.io.FileOutputStream,java.util.zip.ZipEntry,java.util.zip.ZipOutputStream,java.nio.file.*,java.util.zip.*,org.apache.commons.io.FileUtils,java.io.IOException, org.eclipse.jgit.api.Git, org.eclipse.jgit.lib.Repository, org.eclipse.jgit.internal.storage.file.FileRepository" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>SPM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: "Lato", sans-serif}
.mySlides {display: none}

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
	 String filePath = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/";

	if (repType.equals(repositoryType))
	{
		
       filePath = "C:/Users/Thinkopen/Desktop/Repositories/publicrepository/"+s;
       //out.println(filePath); 
	}
	else
	{
		
		
		filePath ="C:/Users/Thinkopen/Desktop/Repositories/" +repPrivate+"/"+s;

	       //out.println(filePath); 

	}
	
	
       %>
       <%     
       
       try {
    	   
    	   File file = new File(filePath); 
			  BufferedReader br = new BufferedReader(new FileReader(file)); 
			  String st; 
			  String contents = "";
			  while ((st = br.readLine()) != null) 
				    contents = new StringBuffer (contents).append(st).append("\n").toString();
			//String content = new String(Files.readAllBytes(Paths.get(filePath)), "UTF-8");
			out.println("<br/>");
			out.println("<center>");
			out.println("<h1>Results of the Model Verification</h1>");
			out.println("</center>");
           post("http://pros.unicam.it:8080/S3/rest/BPMN/Verifier", contents, out);
               
           
       } catch(IOException ioe) {
           ioe.printStackTrace();
       }
   
%>
<%!




   public static String post(String postUrl, String data,JspWriter out) throws IOException {
       URL url = new URL(postUrl);
       HttpURLConnection con = (HttpURLConnection) url.openConnection();
       con.setRequestMethod("POST");

       con.setDoOutput(true);

       sendData(con, data);

       return read(con.getInputStream(), out);
   }

   protected static void sendData(HttpURLConnection con, String data) throws IOException {
       DataOutputStream wr = null;
       try {
           wr = new DataOutputStream(con.getOutputStream());
           wr.writeBytes(data);
           wr.flush();
           wr.close();
       } catch(IOException exception) {
           throw exception;
       } finally {
           closeQuietly(wr);
       }
   }

   private static String read(InputStream is, JspWriter out) throws IOException {
       BufferedReader in = null;
       String inputLine;
       StringBuilder body;
       try {
           in = new BufferedReader(new InputStreamReader(is));

           body = new StringBuilder();
           out.println("<table align=\"center\">");

           while ((inputLine = in.readLine()) != null) {
               body.append(inputLine);
               
               out.println("<tr>");
               out.println("<td align=\"left\">");
               out.println(inputLine);
               out.println("</td>");
               out.println("</tr>");
               
               //File fout = new File("C:\\Users\\Mirjan\\Desktop\\output.txt");
           	//FileOutputStream fos = new FileOutputStream(fout);
            
           	//BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(fos));
            

           		//bw.write(inputLine);
           		//bw.newLine();
           	
            
           	//bw.close();
           	
               Writer output;
               output = new BufferedWriter(new FileWriter("C:\\Users\\Mirjan\\Desktop\\output.txt", true));
               output.append(inputLine);
              output.write("\n");
               output.close();
           	
           	
             
           }
           out.println("</table>");
			out.println("<center>");
           out.println("<a href=\"verificationInfo.jsp\">Click here</a> for more informtion about Model Verification");
			out.println("</center>");

           out.println("<table align=\"center\">");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("<tr><td></td></tr>");
           out.println("</table>");

           
           in.close();

           return body.toString();
       } catch(IOException ioe) {
           throw ioe;
       } finally {
           closeQuietly(in);
       }
   }

   protected static void closeQuietly(Closeable closeable) {
       try {
           if( closeable != null ) {
               closeable.close();
           }
       } catch(IOException ex) {

       }
       
       
       

	}
   %>
  
        	
        

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
