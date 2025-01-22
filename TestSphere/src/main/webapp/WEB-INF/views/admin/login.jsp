<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<link href="../css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="container">
		<div class="login-box">
			<!-- Left Section -->
			<div class="login-form">
				<h2>Admin Login</h2>
				<form action="/admin/login" method="post">
					<div class="from-group">
						<label for="username">Username:</label> <input type="text"
							id="username" name="username" placeholder="Enter your username"
							required>
					</div>
					<div class="from-group">
						<label for="password">Password:</label> <input type="password"
							id="password" name="password" placeholder="Enter your password"
							required>
					</div>
					<button type="submit">Login</button>
				</form>
			</div>
			<!-- Right Section -->
			<div class="welcome-section">
				<h2>Welcome Back!</h2>
				<p>To keep connected with us, please login with your
					credentials!.</p>
				<p>
					Not registered? <a href="/admin/openRegistrationPage">Register
						here</a>
				</p>
				<p><a href="http://localhost:9192/user/login">LogIn as user</a></p>
				<%@ include file="../message.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>