<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mcq Question</title>
<link href="css/editMcqQuestion.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<h1>Edit Question</h1>
	<div id="container">
		<%
		List<String> options = (List<String>) request.getAttribute("Options");
		List<String> correctOptions = (List<String>) request.getAttribute("CorrectOption");
		String title = (String) request.getAttribute("title");
		%>
	</div>
	<script>
  
       const options = <%=options.toString()%>;
       const questionTitle = "<%=title%>";
       let cleanedString = [];

       for (let i = 0; i < options.length; i++) {
           if (options[i] !== '[' && options[i] !== ']' && options[i] !== ",") {
               cleanedString.push(options[i]);
           }
       }

       const container = document.getElementById('container');
       const form = document.createElement('form');
       form.id = 'questionForm';
       form.action = '/editMcqQuestion';
       form.method = 'post';

       const questionHeading = document.createElement('h2');
       questionHeading.id = 'questionHeading';
       questionHeading.innerHTML = "Question Title";
       container.appendChild(questionHeading);

       const hiddenInput = document.createElement('input');
       hiddenInput.type = 'hidden';
       hiddenInput.id = 'idOfQuestion';
       hiddenInput.name = 'idOfQuestion';
       hiddenInput.value = '<%=request.getAttribute("IdOfQuestion")%>';
       form.appendChild(hiddenInput);
       container.appendChild(form);

       const titleDiv = document.createElement('div');
       const inputTitle = document.createElement('input');
       inputTitle.type = 'text';
       inputTitle.name = 'title';
       inputTitle.placeholder = 'Enter question title';
       inputTitle.value = questionTitle;
       titleDiv.contentEditable = true;
       titleDiv.appendChild(inputTitle);
       const allOptions = document.createElement('h3');
       allOptions.id = 'allOptions';
       allOptions.innerHTML = "Options";
       form.appendChild(titleDiv);
       form.appendChild(allOptions);

       cleanedString.forEach((option, index) => {
           const optionDiv = document.createElement('div');
           optionDiv.className = 'option-item';
           
           const input = document.createElement('input');
           input.type = 'text';
           input.name = 'option';
           input.placeholder = `Option ${index + 1}`;
           input.value = option;
           input.className = 'option-input';
           optionDiv.contentEditable = true;
           optionDiv.appendChild(input);
           
           const checkbox = document.createElement('input');
           checkbox.type = 'checkbox';
           checkbox.name = 'correct';
           checkbox.value = index + 1;
           checkbox.className = 'option-checkbox';

           const checkboxLabel = document.createElement('label');
           checkboxLabel.innerText = 'Correct';
           checkboxLabel.className = 'option-checkbox-label';

           optionDiv.appendChild(checkbox);
           optionDiv.appendChild(checkboxLabel);
           form.appendChild(optionDiv);
       });

       const addOptionButton = document.createElement("button");
       addOptionButton.type = "button";
       addOptionButton.id = "addOption";
       addOptionButton.textContent = "Add Option";
       form.appendChild(addOptionButton);

       const submitQuestionButton = document.createElement("button");
       submitQuestionButton.type = "submit";
       submitQuestionButton.textContent = "Update Question";
       form.appendChild(submitQuestionButton);

       let count = cleanedString.length + 1;

       addOptionButton.addEventListener('click', function() {
           if (count <= 6) {
               const optionDiv = document.createElement('div');
               optionDiv.className = 'option-item';

               const input = document.createElement('input');
               input.type = 'text';
               input.name = 'option';
               input.placeholder = `Option ` + count;
               input.className = 'option-input';
               input.style.width = "100px"; 

               const checkbox = document.createElement('input');
               checkbox.type = 'checkbox';
               checkbox.name = 'correct';
               checkbox.value = count;
               checkbox.className = 'option-checkbox';

               const checkboxLabel = document.createElement('label');
               checkboxLabel.innerText = 'Correct';
               checkboxLabel.className = 'option-checkbox-label';

               optionDiv.appendChild(input);
               optionDiv.appendChild(checkbox);
               optionDiv.appendChild(checkboxLabel);
               form.insertBefore(optionDiv, addOptionButton); 

               count += 1;
           } else {
               alert("You can add only 6 options");
           }
       });
       const questionForm = document.querySelector('form');
       questionForm.addEventListener('submit', (event) => { const correctCheckboxes = document.querySelectorAll('input[name="correct"]:checked'); if (correctCheckboxes.length === 0) { 
    	   alert("Please select at least one correct option."); 
    	   event.preventDefault(); // Prevent form submission
    	   } 
       });
    </script>
</body>
</html>


