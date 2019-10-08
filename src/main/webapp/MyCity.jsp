<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String x = request.getParameter("ver");
String filename = request.getParameter("fileName");
String rep = request.getParameter("rep");
out.println(x);
out.println(filename);
out.println(rep);
%>
</body>
</html>