document.addEventListener('DOMContentLoaded', () => {
        const optionsContainer = document.getElementById('option-container'); // Corrected ID
        const addOptionButton = document.getElementById('addOption');
        const questionForm = document.querySelector('form');

        // Function to create an option input with a checkbox
        function createOption(optionCount) {
            // Create a container for the option and its correct checkbox
            const optionWrapper = document.createElement('div');
            optionWrapper.style.display = 'flex';
            optionWrapper.style.alignItems = 'center';
            optionWrapper.style.marginBottom = '8px';

            // Create the option input
            const newOption = document.createElement('input');
            newOption.type = 'text';
            newOption.name = 'option';
            newOption.placeholder = `Option ${optionCount}`;
            newOption.required = true;
            newOption.style.marginRight = '10px';

            // Create the checkbox for marking as correct
            const correctOptionCheckbox = document.createElement('input');
            correctOptionCheckbox.type = 'checkbox';
            correctOptionCheckbox.name = 'correct';
            correctOptionCheckbox.value = optionCount;
            correctOptionCheckbox.style.marginRight = '5px';

            // Create a label for the checkbox
            const checkboxLabel = document.createElement('label');
            checkboxLabel.innerText = 'Correct';

            // Append the input and checkbox to the wrapper
            optionWrapper.appendChild(newOption);
            optionWrapper.appendChild(correctOptionCheckbox);
            optionWrapper.appendChild(checkboxLabel);

            // Append the wrapper to the options container
            optionsContainer.appendChild(optionWrapper);
        }

        // Initialize with two options
        createOption(1);
        createOption(2);

        // Add new option on button click
        addOptionButton.addEventListener('click', () => {
            const optionCount = optionsContainer.children.length + 1;

            // Limit to 6 options
            if (optionCount > 6) {
                alert("You can add a maximum of 6 options.");
                return;
            }

            createOption(optionCount);
        });

        // Validate form submission
        questionForm.addEventListener('submit', (event) => {
            const correctCheckboxes = document.querySelectorAll('input[name="correct"]:checked');
            if (correctCheckboxes.length === 0) {
                alert("Please select at least one correct option.");
                event.preventDefault(); // Prevent form submission
            }
        });
    });