<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration Page</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: #4B0082; /* Dark blue gradient */
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	text-align: center;
	padding: 20px; /* To ensure content doesn't stick to the edges */
}

.container {
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 60%;
	max-width: 800px;
	margin: auto; /* Center align horizontally */
}

.btn-back {
	display: inline-block;
	padding: 10px 15px;
	background-color: #8A2BE2; /* Dark blue */
	color: white;
	text-decoration: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 20px;
}

.btn-back:hover {
	background-color: #D8BFD8; /* Pink */
}

h1, h2 {
	margin: 20px;
	color: mediumslateblue; /* Pink */
	font-weight: bold;
	font-size: 24px;
}

.form-group {
	margin-bottom: 15px;
	text-align: left;
}

label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

input[type="text"], input[type="email"], input[type="password"] {
	width: calc(100% - 22px);
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	margin-bottom: 15px; /* Add space between inputs */
}

.btn {
	display: inline-block;
	padding: 10px 15px;
	background-color: #8A2BE2; /* Dark blue */
	color: white;
	text-decoration: none;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 20px;
}

.btn:hover {
	background-color: #D8BFD8; /* Pink */
}

.error {
	color: red;
	font-size: 0.9em;
	margin-bottom: 15px; /* Add space below error messages */
}

p {
	margin-top: 20px;
}

p a {
	color: #8A2BE2; /* Dark blue */
	text-decoration: none;
}

p a:hover {
	text-decoration: underline;
}

.checklist {
	list-style-type: none;
	padding: 0;
}

.checklist li {
	color: red;
}

.checklist li.valid {
	color: green;
}
</style>
</head>
<body>
	<div class="container">
		<h2>User Registration</h2>
		<form action="registration" method="post">
			<div class="form-group">
				<label for="name">User Name:</label> <input type="text" id="name"
					name="name" max="60" required>
			</div>
			<div class="form-group">
				<label for="emailId">Email ID:</label> <input type="email"
					id="emailId" name="emailId" required>
			</div>
			<div class="form-group">
				<label for="phoneNo">Phone No:</label> <input type="tel"
					id="phoneNo" name="phoneNo" pattern="^[6-9]\d{9}$" required
					title="Enter a valid 10-digit mobile number starting with 6, 7, 8, or 9" style="width:723px;height:32px">
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" max="40" required>
				<ul class="checklist" id="passwordChecklist">
					<li id="length">At least 6 characters</li>
					<li id="special">At least one special character</li>
					<li id="number">At least one number</li>
				</ul>
			</div>
			<button type="submit" class="btn">Register</button>
		</form>
		<p>
			Already registered? <a href="/user/openLoginPage">Login here </a>
		</p>
		<div
			class="message <%=request.getAttribute("status") != null ? request.getAttribute("status") : ""%>">
			<%=request.getAttribute("message") != null ? request.getAttribute("message") : ""%>
		</div>
	</div>
	<script>
document.getElementById('password').oninput = function() {
	const password = document.getElementById('password').value;
	const lengthCheck = document.getElementById('length');
	const specialCheck = document.getElementById('special');
	const numberCheck = document.getElementById('number');

	const lengthPattern = /.{6,}/;
	const specialPattern = /[!@#$%^&*(),.?":{}|<>]/;
	const numberPattern = /[0-9]/;

	lengthCheck.classList.toggle('valid', lengthPattern.test(password));
	specialCheck.classList.toggle('valid', specialPattern.test(password));
	numberCheck.classList.toggle('valid', numberPattern.test(password));
};

document.getElementById('phoneNo').oninput = function() {
	const phoneNo = document.getElementById('phoneNo');
	const pattern = /^[6-9]\d{9}$/;
	if (!pattern.test(phoneNo.value)) {
		phoneNo.setCustomValidity('Please enter a valid 10-digit mobile number starting with 6, 7, 8, or 9.');
	} else {
		phoneNo.setCustomValidity('');
	}
};
	</script>
</body>
</html>


