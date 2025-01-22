<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="test.vault.dashboard.entities.Test"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Dashboard</title>
<link href="../css/user_dashboard.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/popup.css">
</head>
<body>

	<!-- Modal Structure -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<p id="modalMessage"></p>
			<div class="modal-footer">
				<button id="okButton">OK</button>
			</div>
		</div>
	</div>

	<!-- Embed the popup message in a hidden element -->
	<div id="popupMessageContainer" style="display: none;"
		data-message="${popupMessage}"></div>
	<!-- Header Section -->
	<!-- Navbar -->
	<header class="navbar">
		<div class="logo">
			<h1> <img src="../images/logo.jpg" alt="Company Logo" width="50px" height="50px"> Test Vault</h1>
			
		</div>
		<div class="navbar-right">



			<button onclick="showList()">Profile</button>

			<button class="logout-btn">
				<a href="/logout">Logout</a>
			</button>


			<ul id="infoList">
				<li>User Name:<%=(String) request.getAttribute("userName")%></li>
				<li>Email:<%=(String) request.getAttribute("email")%></li>
				<li>Phone No:<%=(String) request.getAttribute("phoneNo")%></li>
				<li>Test Given:<%=(Integer) request.getAttribute("totalTest")%></li>
			</ul>
		</div>
	</header>
	<!-- Main Container -->
	<div class="main-container">
		<!-- Left Navigation -->
		<nav>

			<ul>
				<li id="upcoming-test">Upcoming Test</li>
				<li id="completed-test">Completed Test</li>
				<li id="practice-test">Practice Test</li>
				<div class="practice-test-container">
					<form id="practiceCodingTest" action="questionPractice"
						method="get" style="display: inline;">
						<input type="hidden" name="idPracticeTest" value="2">
						<button class="practiceTestBtn option-button coding-btn"
							type="submit">Coding Test</button>
					</form>
					<form id="practiceMcqTest" action="questionPractice" method="get"
						style="display: inline;">
						<input type="hidden" name="idPracticeTest" value="1">
						<button class="practiceTestBtn option-button mcq-btn"
							type="submit">MCQ Test</button>
					</form>
				</div>
			</ul>
		</nav>

		<!-- Main Content -->
		<div class="main-content">
			<!-- Running Tests Section -->
			<div class="test-section running-tests">
				<h3>Running Tests</h3>
				<div class="test-cards">
					<!-- Scriplet tag show dynamic content of running test -->
					<%
					List<Test> allRunningTest = (List<Test>) request.getAttribute("runningTest");
					for (Test test : allRunningTest) {
					%>
					<div class="test-card running">

						<h5>
							Catalog_Name:<%=test.getCatalog_Name()%>
						</h5>
						<h5>
							Test Name:<%=test.getName()%>
						</h5>
						<h5>
							Number of Questions:<%=test.getNumber_of_Questions()%>
						</h5>
						<h5>
							Level:<%=test.getLevel()%>
						</h5>
						<h5>
							Type:<%=test.getType()%>
						</h5>
						<h5>
							Test Start time:<%=test.getStart_time()%>
						</h5>
						<h5>
							Test End Time:<%=test.getEnd_time()%></h5>
						<!-- Added status -->
						<button class="register-btn"
							onclick="location.href='http://localhost:9192/registerService/<%=test.getTest_id()%>'">Register
							for Test</button>

						<!-- Added view result button -->
					</div>

					<%
					}
					%>
				</div>

			</div>

			<!-- Closed Tests Section -->
			<div class="test-section closed-tests">
				<h3>Closed Tests</h3>
				<div class="test-cards">
					<!-- Scriplet tag show dynamic content of closed test -->
					<%
					List<Test> allClosedTest = (List<Test>) request.getAttribute("closeTest");
					for (Test test : allClosedTest) {
					%>
					<div class="test-card closed">
						<h5>
							Catalog_Name:<%=test.getCatalog_Name()%>
						</h5>
						<h5>
							Test Name:<%=test.getName()%>
						</h5>
						<h5>
							Number of Questions:<%=test.getNumber_of_Questions()%>
						</h5>
						<h5>
							Level:<%=test.getLevel()%>
						</h5>
						<h5>
							Type:<%=test.getType()%>
						</h5>
						<h5>
							Test Start time:<%=test.getStart_time()%>
						</h5>
						<h5>
							Test End Time:<%=test.getEnd_time()%></h5>
						<!-- Added status -->
						<button class="register-btn"
							onclick="location.href='/user/registerService/<%=test.getTest_id()%>'">View
							Test</button>
						<!-- Added view result button -->
					</div>
					<%
					}
					%>

				</div>
			</div>
		</div>
	</div>

	<div id="logoutModal" class="modal">
		<div class="modal-content">
			<h4>Confirm Logout</h4>
			<p>Are you sure you want to logout?</p>
			<div class="modal-footer">
				<button id="cancelButton" class="modal-btn">Cancel</button>
				<button id="confirmButton" class="modal-btn">Logout</button>
			</div>
		</div>
	</div>
	<footer
		style="background-color: #6a0dad; color: white; text-align: center; padding: 10px; position: fixed; bottom: 0; width: 100%;">&copy;
		2024 Skill Test Admin Dashboard </footer>
	<script src="/js/user_dashboard.js">
		
	</script>
	<script src="/js/popup1.js"></script>
	<script>
		
		function showList() {
			var list = document.getElementById("infoList");
			if (list.style.display === "none") {
				list.style.display = "block";
			} else {
				list.style.display = "none";
			}
		}

		document.addEventListener('DOMContentLoaded', function() {
			const logoutButton = document.querySelector('.logout-btn');
			const logoutModal = document.getElementById('logoutModal');
			const confirmButton = document.getElementById('confirmButton');
			const cancelButton = document.getElementById('cancelButton');

			logoutButton.addEventListener('click', function(event) {
				event.preventDefault();
				logoutModal.style.display = 'block';
			});

			confirmButton.addEventListener('click', function() {
				window.location.href = logoutButton.querySelector('a').href;
			});

			cancelButton.addEventListener('click', function() {
				logoutModal.style.display = 'none';
			});

			// Close the modal when clicking outside of it
			window.addEventListener('click', function(event) {
				if (event.target == logoutModal) {
					logoutModal.style.display = 'none';
				}
			});
		});
	</script>
</body>
</html>