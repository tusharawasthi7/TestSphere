/**
 * 
 */
function toggleCorrectOptions(questionId) {
    const correctOptionsDiv = document.getElementById('correct-options-' + questionId);
    if (correctOptionsDiv) {
        correctOptionsDiv.style.display = correctOptionsDiv.style.display === 'none' ? 'block' : 'none';
    }
}

function checkAnswer(optionElem, correctOptions) {
    const selectedIndex = Array.from(optionElem.parentElement.children).indexOf(optionElem);
    if (correctOptions.map(i => i - 1).includes(selectedIndex)) {
        optionElem.classList.add('correct');
        optionElem.classList.remove('incorrect');
    } else {
        optionElem.classList.add('incorrect');
        optionElem.classList.remove('correct');
    }
}

document.addEventListener('DOMContentLoaded', () => {
    // Select all option elements
    const optionElements = document.querySelectorAll('.options');
    // Attach click event listener to each option
    optionElements.forEach(option => {
        const correctOptions = JSON.parse(option.getAttribute('data-correct-options'));
        option.addEventListener('click', () => checkAnswer(option, correctOptions));
    });
});