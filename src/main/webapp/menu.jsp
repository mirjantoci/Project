<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<script src="./SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
		<link href="./SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<%
		String uid=(String)session.getAttribute("firstName");
		
	%>
		<ul id="MenuBar1" class="MenuBarHorizontal">
		  <li><a href="WelcomeUser.jsp" >Home</a> </li>
		  <li><a href="profile.jsp" >Profile</a></li>
		  <li><a class="MenuBarItemSubmenu" href="#">Documents</a>
		    <ul>
		      <li><a href="createFile.jsp?repo=private" >Create Private Document</a></li>
		      <li><a href="createFile.jsp?repo=public" >Create Public Document</a></li>
		      <li><a href="createBpmnFile.jsp" >Create BPMN file</a></li>
		    </ul>
		  </li>
		   <li><a class="MenuBarItemSubmenu" href="#">Add files</a>
		    <ul>
		      <li><a href="uploadFile.jsp?repo=private" >Add to Private repository</a></li>
		      <li><a href="uploadFileToPublic.jsp?repo=public" >Add to Public repository</a></li>
		    </ul>
		  </li>
		   <li><a class="MenuBarItemSubmenu" href="#">Folders</a>
		    <ul>
		      <li><a href="createFolder.jsp?repo=private" >Create Private Folder</a></li>
		      <li><a href="createFolder.jsp?repo=public" >Create Public Folder</a></li>
		    </ul>
		  </li>
		  <li><a class="MenuBarItemSubmenu" href="#">Download</a>
		    <ul>
		      <li><a href="filesToDownload.jsp" >Files as Zip</a></li>
		      <li><a href="allFilesToDownload.jsp" >all Files as ZIP</a></li>
		    </ul>
		  </li>
		   		  <li><a href="search.jsp" >Search</a></li>
		  <li><a href="modelVerification.jsp" >Verify Model</a></li>

		  <li><a href="logout.jsp" id = "logoutLink" >Logout</a></li>
		</ul>
		
		<script type="text/javascript">
		<!--
		var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
		//-->
		</script>
		<br /><br /><br />
	</body>
</html>
