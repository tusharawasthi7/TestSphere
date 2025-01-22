<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Coding Question</title>
<link href="css/addCodingQuestion.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">
		<h1>Add Coding Question</h1>
		<form action="/addExtraCodingQuestion" method="post"
			enctype="multipart/form-data">
			<label for="image">Upload Question Image:</label> <input type="file"
				id="image" name="image" accept=".png, .jpg, .jpeg" required> <label for="options">Options:</label>

			<div id="optionsContainer"></div>
			<button type="button" id="addOption">Add Option</button>

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
	<script src="js/addCodingQuestion.js"></script>
</body>
</html>
