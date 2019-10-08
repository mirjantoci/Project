<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.File,org.apache.commons.io.FileUtils, org.eclipse.jgit.api.Git, org.eclipse.jgit.lib.Repository, org.eclipse.jgit.internal.storage.file.FileRepository" %>

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
	String repo;
	
	String repType= (String)request.getParameter("repo");

	
        //out.println(s1); 
        	//out.println(request.getParameter("repo"));
        	
        	%>
        	<h1> Uploading a file </h1>
        	<br>
        	<br>
        	
<table align="center">
	
   <tr>
   	 <td>
   	 
   	 <form onsubmit="return vali()" method="post"  action="upload1" name="form2" enctype="multipart/form-data">
		    <table>
			     <tr>
			     	<td><b>Select a file to upload </b></td>
			      	<td><input type="file" name="uploadfile"> </td>
			      	    <input type="hidden" id="custId" name="repo" value="<%= repType%>">
			      	
			    	<td><p id="f3"></p></td>
			    </tr>
			    <tr>
			    	<td colspan="1"><input type="hidden" name="todo" value="upload">
			        	<input type="submit" name="Submit" value="Upload">
			        	<input type="reset" name="Reset" value="Cancel">
			        </td>
		    	</tr>
		    </table>
		</form>
	</td>
 </tr>
</table>




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
