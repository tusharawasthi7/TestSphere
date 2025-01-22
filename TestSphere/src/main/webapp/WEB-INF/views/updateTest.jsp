
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="test.vault.test_management.entities.Test"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Test List</title>
<link href="css/updateTest.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/popup.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #4B0082;
	color: #333;
	padding: 20px;
}

.container {
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 80%;
	margin-left: 15vh;
	max-width: 1200px;
	height: auto; /* Ensures the height adjusts to content */
	margin-top: 20px; /* Ensure container has margin at the top */
}

table {
	width: 95%;
	margin: 0 auto;
	margin-top: -5px;
	border-collapse: collapse;
	height: fit-content;
}

tr {
	color: white;
	margin-bottom: 10px; /* Margin between rows */
}

tr:nth-child(even) td {
	background: #14213d; /* Slightly lighter blue for alternating rows */
}

tr:hover td {
	background: #8d99ae; /* Pink */
	color: #4B0082; /* Dark blue text on hover */
}

th, td {
	background: #1e1e40;
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background: #8A2BE2;
}

th {
	color: white;
}

.edit-button, .add-question-button {
	background-color: #8A2BE2;
	color: white;
	padding: 5px 10px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.edit-button:hover, .add-question-button:hover {
	background-color: #D8BFD8;
}

.status-button {
	color: white;
	padding: 5px 10px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.btn-back {
	display: inline-block;
	padding: 10px 15px;
	background-color: #8A2BE2;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 20px;
	margin-left: 360px;
}

.btn-back:hover {
	background-color: #D8BFD8;
}

.live-button {
	background-color: #4CAF50;
}

.closed-button {
	background-color: red;
}
</style>
<script>
function toggleStatus(button, testId) {
    let currentStatus = button.innerText;
    let newStatus = (currentStatus === 'Live') ? 'Closed' : 'Live';
    button.innerText = newStatus;
    if (newStatus === 'Live') {
        button.className = 'status-button live-button';
    } else {
        button.className = 'status-button closed-button';
    }

    let xhr = new XMLHttpRequest();
    xhr.open("POST", "/updateTestStatus", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("testId=" + testId + "&status=" + newStatus);

    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                console.log(xhr.responseText);
            } else {
                console.log("Error updating status: " + xhr.status);
            }
        }
    };
}

document.querySelectorAll(".edit-button").forEach(button => {
    button.addEventListener("click", function() { 
        window.location.href = `http://localhost:9090/receiveUpdate`; 
    }); 
});
</script>
<script src="/js/popup1.js"></script>
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
	<div class="container">

		<%
		List<Test> test = (List<Test>) request.getAttribute("listOfTests");
		if (test != null) {
		%>

		<table>
			<h2 style="margin-left: 450px; color: black">Test List</h2>
			<tr>
				<th>SNo</th>
				<th>Test Name</th>
				<th>Number of Questions</th>
				<th>Test ID</th>
				<th>Status</th>
				<th>Modify</th>
				<th>Action</th>

			</tr>

			<%
			int sno = 1;
			for (Test testDTO : test) {
				String statusText = "Closed";
				String buttonClass = "closed-button";
				if ("1".equals(testDTO.getStatus())) {
					statusText = "Live";
					buttonClass = "live-button";
				}
			%>
			<tr>
				<td><%=sno++%></td>
				<td><%=testDTO.getName()%></td>
				<td><%=testDTO.getNoOfQuestion()%></td>
				<td><%=testDTO.getTestId()%></td>
				<td>
					<button type="button" class="status-button <%=buttonClass%>"
						onclick="toggleStatus(this, <%=testDTO.getTestId()%>)">
						<%=statusText%>
					</button>
				</td>
				<td>
					<form action="addExtraQuestion" method="get"
						style="display: inline;">
						<input type="hidden" name="testId"
							value="<%=testDTO.getTestId()%>" />
						<button type="submit" class="add-question-button">AddQuestion</button>
					</form>
				</td>
				<td>
					<form action="receiveUpdate" method="get">
						<input type="hidden" name="catalogId"
							value="<%=testDTO.getType()%>" /> <input type="hidden"
							name="listOfIdsQuestions"
							value="<%=testDTO.getListOfIdsOfQuestion()%>" /> <input
							type="hidden" name="testId" value="<%=testDTO.getTestId()%>" />
						<button type="submit" class="edit-button">Edit</button>
					</form>
				</td>

			</tr>
			<%
			}
			%>
		</table>
		<%
		} else {
		out.println("<p>No tests found.</p>");
		}
		%>
		<a href="/admin/dashboard" class="btn-back">Back to Admin
			Dashboard</a>
	</div>

</body>
</html>
