<!--
Author: Colorlib
Author URL: https://colorlib.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" import="java.sql.*, guest.UsersService, guest.Users, java.text.SimpleDateFormat, java.util.Date, org.hibernate.Criteria, org.hibernate.criterion.Restrictions, org.hibernate.Session, org.hibernate.SessionFactory, org.hibernate.cfg.Configuration, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<title>Forgot Password</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="./css/NewFile.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- //web font -->
</head>
<body>
	<!-- main -->
<%
String token1=request.getParameter("token");
String uemail=request.getParameter("email");


UsersService usersService = new UsersService();


			System.out.println("*** Find - start ***");
			Users another = usersService.findById(uemail);
			System.out.println(another.getResetToken());
			String tok = another.getResetToken();
			System.out.println(tok.equals("null"));
			if (!tok.equals("null"))
			 {
%>

	<div class="main-w3layouts wrapper">
		<h1>Reset Password</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
			<% String token=request.getParameter("token"); %>
				<form action="UpdatePassword" method="post">
				<p>Enter your new password</p>
					<input class="text" type="password" name="password" id="txtNewPassword" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
					<input class="text w3lpass" type="password" name="password" id="txtConfirmPassword" oninput="check(this)" placeholder="Confirm Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
					<input type="checkbox" onclick="myFunction()">Show Password
					<%
					
					  out.println("<input type=\"hidden\" id=\"custId\" name=\"token\" value=" +request.getParameter("token") +">");
					  out.println("<input type=\"hidden\" id=\"email\" name=\"email\" value=" +request.getParameter("email") +">");

					%>

	
					<div class="wthree-text">
						<label class="anim">
						</label>
						<div class="clear"> </div>
					</div>
					<input type="submit" value="SAVE">
				</form>
			</div>
		</div>
		<!-- copyright -->
		
		<!-- //copyright -->
		<ul class="colorlib-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<%
     }
    else
    {

    	request.setAttribute("message", "You can't reset anymore your password using this link &#x1F61E; Please clik again Forgot Password to get new link for reseting password.");
        request.getRequestDispatcher("login.jsp").forward(request, response);

    }
    %>

	<!-- //main -->
<script>
function myFunction() {
  var x = document.getElementById("txtNewPassword");
  var y = document.getElementById("txtConfirmPassword");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
  
  if (y.type === "password") {
	    y.type = "text";
	  } else {
	    y.type = "password";
	  }
}
</script>


	<script language='javascript' type='text/javascript'>
    function check(input) {
        if (input.value != document.getElementById('txtNewPassword').value) {
            input.setCustomValidity('Password Must be Matching.');
        } else {
            // input is valid -- reset the error message
            input.setCustomValidity('');
        }
    }
</script>
</body>
</html>