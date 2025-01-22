<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="test.vault.test_management.entities.McqQuestion"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MCQ Questions Practice</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	background-color: #6a0dad;
	margin: 20px;
	color: #333;
}

h1 {
	text-align: center;
	color: White;
	margin-bottom: 20px;
}

.question-container {
	justify-content: center; /* Centers items horizontally */
	align-items: center; /* Centers items vertically */
	width: 50%;
	margin-bottom: 20px;
	background-color: #fff;
	border-radius:10px;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin: 0 auto 15px; /* Centers the container itself horizontally */

}

.options-list {
	list-style-type: none;
	padding: 0;
}

.options-list li {
	background: #f4f4f4;
	margin: 5px 0;
	padding: 10px;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	cursor: pointer;
}

.options-list li:hover {
	background-color: grey;
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

.correct {
	background-color: #d4edda !important;
}

.incorrect {
	background-color: #f8d7da !important;
}

.correct-options {
	background-color: 0 0 5px rgba(0, 0, 0, 0.1);
	display: none;
}

.show-correct button {
	background-color: #8A2BE2;
	color: white;
	border: none;
	padding: 10px 15px;
	text-align: center;
	cursor: pointer;
	font-size: 14px;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	margin-top: 10px;
}

.show-correct button:hover {
	background-color: #FF69B4;
}
</style>
<script>
function toggleCorrectOptions(questionId) {
    const correctOptionsDiv = document.getElementById('correct-options-' + questionId);
    if (correctOptionsDiv) {
        correctOptionsDiv.style.display = correctOptionsDiv.style.display === 'none' ? 'block' : 'none';
    }
}

function checkAnswer(optionElem, correctOptions) {
    const selectedIndex = Array.from(optionElem.parentElement.children).indexOf(optionElem);
    if (correctOptions.map(i => i - 1).includes(selectedIndex)) {
        optionElem.classList.add('correct');
        optionElem.classList.remove('incorrect');
    } else {
        optionElem.classList.add('incorrect');
        optionElem.classList.remove('correct');
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const optionElements = document.querySelectorAll('.options');
    optionElements.forEach(option => {
        const correctOptions = JSON.parse(option.getAttribute('data-correct-options'));
        option.addEventListener('click', () => checkAnswer(option, correctOptions));
    });
});
</script>
</head>
<body>
	<h1>MCQ Questions Practice</h1>
	<%
	List<McqQuestion> mcqQuestions = (List<McqQuestion>) request.getAttribute("mcqQuestions");
	int j = 0;
	if (mcqQuestions != null && !mcqQuestions.isEmpty()) {
		for (McqQuestion question : mcqQuestions) {
			List<String> options = question.getOptions();
			List<Integer> correctOptions = question.getCorrectAnswer();
			String correctOptionsJson = new com.fasterxml.jackson.databind.ObjectMapper()
			.writeValueAsString(correctOptions);
	%>
	<div class="question-container">
		<h2>Question <%= j + 1 %></h2>
		<p>
			<strong>Question:</strong>
			<%=question.getQuestionTitle()%></p>
		<ul class="options-list" id="options-<%=question.getId()%>">
			<%
			j++;
			for (int i = 0; i < options.size(); i++) {
			%>
			<li class="options" data-correct-options='<%=correctOptionsJson%>'><%=options.get(i)%></li>
			<%
			}
			%>
		</ul>
		<div class="show-correct">
			<button type="button"
				onclick="toggleCorrectOptions(<%=question.getId()%>)">Show
				Correct Options</button>
		</div>
		<div class="correct-options"
			id="correct-options-<%=question.getId()%>"
			data-correct-answers="<%=question.getCorrectAnswer()%>">
			<strong>Correct Options:</strong>
			<ul>
				<%
				for (int correctOption : question.getCorrectAnswer()) {
				%>
				<li><%=correctOption%></li>
				<%
				}
				%>
			</ul>
		</div>


	</div>

	<%
	}
	} else {
	%>
	<p>No questions available.</p>
	<%
	}
	%>
	<a href="/user/dashboard" class="btn-back" style="margin-top: 25px;">Back
		to User Dashboard</a>


</body>
</html>
