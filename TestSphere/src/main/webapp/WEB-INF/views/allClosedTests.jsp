<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="test.vault.test_management.entities.Test"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Closed Tests</title>
<link href="css/allClosedTests.css" rel="stylesheet" type="text/css" />
<script src="js/allClosedTests.js"></script>
</head>
<body>
	<h1>All Closed Tests</h1>
	<div class="test-container">
		<%
		List<Test> tests = (List<Test>) request.getAttribute("listOfTests");
		if (tests != null && !tests.isEmpty()) {
			for (Test test : tests) {
				String testType = test.getType().equalsIgnoreCase("mcq") ? "mcq" : "coding"; // Correctly comparing strings
		%>
		<div class="test-box">
			<h2>
				Test ID:
				<%=test.getTestId()%></h2>
			<p>
				<strong>Description:</strong>
				<%=test.getDescription()%></p>
			<button type="button"
				onclick="openTest('<%=test.getTestId()%>', '<%=test.getListOfIdsOfQuestion()%>', '<%=testType%>')">Open
				Test</button>
		</div>
		<%
		}
		} else {
		%>
		<p>No tests available.</p>
		<%
		}
		%>
	</div>
</body>
</html>
