<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="test.vault.test_management.entities.Test"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Practice Tests</title>
<link href="../css/mcqQuestionsListForPractice.css" rel="stylesheet"
	type="text/css" />
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: #4B0082; /* Dark blue gradient */
	display: flex;
	justify-content: center;
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
	margin: 5vh;
	height: fit-content;
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
	<div class="container">
		<h1>Practice Tests</h1>
		<table>
			<tr>
				<th>SNo</th>
				<th>Test Name</th>
				<th>Level</th>
				<th>Type</th>
				<th>Action</th>
			</tr>
			<%
			List<Test> tests = (List<Test>) request.getAttribute("listOfTests");
			if (tests != null) {
				int sno = 1;
				for (Test test : tests) {
			%>
			<tr>
				<td><%=sno++%></td>
				<td><%=test.getDescription()%></td>
				<td>
					<%
					String level;
					if (test.getLevel().equals("1")) {
						level = "Beginner";
					} else if (test.getLevel().equals("2")) {
						level = "Intermediate";
					} else {
						level = "Expert";
					}
					out.print(level);
					%>
				</td>
				<td>Mcq</td>

				<td>
					<form action="/user/mcqPracticeQuestions" method="post">
						<input type="hidden" name="testId" value="<%=test.getTestId()%>" />
						<input type="hidden" name="catalogId"
							value="<%=test.getCatalogId()%>" /> <input type="hidden"
							name="listOfIdsQuestions"
							value="<%=test.getListOfIdsOfQuestion()%>" />
						<button type="submit">Practice</button>
					</form>
				</td>
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="5">No tests available.</td>
			</tr>
			<%
			}
			%>
		</table>
		<a href="/user/dashboard" class="btn-back">Back to User Dashboard</a>
	</div>

</body>
</html>
