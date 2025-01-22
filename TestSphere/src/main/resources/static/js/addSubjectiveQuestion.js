const numQuestionsInput = document.getElementById("numQuestions");
        const questionsContainer = document.getElementById("questionsContainer");
        const generateQuestionsButton = document.getElementById("generateQuestions");
        const submitQuestionsButton = document.getElementById("submitQuestions");
        const countQuestionsButton = document.getElementById("generateQuestions");
 
        generateQuestionsButton.addEventListener("click", () => {
            const numQuestions = parseInt(numQuestionsInput.value, 10);
            if (!numQuestions || numQuestions < 1) {
                alert("Please enter a valid number of questions.");
                return;
            }
 
            // Clear any previously generated inputs
            questionsContainer.innerHTML = "";
 
            // Generate question input fields
            for (let i = 1; i <= numQuestions; i++) {
                const questionBlock = document.createElement("div");
                questionBlock.className = "question-block";
                questionBlock.innerHTML = `
                    <label for="question${i}">Question ${i}:</label>
                    <input type="text" id="question${i}" name="questions" placeholder="Enter Question ${i}" required>
                `;
                questionsContainer.appendChild(questionBlock);
            }
 
            // Show the submit button
            countQuestionsButton.style.display = "none";
             submitQuestionsButton.style.display = "block";
        });