// Handle the button clicks (for profile and logout) as needed
document.addEventListener('DOMContentLoaded', function() {
 
	document.getElementById("create-test").onclick = function() {
		window.location.href = "http://localhost:9192/setQuestionCount";
	};
 
	
	document.getElementById("view-report").onclick = function() {
		window.location.href = "http://localhost:9192/testHistory";
	};
 
	
 
 
 
});
document.addEventListener('DOMContentLoaded', function () {
    const logoutButton = document.querySelector('.logout-btn');
    const logoutModal = document.getElementById('logoutModal');
    const confirmButton = document.getElementById('confirmButton');
    const cancelButton = document.getElementById('cancelButton');
 
    logoutButton.addEventListener('click', function (event) {
        event.preventDefault();
        logoutModal.style.display = 'block';
    });
 
    confirmButton.addEventListener('click', function () {
        window.location.href = logoutButton.querySelector('a').href;
    });
 
    cancelButton.addEventListener('click', function () {
        logoutModal.style.display = 'none';
    });
 
    // Close the modal when clicking outside of it
    window.addEventListener('click', function (event) {
        if (event.target == logoutModal) {
            logoutModal.style.display = 'none';
        }
    });
});
 
function showList() {
    var list = document.getElementById("infoList");
    if (list.style.display === "none") {
        list.style.display = "block";
    } else {
        list.style.display = "none";
    }
}
 