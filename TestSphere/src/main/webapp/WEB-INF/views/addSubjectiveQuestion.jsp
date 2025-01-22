<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subjective Questions</title>
<link href="css/addSubjectiveQuestion.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div class="container">
		<h1>Add Questions</h1>
		<form id="questionsForm" action="/addSubjectiveQuestion" method="post">
			<label for="numQuestions">Enter Number of Questions:</label> <input
				type="number" id="numQuestions" min="1"
				placeholder="Number of Questions" required>
			<div id="questionsContainer"></div>
			<button type="button" id="generateQuestions">Start Adding
				Questions</button>
			<button type="submit" style="display: none;" id="submitQuestions">Submit
				Questions</button>
		</form>
	</div>

	<script src="js/addSubjectiveQuestion.js"></script>
</body>
</html>


