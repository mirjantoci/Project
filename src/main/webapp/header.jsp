<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./css/templatemo_style.css" rel="stylesheet" type="text/css" />

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
<%
	String uid=(String)session.getAttribute("firstName");
	if(uid==null){
%>
		<jsp:forward page="login.jsp"></jsp:forward>
<%
	}
	else{
		
	
%>
<div id="templatemo_background_section_top">
		<div class="templatemo_container">
			<div id="templatemo_header">
				<div id="templatemo_logo">
					<h1>SOFTWARE PROJECT MANAGEMENT</h1>
                   
				</div>
            <%if(!uid.equals("admin")){ %>
				<div id="templatemo_search_box">
					
				</div>
			<%} %>
		</div>
	</div></div>
<jsp:include page="menu.jsp"></jsp:include>

<%} %>
</body>
</html>