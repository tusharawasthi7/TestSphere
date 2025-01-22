<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Test Details</title>
<link href="css/editTestDetails.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/popup.css">
<script>
	function validateForm() {
		const startDate = document.getElementById('startDate').value;
		const endDate = document.getElementById('endDate').value;
		const error = document.getElementById('error-message');
		const currentDate = new Date().toISOString().split('T')[0];

		if (new Date(endDate) < new Date(startDate)) {
			error.style.display = 'block';
			error.textContent = 'End date cannot be earlier than the start date.';
			return false;
		}
		if (new Date(currentDate) > new Date(startDate)) {
			error.style.display = 'block';
			error.textContent = 'Start date cannot be earlier than the Current date.';
			return false;
		}

		error.style.display = 'none';
		return true;
	}
</script>
</head>
<body>
	<%-- <!-- Modal Structure -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <p id="modalMessage"></p>
        <div class="modal-footer">
            <button id="okButton">OK</button>
        </div>
    </div>
</div>
<div id="popupMessageContainer" style="display:none;" data-message="${popupMessage}"></div>--%>
	<div class="container">
		<h1></h1>
		<h1>Edit Test Details</h1>
		<form action="/updateTestDetails" method="post"
			onsubmit="return validateForm()">

			<label for="startDate">Start Date:</label> <input type="date"
				id="startDate" name="startDate" required> <label
				for="endDate">End Date:</label> <input type="date" id="endDate"
				name="endDate" required> <label for="description">Test Name</label>
			<input type="text" id="description" name="description" min="1" max="100" style="width:106vh;height:5vh;margin-bottom:5px"
				required></input>

			<label for="level">Level:</label> <select id="level" name="level"
				required>
				<option value="beginner">Beginner</option>
				<option value="intermediate">Intermediate</option>
				<option value="expert">Expert</option>
			</select> <input type="hidden" name="type"
				value="<%=request.getAttribute("type")%>" /> <input type="hidden"
				name="testId" value="<%=request.getAttribute("testId")%>" /> <input
				type="hidden" name="catalogId"
				value="<%=request.getAttribute("catalogId")%>" /> <input
				type="hidden" name="listOfIdsQuestions"
				value="<%=request.getAttribute("remainingQuestionIds")%>" /> <label
				for="time">Enter total time for test in minutes:</label> <input
				type="number" id="time" name="time" min="1" max="600" required>
			<div id="error-message" class="error"></div>
			<button type="submit">Start</button>
		</form>
	</div>
	<!-- <script src="/js/popup1.js"></script> -->
</body>
</html>
