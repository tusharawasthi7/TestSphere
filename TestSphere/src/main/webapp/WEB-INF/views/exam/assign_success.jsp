<!DOCTYPE html>
<html>
<head>
<title>Assignment Success</title>
<link href="../css/login.css" rel="stylesheet" type="text/css" />
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f0f2f5;
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	color: #333;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
	background-color: white;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h1 {
	margin-bottom: 20px;
	color: #4CAF50;
}

.btn {
	background-color: #007bff;
	color: white;
	padding: 8px 16px;
	text-decoration: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.3s ease, transform 0.3s ease;
}

.btn:hover {
	background-color: #0056b3;
	transform: translateY(-2px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
	<div class="container">
		<h1>Catalog Created Successfully</h1>
		<a href="/exam/assign_exam" class="btn">Create Another Catalog</a>
	</div>
</body>
</html>
