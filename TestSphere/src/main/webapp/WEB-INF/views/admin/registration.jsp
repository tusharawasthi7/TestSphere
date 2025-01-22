<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Registration</title>
<link href="../css/style.css" rel="stylesheet" />
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
		<h2>Admin Registration</h2>
		<c:if test="${not empty errorMessage}">
			<div class="error">${errorMessage}</div>
		</c:if>
		<form action="/admin/registration" method="post">
			<div class="form-group">
				<label for="fullName">Full Name:</label> <input type="text"
					id="fullName" name="fullName" max="60" value="${admin.fullName}"
					required>
			</div>
			<div class="form-group">
				<label for="mobile">Mobile No:</label> <input type="tel" id="mobile"
					name="mobile" value="${admin.mobile}" pattern="^[6-9]\d{9}$"
					required
					title="Enter a valid 10-digit mobile number starting with 6, 7, 8, or 9" style="width:700px;height:32px">
			</div>
			<div class="form-group">
				<label for="email">Email ID:</label> <input type="email" id="email"
					name="email" value="${admin.email}" required>
			</div>
			<div class="form-group">
				<label for="username">Username:</label> <input type="text"
					id="username" name="username" max="40" value="${admin.username}"
					required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" max="25" required>
				<ul class="checklist" id="passwordChecklist">
					<li id="length">At least 6 characters</li>
					<li id="special">At least one special character</li>
					<li id="number">At least one number</li>
				</ul>
			</div>
			<div class="form-group">
				<label for="role">Role:</label>  <input
					type="radio" id="role2" name="role.roleId" value="2" required>Sub
				Admin
			</div>
			<div
			class="message <%=request.getAttribute("status") != null ? request.getAttribute("status") : ""%>">
			<%=request.getAttribute("message") != null ? request.getAttribute("message") : ""%>
		</div>
			<button type="submit" class="btn">Register</button>
		</form>
		
		<p>
			Already registered? <a href="/admin/openLoginPage">Login here</a>
		</p>
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
	</script>
</body>
</html>