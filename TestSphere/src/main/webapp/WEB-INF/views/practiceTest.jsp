<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Practice Test</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #656E77;
	color: #333;
	margin: 0;
	padding: 20px;
}

h1 {
	text-align: center;
	color: #4CAF50;
}

.button {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #393e41;;
	border: none;
	border-radius: 5px;
	box-shadow: 0 4px #999;
	margin: 20px auto;
	display: block;
}

.button:hover {
	background-color: #3B373B;
}

.button:active {
	background-color: #393e41;
	box-shadow: 0 2px #666;
	transform: translateY(2px);
}

#options {
	display: none;
	text-align: center;
	margin-top: 20px;
}

.option-button {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: black;
	border: none;
	border-radius: 5px;
	box-shadow: 0 4px #999;
	margin: 10px 20px;
}

.option-button:hover {
	background-color: black;
}

.option-button:active {
	background-color: black;
	box-shadow: 0 2px #666;
	transform: translateY(2px);
}
</style>
<script>
	function showOptions() {
		document.getElementById('options').style.display = 'block';
	}
</script>
</head>
<body>
	<h1>Practice Test</h1>
	<button class="button" onclick="showOptions()">View Practice
		Test</button>
	<div id="options">
		<form action="questionPractice" method="get" style="display: inline;">
			<input type="hidden" name="idPracticeTest" value="1">
			<button class="option-button" type="submit">Coding</button>
		</form>
		<form action="questionPractice" method="get" style="display: inline;">
			<input type="hidden" name="idPracticeTest" value="3">
			<button class="option-button" type="submit">MCQ Test</button>
		</form>
		<form action="allClosedTest" method="get" style="display: inline;">
			<button class="option-button" type="submit">Closed Test</button>
		</form>
	</div>
</body>
</html>
