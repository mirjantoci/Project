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

String[] lines = request.getParameterValues("mine");
int size = lines.length;

  for (int i=0; i<size; i++)
    {
	  out.println(lines[i]);

    }

  
  

%>
</body>
</html>