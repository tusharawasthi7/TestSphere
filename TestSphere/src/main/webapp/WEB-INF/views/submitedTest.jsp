<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Test Submitted</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #4B0082;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

.container {
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 80%;
	max-width: 1200px;
	text-align: center;
}

h1 {
	color: #28a745;
	font-size: 2em;
}

p {
	font-size: 1.2em;
	color: #333;
}

button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	text-decoration: none;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1em;
	transition: background-color 0.3s ease;
	margin-top: 20px;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Test Submitted</h1>
		<p>Thank you for completing the test. Your answers have been
			recorded successfully.</p>
		<%--        // <p>Your score: <strong><%= request.getAttribute("totalScore") %></strong></p>
--%>
		<button onclick="window.location.href='/user/dashboard'">Back
			to Dashboard</button>
	</div>
</body>
</html>
