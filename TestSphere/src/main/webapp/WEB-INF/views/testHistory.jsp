
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="test.vault.dashboard.entities.Test"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Report</title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background: #4B0082; /* Updated background color */
	display: flex;
	justify-content: center;
	align-items: flex-start; /* Align items at the top */
	height: 100vh;
	text-align: center;
}

.container {
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 80%;
	max-width: 1200px;
	height: auto; /* Ensures the height adjusts to content */
	margin-top: 20px; /* Ensure container has margin at the top */
}

.btn-back {
	display: inline-block;
	padding: 10px 15px;
	background-color: #8A2BE2;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 20px;
}

.btn-back:hover {
	background-color: #D8BFD8;
}

h1 {
	margin: 20px;
	color: black;; /* Pink */
	font-weight: bold;
	font-size: 24px;
}

table {
	margin: auto;
	border-collapse: collapse;
	width: 95%;
	color: white;
}

th {
	background: #8A2BE2;;
	color: white;
	padding: 10px;
	text-align: center;
	font-weight: bold;
}

td {
	background: #1e1e40;
	padding: 15px;
	text-align: center;
	border: 1px solid white; /* Border for distinction */
}

tr {
	margin-bottom: 10px; /* Margin between rows */
}

tr:nth-child(even) td {
	background: #14213d; /* Slightly lighter blue for alternating rows */
}

tr:hover td {
	background: #8d99ae; /* Pink */
	color: #4B0082; /* Dark blue text on hover */
}

.round-indicator {
	display: inline-block;
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	border-radius: 50%;
	background: #D8BFD8; /* Pink */
	color: white;
	font-weight: bold;
	margin: auto;
}
</style>
</head>
<body>

	<!-- Scripting Tag -->
	<%
	List<Test> testHistory = (List<Test>) request.getAttribute("testHistory");
	%>

	<div class="container">
		<h1>Test History</h1>

		<!-- Expression Tag -->
		<table>
			<thead>
				<tr>
					<th>S.No</th>
					<th>Test Name</th>
					<th>TestId</th>
					<th>Test Date</th>
					<th>Test Status</th>
					<th>View Test Report</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (testHistory != null) {
					int sno = 1;
					for (Test test : testHistory) {
				%>
				<tr>
					<td><%=sno++%></td>
					<td><%=test.getName()%></td>
					<td><%=test.getTest_id()%></td>
					<td><%=test.getDate()%></td>
					<td><%=test.getStatus() == 1 ? "<span style='color: green; font-weight: bold;'>Running</span>"
		: "<span style='color: red; font-weight: bold;'>Closed</span>"%>
					</td>
					<td><a href="/viewReport/<%=test.getTest_id()%>"
						class="btn-back">View Report</a></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
		<a href="/admin/dashboard" class="btn-back">Back to Admin
			Dashboard</a>
	</div>
</body>
</html>
