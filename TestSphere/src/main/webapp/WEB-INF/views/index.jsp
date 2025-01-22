<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="test.vault.dashboard.entities.Test"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<link href="../css/user_dashboard.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/popup.css">
<style>
.view_btn {
	padding: 10px 15px;
	background-color: #6a0dad;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.view_btn:hover {
	background-color: #530a9e;
}
</style>
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
			<img src="../images/logo.jpg" alt="Company Logo" width="50px"
				height="50px"> Test Vault
		</div>
		<div class="navbar-right">
			<button onclick="showList()"
				style="font-weight: bold; font-size: 3vh">Admin</button>
			<button class="logout-btn">



				<a href="http://localhost:9192/adminlogout">Logout</a>
			</button>

			<ul id="infoList">
				<li>User Name:<%=(String) request.getAttribute("adminName")%></li>
				<li>Email:<%=(String) request.getAttribute("email")%></li>
				<li>Phone No:<%=(String) request.getAttribute("phoneNo")%></li>
				<li>Test Created:<%=(Integer) request.getAttribute("totalTest")%></li>
			</ul>
		</div>
	</header>
	<!-- Main Container -->
	<div class="main-container">
		<!-- Left Navigation -->
		<nav id="nav-bar-container">

			<ul>
				<li id="create-test">Create a Test</li>
				<li id="update-test" value="<%=request.getAttribute("adminID")%>">Update
					a Test</li>
				<li id="view-report">View All Test</li>
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
					List<Test> allRunningTestByAdminID = (List<Test>) request.getAttribute("allRunningTestByAdminID");
					for (Test test : allRunningTestByAdminID) {
					%>
					<div class="test-card running">
						<h5>
							Catalog Name:<%=test.getCatalog_Name()%>
						</h5>
						<h5>
							Test Name:<%=test.getName()%>
						</h5>
						<h5>
							Number of Questions:<%=test.getNumber_of_Questions()%>
						</h5>
						<h5>
							Test Start time:<%=test.getStart_time()%>
						</h5>
						<h5>
							Test End Time:<%=test.getEnd_time()%></h5>
						<h5>
							Test Level:<%=test.getLevel()%></h5>
						<h5>
							Test Type:<%=test.getType()%></h5>
						<!-- Added status -->
						<!-- Added edit test button -->
						<button class="view_btn"
							onclick="location.href='http://localhost:9192/viewReport/<%=test.getTest_id()%>'">View
							Report</button>
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
					List<Test> allCloseTestByAdminID = (List<Test>) request.getAttribute("allCloseTestByAdminID");
					for (Test test : allCloseTestByAdminID) {
					%>
					<div class="test-card closed">
						<h5>
							Catalog Name:<%=test.getCatalog_Name()%>
						</h5>
						<h5>
							Test Name:<%=test.getName()%>
						</h5>
						<h5>
							Number of Questions:<%=test.getNumber_of_Questions()%>
						</h5>
						<h5>
							Test Start time:<%=test.getStart_time()%>
						</h5>
						<h5>
							Test End Time:<%=test.getEnd_time()%></h5>
						<h5>
							Test Level:<%=test.getLevel()%></h5>
						<h5>
							Test Type:<%=test.getType()%></h5>
						<!-- Added status -->


						<!-- Added edit test button -->
						<button class="view_btn"
							onclick="location.href='http://localhost:9192/viewReport/<%=test.getTest_id()%>'">View
							Report</button>
						<!-- Added view result button -->
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<footer
		style="background-color: #6a0dad; color: white; text-align: center; padding: 10px; position: fixed; bottom: 0; width: 100%;">&copy;
		2024 Skill Test Admin Dashboard </footer>

	<!-- Modal Structure -->
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

	<script src="/js/admin_dashboard.js"></script>
	<script src="/js/popup1.js"></script>
	<script>
		document
				.addEventListener(
						'scroll',
						function() {
							const footer = document.querySelector('footer');
							if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
								footer.style.display = 'block';
							} else {
								footer.style.display = 'none';
							}
						});
		document.getElementById("update-test").onclick = function() {
			const adminID =
	<%=request.getAttribute("adminID")%>
		;
			window.location.href = "http://localhost:9192/updateTest?adminID="
					+ adminID;
		};
		function showList() {
			var list = document.getElementById("infoList");
			if (list.style.display === "none") {
				list.style.display = "block";
			} else {
				list.style.display = "none";
			}
		}
	</script>
</body>
</html>