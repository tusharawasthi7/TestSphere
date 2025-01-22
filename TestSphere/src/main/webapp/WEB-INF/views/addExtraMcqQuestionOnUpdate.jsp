
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mcq Question</title>
<link href="css/singleQuestionForm.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">
		<h1>Enter Question</h1>
		<form id="questionForm" action="/addExtraMcqQuestion" method="post">
			<label for="title">Question Title:</label> <input type="text"
				id="title" name="title" placeholder="Enter question title" required>
			<label for="options">Options (2-6):</label>
			<div class="option-container" id="option-container"></div>
			<button type="button" class="add-option" id="addOption">Add
				Option</button>
			<label for="correct-options">Correct Options:</label>
			<div id="correct-options"></div>
			<input type="hidden" name="testId"
				value="<%=request.getAttribute("testId")%>"> <input
				type="hidden" name="listOfIdsOfQuestion"
				value="<%=request.getAttribute("listOfIdsOfQuestion")%>"> <input
				type="hidden" name="questionCount"
				value="<%=request.getAttribute("questionCount")%>"> <input
				type="hidden" name="currentCount"
				value="<%=request.getAttribute("currentCount")%>">
			<button type="submit">Add Question</button>
		</form>
	</div>
	<script src="js/singleQuestionForm.js"></script>
</body>
</html>