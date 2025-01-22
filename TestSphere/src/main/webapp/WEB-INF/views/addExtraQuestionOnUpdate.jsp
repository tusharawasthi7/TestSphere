<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Extra Questions</title>
<link href="../css/addExtraQuestionOnUpdate.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div class="container">
		<h1>Add Extra Questions</h1>
		<form action="/processAddExtraQuestions" method="post">
			<input type="hidden" name="testId" value="${testId}"> <input
				type="hidden" name="listOfIdsOfQuestion"
				value="${listOfIdsOfQuestion}"> <input type="hidden"
				name="type" value="${type}"> <label for="questionCount">Number
				of extra questions to add:</label> <input type="number" id="questionCount"
				name="questionCount" min="1"  max="50"required>

			<button type="submit">Add Questions</button>
		</form>
	</div>
</body>
</html>
