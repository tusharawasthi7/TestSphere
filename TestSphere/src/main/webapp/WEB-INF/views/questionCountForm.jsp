
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="test.vault.test_management.entities.Catalog"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Test Details</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background: #4B0082;
	background-size: cover;
	margin: 0;
	padding: 0;
}

.container {
	background: rgba(255, 255, 255, 0.9);
	padding: 20px 40px;
	border-radius: 8px;
	width: 50%;
	margin: 50px auto;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
}

h1 {
	text-align: center;
	color: #333;
	margin-bottom: 30px;
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
}

input[type="number"], input[type="date"], textarea, select {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

button {
	background-color: #8A2BE2;
	color: white;
	padding: 15px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	width: 100%;
}

button:hover {
	background-color: #D8BFD8;
}

.error {
	color: red;
	margin-bottom: 20px;
	display: none;
}
</style>
<script>
    function validateForm() {
        const startDate = document.getElementById('startDate').value;
        const endDate = document.getElementById('endDate').value;
        const currentDate = new Date().toISOString().split('T')[0];
        const error = document.getElementById('error-message');

        if (new Date(endDate) < new Date(startDate)) {
            error.style.display = 'block';
            error.textContent = 'End date cannot be earlier than the start date.';
            return false;
        }
        
         if(new Date(currentDate)> new Date(startDate) ){
        	error.style.display = 'block';
        	error.textContent = 'Start date cannot be earlier than the Current date.';
        	return false;
        }
        
        error.style.display = 'none';
        return true;
    }

    function filterOptions(selectElement) {
        const selectedOption = selectElement.options[selectElement.selectedIndex];
        const isMcq = selectedOption.getAttribute('data-is-mcq') === 'true';
        const isCoding = selectedOption.getAttribute('data-is-coding') === 'true';

        const typeSelect = document.getElementById('type');
        typeSelect.innerHTML = ''; // Clear previous options

        if (isMcq) {
            const option = document.createElement('option');
            option.value = 'mcq';
            option.text = 'MCQ';
            typeSelect.appendChild(option);
        }

        if (isCoding) {
            const option = document.createElement('option');
            option.value = 'coding';
            option.text = 'Coding';
            typeSelect.appendChild(option);
        }

        // If no options available, show a message or disable the dropdown
        if (!isMcq && !isCoding) {
            const option = document.createElement('option');
            option.text = 'No options available';
            option.disabled = true;
            typeSelect.appendChild(option);
            typeSelect.disabled = true;
        } else {
            typeSelect.disabled = false;
        }

        // Update form action based on selected type
        updateFormAction();
    }

    function updateFormAction() {
        const typeSelect = document.getElementById('type');
        const selectedType = typeSelect.value;
        const form = document.getElementById('questionForm');

        if (selectedType === 'mcq') {
            form.action = '/setQuestion';
        } else if (selectedType === 'coding') {
            form.action = '/setCoddingQuestionCount';
        }
    }

    document.addEventListener('DOMContentLoaded', () => {
        const typeSelect = document.getElementById('type');
        typeSelect.addEventListener('change', updateFormAction);
    });
</script>
</head>
<body>
	<div class="container">
		<h1>Create a Test</h1>
		<form id="questionForm" method="post" onsubmit="return validateForm()">
			<label for="questionCount">Enter the number of questions:</label> <input
				type="number" id="questionCount" name="questionCount" min="1" max="50"
				required> <label for="startDate">Start Date:</label> <input
				type="date" id="startDate" name="startDate" required> <label
				for="endDate">End Date:</label> <input type="date" id="endDate"
				name="endDate" required> <label for="description">Test
				Name:</label>
			<input type="text" id="description" name="description" min="1" max="100" style="width:104vh;height:5vh;margin-bottom:5px" 
				required></input>

			<label for="level">Level:</label> <select id="level" name="level"
				required>
				<option value="beginner">Beginner</option>
				<option value="intermediate">Intermediate</option>
				<option value="expert">Expert</option>
			</select> <label for="catalog">Select Catalog:</label> <select id="catalog"
				name="catalogId" required onchange="filterOptions(this)">
				<%
				List<Catalog> catalogs = (List<Catalog>) request.getAttribute("catalogs");
				if (catalogs != null) {
					for (Catalog catalog : catalogs) {
				%>
				<option value="<%=catalog.getCataLogId()%>"
					data-is-mcq="<%=catalog.isMcq()%>"
					data-is-coding="<%=catalog.isCoding()%>"><%=catalog.getCatalogNames()%></option>
				<%
				}
				}
				%>
			</select> <label for="type">Select Type:</label> <select id="type" name="type"
				required></select> <label for="time">Enter total time for
				test in minutes:</label> <input type="number" id="time" name="time" min="1"
				max="600" required>

			<div id="error-message" class="error"></div>
			<button type="submit">Start</button>
		</form>
	</div>
</body>
</html>
