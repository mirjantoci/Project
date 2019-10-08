<%@ page language="java"  import="java.io.*,java.sql.*,java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<html>

<body>

<jsp:include page="header.jsp"></jsp:include>
<%
	//to get the content type information from JSP Request Header
	String contentType = request.getContentType();
	//here we are checking the content type is not equal to Null and  as well as the passed 
	//data from mulitpart/form-data is greater than or equal to 0
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
		
 		DataInputStream in = new DataInputStream(request.getInputStream());
		//we are taking the length of Content type data
		int formDataLength = request.getContentLength();
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
		//this loop converting the uploaded file into byte code
		while (totalBytesRead < formDataLength) {
			byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
			totalBytesRead += byteRead;
			}
		String file = new String(dataBytes);
		//for saving the file name
		String saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1,contentType.length());
		int pos;
		//extracting the index of file 
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		int startPos = ((file.substring(0, pos)).getBytes()).length;
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
		Date s1=new Date();
   		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd"); 
   	  
		String author="miri";
		String docname="name";
		Integer docid=1;
		String version="1";
		String des="local";
		//saveFile=author+docname+version+saveFile;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dms?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","tocimirjan1994");
		Statement st1=con.createStatement();
		Statement st2=con.createStatement();
		String s=docname+version;
		String flag="true";
				
		// creating a new file with the same name and writing the content in new file
			if(flag.equals("true")){
				String filePath = "C:\\Users\\Mirjan\\Desktop\\" + saveFile;
				FileOutputStream fileOut = new FileOutputStream(filePath);
				fileOut.write(dataBytes, startPos, (endPos - startPos));
				fileOut.flush();
				fileOut.close();
				st1.executeUpdate("insert into documentload values('"+docname+"','"+des+"','"+docid+"','"+version+"','"+author+"','"+formDataLength+"','"+f.format(s1) +"','created','"+saveFile+"')");	
%>
		<Br><table border="0" align="center"><tr><td><b>You have successfully upload the document by the name of:</b>
		<% out.println(docname); %></td></tr></table> 		
<%			}	
		}
	else {
			out.print("not recieved");
		}
%>

</body>
</html>