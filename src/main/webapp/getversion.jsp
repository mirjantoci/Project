<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.File,java.io.*,java.io.FileInputStream,java.io.FileOutputStream,java.util.zip.ZipEntry,java.util.zip.ZipOutputStream,java.nio.file.*,java.util.zip.*,org.apache.commons.io.FileUtils,java.io.IOException, org.eclipse.jgit.api.Git, org.eclipse.jgit.lib.Repository, org.eclipse.jgit.internal.storage.file.FileRepository" %>

<!DOCTYPE html>
<html>
<head>
<title>SignUp Form</title>
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

	<!-- main -->
	<div class="main-w3layouts wrapper">
	
	<%
String x = request.getParameter("versions");
String name = request.getParameter("fileName");
//out.println(x);
%>
<style>
body {
    text-align: center;
}
form {
    display: inline-block;
}
</style>	
	
<br>

<%
String search = ".bpmn";
   if (name.matches("(?i:.*"+search+".*)"))
   {
		String fileName=request.getParameter("fileName");
		String repPrivate=(String)session.getAttribute("reptype");
		String repType= (String)request.getParameter("reptype");
		
		if (repType.equals("publice"))
		{
			File source = new File("C:/Users/Thinkopen/Desktop/Repositories/publicrepository/"+fileName);
		    File dest = new File("C:/Users/Mirjan/Desktop/folder/bpmn-js-examples-master/bpmn-js-examples-master/minimap/resources/pizza-collaboration.bpmn");
		    try {
		        FileUtils.copyFile(source, dest);
	            System.out.println("File copied successfully"); 
	            ProcessBuilder builder = new ProcessBuilder(
	        	        "cmd.exe", "/c", "cd \"C:\\Users\\Mirjan\\Desktop\\folder\\bpmn-js-examples-master\\bpmn-js-examples-master\\minimap\" && npm run all");
	        	    builder.redirectErrorStream(true);
	        	    Process p = builder.start();
	        	    BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
	        	    String line;
	        	    while (true) {
	        	        line = r.readLine();
	        	        if (line == null) { break; }
	        	        System.out.println(line);
	        	    }
	        	    //File dest1 = new File("C:/xampp/htdocs/test/minimap/public");
	    		    //File source1 = new File("C:/Users/Mirjan/Desktop/folder/bpmn-js-examples-master/bpmn-js-examples-master/minimap/public");
			        //FileUtils.copyFile(source1, dest1);
		            
		            //Path sourceDirectory = Paths.get("C:/Users/Mirjan/Desktop/folder/bpmn-js-examples-master/bpmn-js-examples-master/minimap/public");
		            //Path targetDirectory = Paths.get("C:/xampp/htdocs/test/minimap/public");

		            //copy source to target using Files Class
		            //Files.copy(sourceDirectory, targetDirectory);
		            System.out.println("Folder copied successfully");
		            
		          File dest1 = new File("C:/xampp/htdocs/test/minimap/public/app.bundled.js");
	    		  File source1 = new File("C:/Users/Mirjan/Desktop/folder/bpmn-js-examples-master/bpmn-js-examples-master/minimap/public/app.bundled.js");
			      FileUtils.copyFile(source1, dest1);
			      
			      File dest2 = new File("C:/xampp/htdocs/test/minimap/public/app.bundled.js.map");
	    		  File source2 = new File("C:/Users/Mirjan/Desktop/folder/bpmn-js-examples-master/bpmn-js-examples-master/minimap/public/app.bundled.js.map");
			      FileUtils.copyFile(source2, dest2);
		          System.out.println("Files copied successfully"); 




		    }
		    catch(Exception e)
		    {
		    	
		    }
		}
		else
		{

			 String repo=(String)session.getAttribute("privateRepository");
			
			String[] parts = repo.split("\\.git");
			String part1 = parts[0]; // 004
			String repoPrivateDir = part1;
			
    	    File source = new File(repoPrivateDir+"/"+fileName);
		    File dest = new File("C:/Users/Mirjan/Desktop/folder/bpmn-js-examples-master/bpmn-js-examples-master/minimap/resources/pizza-collaboration.bpmn");
		    try {
		        FileUtils.copyFile(source, dest);
	            System.out.println("File copied successfully"); 
	            
	            
	            ProcessBuilder builder = new ProcessBuilder(
	        	        "cmd.exe", "/c", "cd \"C:\\Users\\Mirjan\\Desktop\\folder\\bpmn-js-examples-master\\bpmn-js-examples-master\\minimap\" && npm run all");
	        	    builder.redirectErrorStream(true);
	        	    Process p = builder.start();
	        	    BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
	        	    String line;
	        	    while (true) {
	        	        line = r.readLine();
	        	        if (line == null) { break; }
	        	        System.out.println(line);
	        	    }
	        	    //File dest1 = new File("C:/xampp/htdocs/test/minimap/public");
	    		    //File source1 = new File("C:/Users/Mirjan/Desktop/folder/bpmn-js-examples-master/bpmn-js-examples-master/minimap/public");
			        //FileUtils.copyFile(source1, dest1);
		            
		            //Path sourceDirectory = Paths.get("C:/Users/Mirjan/Desktop/folder/bpmn-js-examples-master/bpmn-js-examples-master/minimap/public");
		            //Path targetDirectory = Paths.get("C:/xampp/htdocs/test/minimap/public");

		            //copy source to target using Files Class
		            //Files.copy(sourceDirectory, targetDirectory);
		            System.out.println("Folder copied successfully");
		            
		          File dest1 = new File("C:/xampp/htdocs/test/minimap/public/app.bundled.js");
	    		  File source1 = new File("C:/Users/Mirjan/Desktop/folder/bpmn-js-examples-master/bpmn-js-examples-master/minimap/public/app.bundled.js");
			      FileUtils.copyFile(source1, dest1);
			      
			      File dest2 = new File("C:/xampp/htdocs/test/minimap/public/app.bundled.js.map");
	    		  File source2 = new File("C:/Users/Mirjan/Desktop/folder/bpmn-js-examples-master/bpmn-js-examples-master/minimap/public/app.bundled.js.map");
			      FileUtils.copyFile(source2, dest2);
		          System.out.println("Files copied successfully"); 
		    }
		    catch(Exception e)
		    {
		    	
		    }
		}
			
		
	    

out.println("<H2>");
out.println("This is a BPMN file. Please click GO to read and edit this file.");
out.println("</H2>");

String s=request.getParameter("fileName");
String rep=request.getParameter("reptype");


out.print("<form action=\"file://C:/Programs/sort.mw\">");

	   
	   %>
	    

<a href="print.html"  
    onclick="window.open('http://10.0.12.250/test/minimap/public/', 
                         'newwindow', 
                         'width=300,height=250'); 
              return false;"
 >Go</a>

</form>  
	   
	   
	   <%
	   
   }
   else{

out.println("<H2>");
out.println("Please choose the version that you want to open:");
out.println("</H2>");

String s=request.getParameter("fileName");
String rep=request.getParameter("reptype");


out.print("<form action=\"readfile.jsp?fileName=" + s +"&reptype=" + rep + "\" method=\"POST\">");
out.print("<select name=\"ver\" > ");
int ver = Integer.parseInt(x);
for(int i=0;i<ver;i++)
{

    out.print("<option value=" + i +">" + i +"</option>");
}
  
%>

</select>   
<input type="submit" value="Open"/>


</form>
<%
   }
%>
	</div>
	<!-- //main -->
</body>
</html>