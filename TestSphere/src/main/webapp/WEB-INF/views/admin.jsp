s<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin login Page</title>
<link href="..css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<%
	String message = (String) request.getAttribute("message");
	%>

	<div class="container">
		<h2>Admin login</h2>
		<form action="/adminLogin" method="post">
			<div class="form-group">
				<label for="username">Username:</label> <input type="username"
					id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" required>
			</div>
			<button type="submit" class="btn">Login</button>
		</form>
		<%
		if (message != null) {
		%>
		<div class="message"><%=message%></div>
		<%
		}
		%>
	</div>

</body>
</html>
