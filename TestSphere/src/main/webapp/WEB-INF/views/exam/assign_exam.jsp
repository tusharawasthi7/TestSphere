<!DOCTYPE html>
<html>
<head>
    <title>Assign Exam</title>
</head>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(to bottom right, #8A2BE2, #FF69B4); /* Purple to pink gradient */
        color: #fff;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
    }
</style>
<body>
    <h1>Catalog Creation</h1>
    <form id="assignExamForm" action="/exam/assign_exam" method="post">
        <label for="catalogName">Catalog Name:</label> 
        <input type="text" id="catalogName" name="catalogName" minlength="1" maxlength="50" required> 
        <br><br>

        <!-- <label for="language">Language:</label> -->
        <input type="hidden" id="language" name="language" value="default">
        <br><br>
        
        <label for="isMcq">Is MCQ:</label> 
        <input type="checkbox" id="isMcq" name="isMcq" value="true"> 
        <br><br>
        
        <label for="isCoding">Is Coding:</label> 
        <input type="checkbox" id="isCoding" name="isCoding" value="true"> 
        <br><br>

        <button type="submit">Assign</button>
    </form>

    <script>
        document.getElementById('assignExamForm').onsubmit = function(event) {
            const isMcq = document.getElementById('isMcq').checked;
            const isCoding = document.getElementById('isCoding').checked;

            if (!isMcq && !isCoding) {
                alert('Please select at least one option: MCQ or Coding.');
                event.preventDefault(); // Prevent form submission
            }
        };
    </script>
</body>
</html>
