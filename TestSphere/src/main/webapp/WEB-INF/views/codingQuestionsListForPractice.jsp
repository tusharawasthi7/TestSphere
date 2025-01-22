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
<link href="../css/codingQuestionListForPractice.css" rel="stylesheet"
	type="text/css" />
</head>
<body>

	<div class="container">
		<h1>Practice Tests</h1>
		<table>
			<tr>
				<th>SNo</th>
				<th>Description</th>
				<th>Test Level</th>
				<th>Test Type</th>
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
				<td>Coding</td>
				<td>
					<form action="/user/codingPracticeQuestions" method="post">
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
