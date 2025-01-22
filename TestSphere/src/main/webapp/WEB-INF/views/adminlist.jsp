<%@page import="test.vault.authentication.entities.Admin"%>
<%@page import="java.util.List"%>
<%@page import="test.vault.utility.utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminlist</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<%!String getUpperCase(String str) {
		return str.toUpperCase();
	}

	/* String maskPassword(String password){
		return password.replaceAll(".", "*");
	} */%>

	<%
	List<Admin> admins = (List<Admin>) request.getAttribute("adminsList");
	//out.print(admins);
	%>
	<table>
		<caption>Admins List</caption>
		<tr>
			<th>Serial No</th>
			<th>Full name</th>
			<th>Email Id</th>
			<th>Mobile No</th>
			<th>User name</th>
		</tr>

		<%
		int serialNo = 0;
		for (Admin admin : admins) {
		%>
		<tr>
			<td class="serial_no"><%=++serialNo%></td>
			<td><%=getUpperCase(admin.getFullName())%></td>
			<td><%=admin.getEmail()%></td>
			<td><%=admin.getMobile()%></td>
			<td><%=admin.getUsername()%></td>


		</tr>
		<%
		}
		%>

	</table>






</body>
</html>