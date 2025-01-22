<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="test.vault.test_management.entities.McqQuestion"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Start Test</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	background-color: #4B0082; /* Light background color */
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	width: 90%;
	height: 90%;
	display: flex;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	overflow: hidden;
}

.middle {
	width: 75%; /* 9 units */
	padding: 20px;
	background-color: #pink; /* White background for middle section */
	overflow-y: auto;
}

.right {
	width: 25%; /* 3 units */
	padding: 20px;
	background-color: #dfe6e9;
	/* Light gray background for right section */
	border-left: 1px solid #ccc;
	overflow-y: auto;
}

.question-container {
	display: none;
	margin-bottom: 20px;
	background-color: #00aecf;
	/* Light blue background for question container */
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.question-container.active {
	display: block;
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
	transition: background-color 0.3s;
	white-space: nowrap; /* Prevents text from wrapping */
	overflow-x: auto; /* Enables horizontal scrolling */
	overflow-y: hidden; /* Hides vertical scrollbar */
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none;
}

.options-list li::-webkit-scrollbar {
	display: none;
}

.options-list li:hover {
	background-color: 	#808080;
}

.correct {
	background-color: #d4edda !important;
}

.incorrect {
	background-color: #f8d7da !important;
}

.selected {
	background-color: 	#808080 !important;
}

.button {
	background-color: #007BFF;
	color: white;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	font-size: 14px;
	border-radius: 5px;
	margin-top: 20px;
	transition: background-color 0.3s;
}

.button:hover {
	background-color: #0056b3;
}

#timer {
	font-size: 20px;
	font-weight: bold;
	color: #d84315; /* Darker orange text */
	margin-bottom: 20px;
	font-size: 20px;
}

.circle {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	flex-wrap: wrap;
	justify-content: center;
	margin: 5px 0; /* Adjust margin for vertical layout */
	transition: background-color 0.3s;
}

.visited {
	background-color: green;
	color: white;
}

.not-visited {
	background-color: red;
	color: white;
}

#questionTable {
	display: flex;
	flex-direction: row; /* Change layout to column */
	align-items: flex-start;
	/* Align circles to the start of the container */
	gap: 10px; /* Space between circles */
}

.question-image {
	max-width: 100%;
	height: auto;
	display: block;
	margin: 0 auto;
}

.button-container {
	display: flex;
	flex-direction: row;
	align-items: center;
	gap: 10px; /* Space between buttons */
}

.instructions {
	background-color: #ffe0b2; /* Light orange background */
	color: #d84315; /* Darker orange text */
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 20px;
	font-weight: bold;
	font-size: 20px; /* Increased font size */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1, h2 {
	color: #37474f; /* Dark grey text */
}
</style>

</head>
<body>
	<div class="container">
		<div class="middle">
			<marquee class="instructions">
				<strong>Attention:</strong> Switching tabs will automatically submit
				your test. Please ensure you stay on this page until you complete
				the test.
			</marquee>
			<%
			int time = (int) request.getAttribute("time");
			%>

			           <input type="hidden" id="hiddenTime" value="<%=time%>">
			<h1 id="questionNumber"></h1>
			<div id="timer"></div>
			<%
			List<McqQuestion> mcqQuestions = (List<McqQuestion>) request.getAttribute("mcqQuestions");
			if (mcqQuestions != null && !mcqQuestions.isEmpty()) {
				ObjectMapper objectMapper = new ObjectMapper();
				int questionNumber = 1; // Variable to keep track of question number
				for (McqQuestion question : mcqQuestions) {
					List<String> options = question.getOptions();
					List<Integer> correctOptions = question.getCorrectAnswer();
					String correctOptionsJson = objectMapper.writeValueAsString(correctOptions);
			%>
			<div class="question-container"
				data-correct-options='<%=correctOptionsJson%>' data-score="0">
				<h2>
					Question
					<%=questionNumber++%></h2>
				<!-- Display question number -->
				<p>
					<strong>Question:</strong>
					<%=question.getQuestionTitle()%></p>
				<ul class="options-list" id="options-<%=question.getId()%>">
					<%
					for (int i = 0; i < options.size(); i++) {
					%>
					<li class="options"><label
						for="option<%=i%>-<%=question.getId()%>"><%=options.get(i)%></label>
					</li>
					<%
					}
					%>
				</ul>
			</div>
			<%
			}
			} else {
			%>
			<p>No questions available.</p>
			<%
			}
			%>
			<div class="button-container">
				<button id="back-question" class="button">Back</button>
				<button id="next-question" class="button">Next Question</button>
				<button id="submit-test" class="button" style="display: none;">Submit
					Test</button>
			</div>
			<form id="scoreForm" action="/submitScore" method="post"
				style="display: none;">
				<input type="hidden" id="totalScore" name="totalScore" value="">
				<input type="hidden" id="userId" name="userId" value=""> <input
					type="hidden" id="testId" name="testId" value="">
			</form>
		</div>
		<div class="right">
			<h2>Question Navigation</h2>
			<div id="questionTable"></div>
		</div>
	</div>
</body>
<script>
let totalScore = 0;
let currentQuestionIndex = 0;
let visitedQuestions = new Set();
let timePerQuestion = 60*document.getElementById('hiddenTime').value;
 
// Function to extract parameters from the URL
function getUrlParams() {
    const params = {};
    const queryString = window.location.pathname.split('/');
    if (queryString.length >= 4) {
        params.testId = queryString[2];
        params.userId = queryString[3];
    }
    return params;
}
 
// Retrieve userId and testId from the URL
const params = getUrlParams();
const testId = params.testId;
const userId = params.userId;
console.log("UserId: " + userId);
 
document.addEventListener('DOMContentLoaded', () => {
    let questions = Array.from(document.querySelectorAll('.question-container'));
    
    // Sort questions by data-id attribute (assumes each question has a data-id attribute)
    questions.sort((a, b) => {
        return parseInt(a.getAttribute('data-id')) - parseInt(b.getAttribute('data-id'));
    });
 
    timeLeft =  timePerQuestion; // Set total time based on the number of questions
 
    questions.forEach((question, index) => {
        const options = question.querySelectorAll('.options');
        const correctOptions = JSON.parse(question.getAttribute('data-correct-options'));
        let selectedOptions = [];
 
        options.forEach((option, idx) => {
            option.addEventListener('click', () => {
                // Toggle selection
                if (option.classList.contains('selected')) {
                    option.classList.remove('selected');
                    selectedOptions = selectedOptions.filter(opt => opt !== idx + 1);
                } else {
                    option.classList.add('selected');
                    selectedOptions.push(idx + 1);
                }
                
                console.log("correct option"+correctOptions);
                console.log("Selected"+selectedOptions);
                
 
                // Check if selected options exactly match correct options
                if (arraysMatch(correctOptions, selectedOptions)) {
                    question.setAttribute('data-score', '2');
                    correctOptions.forEach(opt => options[opt - 1].classList.add('correct'));
                } else {
                    question.setAttribute('data-score', '0');
                    options.forEach(opt => opt.classList.remove('correct'));
                }
            });
        });
    });
 
    // Show the first question
    showQuestion(currentQuestionIndex);
 
    document.getElementById('next-question').addEventListener('click', () => {
        nextQuestion();
    });
 
    document.getElementById('back-question').addEventListener('click', () => {
        previousQuestion();
    });
 
    document.getElementById('submit-test').addEventListener('click', () => {
        submitTest();
    });
 
    startTimer();
    updateQuestionTable(questions);
});
 
function arraysMatch(arr1, arr2) {
    if (arr1.length !== arr2.length) return false;
    arr1.sort();
    arr2.sort();
    for (let i = 0; i < arr1.length; i++) {
        if (arr1[i] !== arr2[i]) return false;
    }
    return true;
}
 
function submitTest() {
    const questions = document.querySelectorAll('.question-container');
    questions.forEach(question => {
        totalScore += parseInt(question.getAttribute('data-score') );
    });
 
    document.getElementById('totalScore').value = totalScore;
    document.getElementById('userId').value = userId;
    document.getElementById('testId').value = testId;
    document.getElementById('scoreForm').submit();
}
 
function nextQuestion() {
    const questions = document.querySelectorAll('.question-container');
    
    if (currentQuestionIndex < questions.length - 1) { // Ensure we don't go out of bounds
        questions[currentQuestionIndex].classList.remove('active');
        currentQuestionIndex++;
        visitedQuestions.add(currentQuestionIndex);
        showQuestion(currentQuestionIndex);
    }
 
    if (currentQuestionIndex === questions.length - 1) { // Update button visibility
        document.getElementById('next-question').style.display = 'none';
        document.getElementById('submit-test').style.display = 'inline-block';
    }
 
    updateQuestionTable();
}
 
function previousQuestion() {
    const questions = document.querySelectorAll('.question-container');
    if (currentQuestionIndex > 0) {
        questions[currentQuestionIndex].classList.remove('active');
        currentQuestionIndex--;
        showQuestion(currentQuestionIndex);
 
        if (currentQuestionIndex < questions.length - 1) {
            document.getElementById('next-question').style.display = 'inline-block';
            document.getElementById('submit-test').style.display = 'none';
        }
 
        updateQuestionTable();
    }
}
 
function showQuestion(index) {
    const questions = document.querySelectorAll('.question-container');
    if (index < questions.length) {
        questions[index].classList.add('active');
        /* // Display question number in the UI
        const questionNumber = document.getElementById('questionNumber');
        questionNumber.textContent = `Question ${index + 1} of ${questions.length}`;
         */
        // Mark this question as visited when user navigates to it
        visitedQuestions.add(index);
        updateQuestionTable();
    } else {
        console.error('Index out of bounds in showQuestion function');
    }
}
 
function startTimer() {
    const timerElement = document.getElementById('timer');
    const timer = setInterval(() => {
        if (timeLeft <= 0) {
            clearInterval(timer);
            alert("Time's up! Your test will be submitted.");
            submitTest();
        } else {
            timerElement.textContent = Math.floor(timeLeft / 60) + " minutes " + (timeLeft % 60) + " seconds remaining";
            timeLeft -= 1;
        }
    }, 1000);
}
 
/* function updateQuestionTable() {
    const table = document.getElementById('questionTable');
    table.innerHTML = '';
 
    const questions = document.querySelectorAll('.question-container');
    questions.forEach((question, index) => {
        let circle = document.createElement('div');
        circle.className = 'circle ' + (visitedQuestions.has(index) ? 'visited' : 'not-visited');
        circle.textContent = index + 1;
        table.appendChild(circle);
        circle.onclick = () => showSpecificQuestion(index); // Add click event to navigate to specific question
    });
} */
function updateQuestionTable() {
    const table = document.getElementById('questionTable');
    table.innerHTML = '';
 
    const questions = document.querySelectorAll('.question-container');
    let column;
    
    questions.forEach((question, index) => {
        if (index % 8 === 0) {
            // Create a new column after every 8th element
            column = document.createElement('div');
            column.className = 'column';
            table.appendChild(column);
        }
        
        let circle = document.createElement('div');
        circle.className = 'circle ' + (visitedQuestions.has(index) ? 'visited' : 'not-visited');
        circle.textContent = index + 1;
        column.appendChild(circle);
        circle.onclick = () => showSpecificQuestion(index); // Add click event to navigate to specific question
    });
}

 
function showSpecificQuestion(index) {
    const questions = document.querySelectorAll('.question-container');
    questions[currentQuestionIndex].classList.remove('active'); // Hide current question
    currentQuestionIndex = index; // Update current question index
    showQuestion(currentQuestionIndex); // Show the selected question
 
    // Mark this question as visited when user navigates to it
    visitedQuestions.add(currentQuestionIndex);
    updateQuestionTable();
 
    // Update button visibility
    if (currentQuestionIndex === questions.length - 1) {
        document.getElementById('next-question').style.display = 'none';
        document.getElementById('submit-test').style.display = 'inline-block';
    } else {
        document.getElementById('next-question').style.display = 'inline-block';
        document.getElementById('submit-test').style.display = 'none';
    }
}
 
 document.addEventListener('visibilitychange', function() {
    if (document.hidden) {
        submitTest();
    }
}); 


 
</script>


</html>