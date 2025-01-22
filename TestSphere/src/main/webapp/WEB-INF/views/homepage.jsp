<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Test Vault - Unlock Your Future</title>
<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        // Contact Us Modal
        const contactUsModal = document.getElementById("contactUsModal");
        const contactUsBtn = document.getElementById("contactUsBtn");
        const contactUsSpan = document.getElementsByClassName("close")[0];

        contactUsBtn.onclick = function() {
            contactUsModal.style.display = "block";
        }

        contactUsSpan.onclick = function() {
            contactUsModal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == contactUsModal) {
                contactUsModal.style.display = "none";
            }
        }

        // Learn More Modal
        const learnMoreModal = document.getElementById("learnMoreModal");
        const learnMoreBtn = document.getElementById("learnMoreBtn");
        const learnMoreSpan = document.getElementsByClassName("close")[1];

        learnMoreBtn.onclick = function() {
            learnMoreModal.style.display = "block";
        }

        learnMoreSpan.onclick = function() {
            learnMoreModal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == learnMoreModal) {
                learnMoreModal.style.display = "none";
            }
        }
    });
</script>

<link href="../css/homepage.css" rel="stylesheet" type="text/css" />

<!--
    - favicon
  -->
<link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">

<!--
    - custom css link
  -->


<!--
    - google font link
  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&family=Source+Sans+Pro:wght@600;700&display=swap"
	rel="stylesheet">
</head>

<body id="top">

	<!--
    - #HEADER
  -->

	<header class="header" data-header>
		<div class="container">

			<div class="overlay" data-overlay></div>

			<a href="#">
				<h1 class="logo">Test Vault</h1>
			</a>

			<nav class="navbar" data-navbar>

				<div class="navbar-top">
					<a href="#" class="logo">Test Vault</a>

					<button class="nav-close-btn" aria-label="Close Menu"
						data-nav-close-btn>
						<ion-icon name="close-outline"></ion-icon>
					</button>
				</div>

				<ul class="navbar-list">
					<li class="navbar-item"><a href="#home" class="navbar-link"
						data-navbar-link>Home</a></li>
					<li class="navbar-item"><a href="#about" class="navbar-link"
						data-navbar-link>About</a></li>
					<li class="navbar-item"><a href="#services"
						class="navbar-link" data-navbar-link>Services</a></li>
					<li class="navbar-item"><a href="#features"
						class="navbar-link" data-navbar-link>Features</a></li>
					<li class="navbar-item"><a href="admin/login"
						class="navbar-link" data-navbar-link>Admin</a></li>
					<li class="navbar-item"><a href="user/login"
						class="navbar-link" data-navbar-link>User</a></li>
				</ul>

			</nav>

			<button id="contactUsBtn" class="btn">Contact Us</button>
			<div id="contactUsModal" class="modal">
				<div class="modal-content">
					<span class="close">&times;</span>
					<p>Contact us at mail: testVault@gmail.com</p>
					<p>Call Us At : XXXXXXXXXX</p>
				</div>
			</div>

			<button class="nav-open-btn" aria-label="Open Menu" data-nav-open-btn>
				<ion-icon name="menu-outline"></ion-icon>
			</button>

		</div>
	</header>

	<main>
		<article>

			<!--
        - #HERO
      -->

			<section class="hero" id="home">
				<div class="container">

					<div class="hero-content">
						<p class="hero-subtitle">Your Gateway to Academic Excellence</p>
						<h2 class="h2 hero-title">Transform Learning with Test Vault</h2>
						<p class="hero-text">Discover powerful tools to ace your
							exams, with resources tailored for your success.</p>
						<button id="learnMoreBtn" class="btn">Learn More</button>
						<div id="learnMoreModal" class="modal">
							<div class="modal-content">
								<span class="close">&times;</span>
								<h2>About Test Vault</h2>
								<p>Test Vault is an innovative examination portal designed
									to empower students to achieve academic excellence. Our
									platform provides a variety of courses and practice tests
									tailored for different types of exams. With Test Vault, you can
									simulate real exam conditions, receive instant feedback, and
									track your progress to identify areas for improvement. Join us
									to unlock your full potential and achieve your academic goals.</p>
							</div>
						</div>
					</div>

					<figure class="hero-banner">
						<img src="../images/image5.png" alt="image" height="70%" width="80%">
					</figure>

				</div>
			</section>

			<!--
        - #ABOUT
      -->

			<section class="section about" id="about">
				<div class="container">

					<figure class="about-banner">
						<img src="../images/image3.png" width="700"
							height="532" loading="lazy" alt="about banner"
							class="w-100 banner-animation">
					</figure>

					<div class="about-content">
						<h2 class="h2 section-title underline">Why Choose Test Vault</h2>
						<p class="about-text">Test Vault is an innovative online exam
							portal designed to empower students in achieving academic
							success. It provides a platform where users can access a variety
							of courses tailored to different types of exams Test Vault
							includes a variety of mock exams and practice tests to simulate
							real exam conditions, helping users build confidence and identify
							areas that need improvement.</p>



					</div>
			</section>

			<!--
        - #SERVICE
      -->

			<section class="section service" id="services">
				<div class="container">

					<h2 class="h2 section-title underline">Our Services</h2>

					<ul class="service-list">
						<li>
							<div class="service-card">
								<div class="card-icon">
									<ion-icon name="telescope-outline"></ion-icon>
								</div>
								<h3 class="h3 title">Mock Exams</h3>
								<p class="text">Get real-time exam simulations tailored to
									your course and goals.</p>
							</div>
						</li>
						<li>
							<div class="service-card">
								<div class="card-icon">
									<ion-icon name="desktop-outline"></ion-icon>
									
								</div>
								<h3 class="h3 title">Progress Tracking</h3>
								<p class="text">Monitor your strengths and areas of
									improvement with detailed analytics.</p>
							</div>
						</li>
						<li>
							<div class="service-card">
								<div class="card-icon">
									<ion-icon name="desktop-outline"></ion-icon>
								</div>
								<h3 class="h3 title">Certifications</h3>
								<p class="text">Earning a certification gives users a sense
									of motivation</p>
							</div>
						</li>
					</ul>

				</div>
			</section>

			<!--
    - #FEATURES
-->

			<section class="section features" id="features">
				<div class="container">

					<h2 class="h2 section-title underline">Unique Features</h2>

					<div class="features-row">
						<div class="features-card">
							<div class="icon">
								<ion-icon name="bulb-outline"></ion-icon>
							</div>
							<div class="content">
								<h3 class="h3 title">Customizable Tests</h3>
								<p class="text">Design tests to suit your specific syllabus
									and difficulty level.</p>
							</div>
						</div>
						<div class="features-card">
							<div class="icon">
								<ion-icon name="rocket-outline"></ion-icon>
							</div>
							<div class="content">
								<h3 class="h3 title">Instant Results</h3>
								<p class="text">Receive instant feedback on your performance
									with actionable insights.</p>
							</div>
						</div>
						<div class="features-card">
							<div class="icon">
								<ion-icon name="clipboard-outline"></ion-icon>
							</div>
							<div class="content">
								<h3 class="h3 title">Progress Tracking</h3>
								<p class="text">Monitor your improvement with detailed
									analytics and performance history.</p>
							</div>
						</div>
					</div>

					<div class="features-row">
						<div class="features-card">
							<div class="icon">
								<ion-icon name="shield-checkmark-outline"></ion-icon>
							</div>
							<div class="content">
								<h3 class="h3 title">Secure Certification</h3>
								<p class="text">Earn valid certifications after successfully
									completing exams and courses.</p>
							</div>
						</div>
						<div class="features-card">
							<div class="icon">
								<ion-icon name="people-outline"></ion-icon>
							</div>
							<div class="content">
								<h3 class="h3 title">Interactive Learning</h3>
								<p class="text">Engage with peers and instructors in
									discussions and study groups.</p>
							</div>
						</div>
						<div class="features-card">
							<div class="icon">
								<ion-icon name="timer-outline"></ion-icon>
							</div>
							<div class="content">
								<h3 class="h3 title">Timed Practice Exams</h3>
								<p class="text">Prepare for real exam conditions with timed
									mock tests and simulations.</p>
							</div>
						</div>
					</div>

				</div>
			</section>
		</article>
	</main>