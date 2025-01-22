<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="test.vault.reporting.entities.Exam"%>
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
	List<Exam> exams = (List<Exam>) request.getAttribute("exams");
	List<Integer> noOfQuestion = (List<Integer>) request.getAttribute("noOfQuestion");
	%>

	<div class="container">
		<h1>Test Report</h1>

		<!-- Expression Tag -->
		<table>
			<thead>
				<tr>
					<th>S.No</th>
					<th>User Name</th>
					<th>User ID</th>
					<th>Exam ID</th>
					<th>Date</th>
					<th>Score</th>
					<th>Max Marks</th>
					<th>Percentage</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (exams != null) {
					int sno = 1;
					for (Exam exam : exams) {
						int maxMarks = noOfQuestion.get(sno - 1) * 2;
						long percentage = ((Double) ((exam.getScore() / (noOfQuestion.get(sno - 1) * 2.0)) * 100)).longValue();
				%>
				<tr>
					<td><%=sno++%></td>
					<td><%=exam.getUserName()%></td>
					<td><%=exam.getUserId()%></td>
					<td><%=exam.getExamId()%></td>
					<td><%=exam.getDate()%></td>
					<td><%=exam.getScore()%></td>
					<td><%=maxMarks%></td>
					<td><%=percentage%>%</td>
					<td><%=exam.getStatus() == 1 ? "<span style='color: green; font-weight: bold;'>Pass</span>"
		: "<span style='color: red; font-weight: bold;'>Fail</span>"%></td>
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