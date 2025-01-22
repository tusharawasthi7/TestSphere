document.addEventListener('DOMContentLoaded', function() {

	document.getElementById("upcoming-test").onclick = function() {

		window.location.href = "http://localhost:9192/user/upcoming";
		;
	}

	document.getElementById("completed-test").onclick = function() {

		window.location.href = "http://localhost:9192/user/completedTest";
		;
	}


	function showList() {
		const infoList = document.getElementById('infoList');
		infoList.style.display = (infoList.style.display === 'none' || infoList.style.display === '') ? 'block' : 'none';
	}

	document.addEventListener('click', function(event) {
		const infoList = document.getElementById('infoList');
		const profileButton = document.querySelector('.navbar-right button[onclick="showList()"]');

		if (!profileButton.contains(event.target) && !infoList.contains(event.target)) {
			infoList.style.display = 'none';
		}
	});







});


document.getElementById("practice-test").onclick = function() {
	let testContainer = document.querySelector(".practice-test-container");
	if (testContainer.style.display === 'none' || testContainer.style.display === '') {
		testContainer.style.display = 'block';
	} else {
		testContainer.style.display = 'none';
	}
};


document.addEventListener('DOMContentLoaded', function() {
	// Profile information toggle
	const profileButton = document.querySelector('.navbar-right button[onclick="showList()"]');
	const infoList = document.getElementById('infoList');
	profileButton.addEventListener('click', function() {
		infoList.style.display = (infoList.style.display === 'none' || infoList.style.display === '') ? 'block' : 'none';
	});

	document.addEventListener('click', function(event) {
		if (!profileButton.contains(event.target) && !infoList.contains(event.target)) {
			infoList.style.display = 'none';
		}
	});

	// Navigation items click handling
	const createTestButton = document.getElementById('create-test');
	const updateTestButton = document.getElementById('update-test');
	const viewReportButton = document.getElementById('view-report');

	createTestButton.addEventListener('click', function() {
		window.location.href = "http://localhost:9192/createTest";
	});

	updateTestButton.addEventListener('click', function() {
		const adminID = updateTestButton.getAttribute('value');
		window.location.href = "http://localhost:9192/updateTest?adminID=" + adminID;
	});

	viewReportButton.addEventListener('click', function() {
		window.location.href = "http://localhost:9192/viewAllTests";
	});
});




const profileButton = document.querySelector('.navbar-right button[onclick="showList()"]');
const infoList = document.getElementById('infoList');
profileButton.addEventListener('click', function() {
	infoList.style.display = (infoList.style.display === 'none' || infoList.style.display === '') ? 'block' : 'none';
});

function showList() {
	var list = document.getElementById("infoList");
	if (list.style.display === "none") {
		list.style.display = "block";
	} else {
		list.style.display = "none";
	}
}

/*const profileBtn = document.querySelector('.profile-btn');
	 const logoutBtn = document.querySelector('.logout-btn');
 
	 // Profile button functionality
	 profileBtn.addEventListener('click', () => {
		   alert('Display Admin Profile');
	 });
 
	 // Logout button functionality
	 logoutBtn.addEventListener('click', () => {
		   alert('Logging out...');
		   // You can add actual logout functionality here (like redirecting to the login page)
	 });*/