<html>
<head>
<script type="text/javascript">
	function ds(){
		sr=document.forms[0].srch.value;
		if(sr==null)		
			return false;
			return true;
	}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<form action="goToSearch.jsp" onsubmit="return ds()" method="post">
<table align="center">
	<tr>
		<td align="center">
			Search:<input type="text" name="srch" value="">
		</td>
	<tr>
		<td>
		within my Private Repository<input type="radio" name="st" value="in" checked>
		out of my Private Repository<input type="radio" name="st" value="out">
		</td>
	</tr>
	<tr>
		<td align="center">
		<input type="submit" value="search">
		</td>
	</tr>
	</table>
</form>	
</body>
</html>