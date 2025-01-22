

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
	font-family: Arial, sans-serif;
	background: #4B0082; /* Dark blue gradient */
	display: flex;
	justify-content: center;
	align-items: center;
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
}

.btn-back {
	display: inline-block;
	padding: 10px 15px;
	background-color: #8A2BE2; /* Dark blue */
	color: white;
	text-decoration: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 20px;
}

.btn-back:hover {
	background-color: #D8BFD8; /* Pink */
}

h1 {
	margin: 20px;
	color: mediumslateblue;; /* Pink */
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
	background: #8A2BE2; /* Dark blue to pink gradient */
	color: white;
	padding: 10px;
	text-align: center;
	font-weight: bold;
}

td {
	background: #1e1e40; /* Dark blue */
	padding: 15px;
	text-align: center;
	border: 1px solid #8A2BE2; /* Border for distinction */
}

tr {
	margin-bottom: 10px; /* Margin between rows */
}

tr:nth-child(even) td {
	background: #14213d; /* Slightly lighter blue for alternating rows */
}

tr:hover td {
	background: #D8BFD8; /* Pink */
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
	List<Exam> completedExams = (List<Exam>) request.getAttribute("completedExams");
	List<Integer> listOfNumberOfQuestions = (List<Integer>) request.getAttribute("listOfNumberOfQuestions");
	%>

	<div class="container">
		<h1>Completed Exams</h1>

		<!-- Expression Tag -->
		<table>
			<thead>
				<tr>
					<th>S.No</th>
					<th>Exam Name</th>
					<th>Exam ID</th>
					<th>Exam Level</th>
					<th>Exam Type</th>
					<th>Date</th>
					<th>Score</th>
					<th>Max Marks</th>

					<th>Status</th>
					<th>Certificate</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (completedExams != null) {
					int sno = 1;
					for (Exam exam : completedExams) {
						double maxMarks = listOfNumberOfQuestions.get(sno - 1) * 2.0;
						boolean certificateAvailable = ((((exam.getScore() / maxMarks)) * 100) >= 60.0);
				%>
				<tr>
					<td><%=sno++%></td>
					<td><%=exam.getTestName()%></td>
					<td><%=exam.getExamId()%></td>
					<td><%=exam.getLevel()%></td>
					<td><%=exam.getType()%></td>
					<td><%=exam.getDate()%></td>
					<td><%=exam.getScore()%></td>
					<td><%=maxMarks%></td>
					<td><%=exam.getStatus() == 1 ? "<span style='color: green; font-weight: bold;'>Pass</span>"
		: "<span style='color: red; font-weight: bold;'>Fail</span>"%>
					</td>
					<td>
						<%
						if (!certificateAvailable) {
						%> <span
						style="color: gray; pointer-events: none; text-decoration: none;">Certificate
							Not Available</span> <%
 } else {
 %> <a
						href="/certificate/<%=exam.getExamId()%>" style="color: green;">Download
							Certificate</a> <%
 }
 %>
					</td>

				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
		<a href="/user/dashboard" class="btn-back">Back to User Dashboard</a>
	</div>
</body>
</html>

