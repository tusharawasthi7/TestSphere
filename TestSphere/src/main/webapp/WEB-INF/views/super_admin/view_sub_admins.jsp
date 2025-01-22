<%@page import="test.vault.authentication.entities.Admin"%>
<%@page import="java.util.List"%>
<%@page import="test.vault.utility.utils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Sub Admins List</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">

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
			<caption style="color: black; font-size: 6vh;">Admins List</caption>
			<tr>
				<th>Serial No</th>
				<th>Full name</th>
				<th>Email Id</th>
				<th>Mobile No</th>
				<th>User name</th>
				<th>Status</th>
			</tr>

			<%
			int serialNo = 0;
			for (Admin admin : admins) {
				String status = admin.getAuthorized() ? "Reject" : "Approve";
				int adminId = admin.getId();
			%>
			<tr>
				<td class="serial_no"><%=++serialNo%></td>
				<td><%=getUpperCase(admin.getFullName())%></td>
				<td><%=admin.getEmail()%></td>
				<td><%=admin.getMobile()%></td>
				<td><%=admin.getUsername()%></td>

				<td><a href="/admin/changeAuth/<%=adminId%>"
					style="color: white"><%=status%></a></td>

			</tr>
			<%
			}
			%>

		</table>

	</div>

</body>
</html>