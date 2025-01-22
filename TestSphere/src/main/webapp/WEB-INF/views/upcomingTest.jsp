<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.time.LocalDateTime, java.time.format.DateTimeFormatter,java.time.LocalDate"%>
<%@page import="test.vault.dashboard.entities.Test"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Report</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background: #4B0082; /* Dark blue gradient */
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	text-align: center;
}

.container {
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 80%;
	max-width: 1200px;
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

h1 {
	margin: 20px;
	color: mediumslateblue;; /* Pink */
	font-weight: bold;
	font-size: 24px;
}

table {
	margin: auto;
	border-collapse: collapse;
	width: 95%;
	color: white;
}

th {
	background: #8A2BE2; /* Dark blue to pink gradient */
	color: white;
	padding: 10px;
	text-align: center;
	font-weight: bold;
}

td {
	background: #1e1e40; /* Dark blue */
	padding: 15px;
	text-align: center;
	border: 1px solid #8A2BE2; /* Border for distinction */
}

tr {
	margin-bottom: 10px; /* Margin between rows */
}

tr:nth-child(even) td {
	background: #14213d; /* Slightly lighter blue for alternating rows */
}

tr:hover td {
	background: #D8BFD8; /* Pink */
	color: #4B0082; /* Dark blue text on hover */
}

.round-indicator {
	display: inline-block;
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	border-radius: 50%;
	background: #D8BFD8; /* Pink */
	color: white;
	font-weight: bold;
	margin: auto;
}

/* Modal styles */
.modal {
	display: none; /* Hidden by default */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px;
	border-radius: 10px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.modal-button {
	background-color: #8A2BE2; /* Dark blue */
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 10px;
}

.modal-button:hover {
	background-color: #D8BFD8; /* Pink */
}
</style>
<script>
function showModal(testId, userId) {
    var modal = document.getElementById("myModal");
    var startTestButton = document.getElementById("startTestButton");
    startTestButton.onclick = function() {
        window.location.href = "/startTest/" + testId + "/" + userId;
    };
    modal.style.display = "block";
}
 
function closeModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}
 
// Close the modal when the user clicks anywhere outside of the modal
window.onclick = function(event) {
    var modal = document.getElementById("myModal");
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</head>
<body>
	<!-- Scripting Tag -->
	<%
	List<Test> upcomingTest = (List<Test>) request.getAttribute("upcomingTest");
	HashSet<Integer> alreadyGivenTest = (HashSet<Integer>) request.getAttribute("testGivenByUser");
	%>
	<div class="container">
		<h1>Upcoming test</h1>

		<!-- Expression Tag -->
		<table>
			<thead>
				<tr>
					<th>S.No</th>
					<th>Catalog Name</th>
					<th>Test Name</th>
					<th>Type</th>
					<th>Level</th>
					<th>StartDate</th>
					<th>EndDate</th>
					<th>Test Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (upcomingTest != null) {
					int sno = 1;
					for (Test test : upcomingTest) {
						// Example start and end time strings from your test object
						String startDateString = test.getStart_time(); // e.g., "2024-12-10 10:00:00"
						String endDateString = test.getEnd_time(); // e.g., "2024-12-10 12:00:00"

						LocalDate startDate = LocalDate.parse(startDateString);
						LocalDate endDate = LocalDate.parse(endDateString);

						LocalDateTime currentDateTime = LocalDateTime.now();
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
						String formattedCurrentDate = currentDateTime.format(formatter);
						LocalDate currentDate = LocalDate.parse(formattedCurrentDate);

						boolean hasStarted = (currentDate.isEqual(startDate) || currentDate.isAfter(startDate))
						&& (currentDate.isEqual(endDate) || currentDate.isBefore(endDate));

						if (endDate.isBefore(currentDate)) {
					continue;
						}
				%>
				<tr>
					<td><%=sno++%></td>
					<td><%=test.getCatalog_Name()%></td>
					<td><%=test.getName()%></td>
					<td><%=test.getType()%></td>
					<td><%=test.getLevel()%></td>
					<td><%=test.getStart_time()%></td>
					<td><%=test.getEnd_time()%></td>
					<td>
						<%
						if (alreadyGivenTest.contains(test.getTest_id())) {
						%> <span
						style="color: gray; pointer-events: none; text-decoration: none;">Already
							given</span> <%
 } else if (!hasStarted) {
 %> <span
						style="color: gray; pointer-events: none; text-decoration: none;">Test
							Not Started</span> <%
 } else {
 %>
						<button class="modal-button"
							onclick="showModal(<%=test.getTest_id()%>, <%=(Integer) request.getSession(false).getAttribute("userID")%>)">Start
							Test</button> <%
 }
 %>
					</td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
		<a href="/user/dashboard" class="btn-back">Back to User Dashboard</a>
	</div>

	<!-- The Modal -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h2>Test Instructions</h2>
			<p>Please read the following instructions carefully before
				starting the test:</p>
			<ul>
				<li>Make sure you have a stable internet connection.</li>
				<li>Do not switch tabs or leave the test page, as it will
					submit your test automatically.</li>
				<li>Ensure you have enough time to complete the test in one
					sitting.</li>
				<li>Click on the "Start Test" button below to begin the test.</li>
			</ul>
			<button id="startTestButton" class="modal-button">Start Test</button>
		</div>
	</div>
</body>
</html>

