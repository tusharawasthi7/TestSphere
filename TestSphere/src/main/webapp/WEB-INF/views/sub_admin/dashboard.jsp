<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f0f4f8;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100vh;
}

h1 {
	margin-top: 20px;
	color: #333333;
	font-size: 28px;
	text-align: center;
}

.container {
	width: 100%;
	max-width: 800px;
	padding: 20px;
	background-color: #ffffff;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	margin-top: 20px;
	text-align: center;
}

.container h2 {
	margin-bottom: 20px;
	color: #333333;
}

.container .form-group {
	margin-bottom: 15px;
	text-align: left;
}

.container label {
	display: block;
	margin-bottom: 5px;
	color: #555555;
	font-weight: bold;
}

.container input[type="text"], .container input[type="password"] {
	width: 100%;
	padding: 12px;
	border: 1px solid #cccccc;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 14px;
	transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.container input[type="text"]:focus, .container input[type="password"]:focus
	{
	border-color: #007bff;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
	outline: none;
}

.container button.btn {
	width: 100%;
	padding: 12px;
	background-color: #28a745;
	border: none;
	border-radius: 5px;
	color: #ffffff;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.3s ease;
}

.container button.btn:hover {
	background-color: #218838;
	transform: translateY(-2px);
}

.container p {
	margin-top: 15px;
	color: #666666;
}

.container a {
	color: #007bff;
	text-decoration: none;
}

.container a:hover {
	text-decoration: underline;
}

/* Responsive Design */
@media ( max-width : 600px) {
	.container {
		padding: 15px;
	}
	h1 {
		font-size: 24px;
	}
	.container input[type="text"], .container input[type="password"],
		.container button.btn {
		font-size: 14px;
	}
}
</style>
<meta charset="UTF-8">
<title>Sub-Admin | Dashboard</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<h1>Sub Admin Dashboard</h1>
	<div class="container">


		<%@include file="../message.jsp"%>
		<!-- <%@include file="../view_admin_data.jsp"%>-->

	</div>




</body>
</html>