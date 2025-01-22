<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Question</title>
<link href="css/editCodingQuestion.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">
		<h1>Edit Question</h1>

		<form action="editCodingQuestion" method="post"
			enctype="multipart/form-data">
			<input type="hidden" id="idOfQuestion" name="idOfQuestion"
				value="<%=request.getAttribute("IdOfQuestion")%>" />

			<h4>Current Question</h4>
			<c:if test="${not empty image}">
				<img src="data:image/jpeg;base64,${image}"
					alt="Current Question Image" style="width: 100%; height: 150px">
			</c:if>

			<label for="image" style="margin-top: 5px">Upload New
				Question:</label> <input type="file" id="image" name="image" required>

			<label for="options">Options:</label>
			<div id="optionsContainer">
				<%
				List<String> options = (List<String>) request.getAttribute("Options");
				List<String> correctOptions = (List<String>) request.getAttribute("CorrectOption");
				%>
			</div>
			<div id="MoreOptionsContainer"></div>
			<div id="correctOptionsContainer"></div>
			<button type="button" id="addOption">Add Option</button>

			<button type="submit">Submit Question</button>
		</form>
	</div>
	<script>
        const options = <%=options%>;
        const optionsContainer = document.getElementById('optionsContainer');
        const correctOptionsContainer = document.getElementById('correctOptionsContainer');
        const moreOptionsContainer = document.getElementById('MoreOptionsContainer');
        const addOption = document.getElementById('addOption');
        const questionForm = document.querySelector('form');
        console.log(options);
        let count = options.length;

        let cleanedString = [];

        for (let i = 0; i < options.length; i++) {
            if (options[i] !== '[' && options[i] !== ']' && options[i] !== "'") {
                cleanedString.push(options[i]);
            }
        }

        cleanedString.forEach((option, index) => {
            const optionDiv = document.createElement('div');
            optionDiv.className = 'option-item';

            const input = document.createElement('input');
            input.type = 'text';
            input.name = 'option';
            input.placeholder = `Option ${index + 1}`;
            input.value = option;
            input.className = 'option-input';

            optionDiv.appendChild(input);
            optionsContainer.appendChild(optionDiv);

            const checkboxLabel = document.createElement('label');
            checkboxLabel.innerText = 'Correct';

            const checkbox = document.createElement('input');
            checkbox.type = 'checkbox';
            checkbox.name = 'correct';
            checkbox.value = index + 1;

            correctOptionsContainer.appendChild(checkboxLabel);
            correctOptionsContainer.appendChild(checkbox);
        });

        addOption.addEventListener('click', function() {
            if (count < 6) {
                count += 1;
                const optionDiv = document.createElement('div');
                optionDiv.className = 'option-item';

                const input = document.createElement('input');
                input.type = 'text';
                input.name = 'option';
                input.placeholder = `Option ${count}`;
                input.className = 'option-input';

                const checkboxLabel = document.createElement('label');
                checkboxLabel.innerText = 'Correct';

                const checkbox = document.createElement('input');
                checkbox.type = 'checkbox';
                checkbox.name = 'correct';
                checkbox.value = count;

                optionDiv.appendChild(input);
                moreOptionsContainer.appendChild(optionDiv);
                correctOptionsContainer.appendChild(checkboxLabel);
                correctOptionsContainer.appendChild(checkbox);
            } else {
                alert("You can add only 6 options");
            }
        });
        questionForm.addEventListener('submit', (event) => { const correctCheckboxes = document.querySelectorAll('input[name="correct"]:checked'); if (correctCheckboxes.length === 0) { 
        	alert("Please select at least one correct option."); 
        	event.preventDefault(); // Prevent form submission 
        	} 
        });
        
       
    </script>

</body>
</html>
