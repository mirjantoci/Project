<jsp:include page="header.jsp"></jsp:include>
	<% 
	session.invalidate();
	%>
	<jsp:forward page="login.jsp"></jsp:forward>