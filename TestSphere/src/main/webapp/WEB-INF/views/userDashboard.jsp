<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Dashboard - Exam Portal</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f6f9;
	display: flex;
	min-height: 100vh;
	margin: 0;
	flex-direction: column;
}

.sidebar {
	width: 250px;
	background-color: #2c3e50;
	color: white;
	padding: 20px;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	display: flex;
	flex-direction: column;
}

.sidebar h2 {
	margin-bottom: 20px;
}

.sidebar ul {
	list-style-type: none;
	padding: 0;
}

.sidebar ul li {
	margin: 15px 0;
}

.sidebar ul li a {
	color: white;
	text-decoration: none;
	font-size: 18px;
}

.sidebar ul li a:hover {
	text-decoration: underline;
}

.main-content {
	margin-left: 250px;
	padding: 20px;
	flex: 1;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #3498db;
	color: white;
	padding: 10px 20px;
	border-radius: 8px;
	margin-bottom: 20px;
	position: relative;
}

.header .username {
	font-size: 20px;
	cursor: pointer;
	position: relative;
}

.dropdown-content {
	display: none;
	position: absolute;
	top: 100%;
	right: 10px;
	background-color: white;
	min-width: 200px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	z-index: 1;
	border-radius: 8px;
}

.dropdown-content p {
	padding: 12px;
	margin: 0;
	color: black;
}

.dropdown-content p:hover {
	background-color: #f1f1f1;
}

.container {
	max-width: 800px;
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.container h2 {
	text-align: center;
	margin-bottom: 20px;
}

.tests {
	margin-top: 20px;
}

.test-card {
	background-color: #ecf0f1;
	padding: 15px;
	border-radius: 8px;
	margin-bottom: 15px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.test-card.completed {
	border-left: 4px solid #2ecc71;
}

.test-card.upcoming {
	border-left: 4px solid #e74c3c;
}

.btn {
	padding: 10px 20px;
	background-color: #3498db;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.btn:hover {
	background-color: #2980b9;
}

.footer {
	text-align: center;
	padding: 10px;
	background-color: #2c3e50;
	color: white;
	margin-top: auto;
}

@media ( max-width : 768px) {
	.sidebar {
		position: relative;
		width: 100%;
		height: auto;
	}
	.main-content {
		margin-left: 0;
	}
}
</style>
<script>
	function toggleDropdown() {
		var dropdown = document.getElementById("dropdown-content");
		if (dropdown.style.display === "none" || dropdown.style.display === "") {
			dropdown.style.display = "block";
		} else {
			dropdown.style.display = "none";
		}
	}

	window.onclick = function(event) {
		if (!event.target.matches('.username')) {
			var dropdowns = document.getElementsByClassName("dropdown-content");
			for (var i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.style.display === "block") {
					openDropdown.style.display = "none";
				}
			}
		}
	}
</script>
</head>
<body>
	<div class="sidebar">
		<h2>User Menu</h2>
		<ul>
			<li><a href="#">Home</a></li>
			<li><a href="#">Completed Tests</a></li>
			<li><a href="#">Upcoming Tests</a></li>
			<li><a href="#">Update Profile</a></li>
		</ul>
	</div>
	<div class="main-content">
		<div class="header">
			<div class="logo">Exam Portal</div>
			<div class="username" onclick="toggleDropdown()">Welcome,
				${user.username}</div>
			<div id="dropdown-content" class="dropdown-content">
				<p>
					<strong>Username:</strong> ${user.username}
				</p>
				<p>
					<strong>Email:</strong> ${user.email}
				</p>
				<p>
					<strong>Phone:</strong> ${user.phone}
				</p>
			</div>
		</div>
		<div class="container">
			<h2>Completed Tests</h2>
			<div class="test-card completed">
				<div>
					<h3>Java Programming</h3>
					<p>Score: 85%</p>
				</div>
				<a href="/certificate?test=java" class="btn">Download
					Certificate</a>
			</div>
			<div class="test-card completed">
				<div>
					<h3>Python Basics</h3>
					<p>Score: 90%</p>
				</div>
				<a href="/certificate?test=python" class="btn">Download
					Certificate</a>
			</div>

			<h2>Upcoming Tests</h2>
			<div class="test-card upcoming">
				<div>
					<h3>Web Development</h3>
					<p>Date: 2024-12-01</p>
				</div>
				<a href="/start-test?test=web-development" class="btn">Start
					Test</a>
			</div>
			<div class="test-card upcoming">
				<div>
					<h3>Data Structures</h3>
					<p>Date: 2024-12-15</p>
				</div>
				<a href="/start-test?test=data-structures" class="btn">Start
					Test</a>
			</div>
		</div>
	</div>
	<footer
		style="background-color: #6a0dad; color: white; text-align: center; padding: 10px; position: fixed; bottom: 0; width: 100%;">&copy;
		2024 Skill Test Admin Dashboard </footer>
</body>
</html>
