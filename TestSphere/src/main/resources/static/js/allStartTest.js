/**
 * 
 */function openTest(testId, listOfIdsOfQuestion, testType) {
    const form = document.createElement('form');
    form.method = 'post';
    form.action = testType === 'mcq' ? 'startMcqTest' : 'startCodingTest';

    const listOfIdsInput = document.createElement('input');
    listOfIdsInput.type = 'hidden';
    listOfIdsInput.name = 'listOfIdsQuestions';
    listOfIdsInput.value = listOfIdsOfQuestion || '';
    form.appendChild(listOfIdsInput);

    document.body.appendChild(form);
    form.submit();
}