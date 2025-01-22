<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Super Admin Dashboard</title>
<link rel="stylesheet" type="text/css" href="../css/popup.css">
<style>
/* General styles */
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: linear-gradient(to bottom right, #8A2BE2, #FF69B4);
	/* Purple to pink gradient */
	color: #fff;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
}

/* Dashboard container */
.dashboard-container {
	background-color: rgba(0, 0, 0, 0.7); /* Black with opacity */
	border-radius: 12px;
	padding: 30px;
	width: 80%;
	max-width: 600px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
	text-align: center;
}

/* Welcome title */
.dashboard-container h1 {
	font-size: 2.5em;
	margin-bottom: 10px;
}

/* Subheading */
.dashboard-container p {
	font-size: 1.2em;
	margin-bottom: 20px;
}

/* Navigation buttons */
.dashboard-container .button-container {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.dashboard-container a {
	text-decoration: none;
	background: #6a0dad; /* Pink button */
	color: white;
	padding: 10px 20px;
	border-radius: 8px;
	font-size: 1em;
	font-weight: bold;
	transition: background 0.3s ease;
}

.dashboard-container a:hover {
	background: #ff85c3; /* Lighter pink on hover */
}
</style>
</head>
<body>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<p id="modalMessage"></p>
			<div class="modal-footer">
				<button id="okButton">OK</button>
			</div>
		</div>
	</div>
	<div id="popupMessageContainer" style="display: none;"
		data-message="${popupMessage}"></div>
	<div class="dashboard-container">
		<h1>Welcome, Administrator</h1>
		<p>Manage your platform seamlessly with the options below.</p>
		<div class="button-container">
			<a href="/superadmin/openViewSubAdminsPage">View Sub Admins</a> <a
				href="/exam/assign_exam">Create an Catalog</a>
		</div>

	</div>
	<script src="/js/popup1.js"></script>
</body>
</html>