<!--
Author: Colorlib
Author URL: https://colorlib.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
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
		<h1>Forgot Password</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
		<p><font color="red">
			<%
			if (request.getAttribute("message") != null)
out.println(request.getAttribute("message"));
%>
</font>
</p>
				<form action="PasswordRecovery" method="post">
				<p>Enter your e-mail address and we'll send you a link to reset your password</p>
					<input class="text email" type="email" name="email" placeholder="Email" required="">
					<div class="wthree-text">
						<label class="anim">
						</label>
						<div class="clear"> </div>
					</div>
					<input type="submit" value="SUBMIT">
				</form>
				<p><a href="login.jsp" id="login"> Login Now!</a></p>
				
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
	<!-- //main -->
</body>
</html>