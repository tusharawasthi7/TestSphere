<!DOCTYPE html>
<%@page import="test.vault.reporting.entities.Certificate"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>


<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Certificate - TESTVAULT</title>
<link
	href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Raleway', sans-serif;
	background-color: #f4f6f9;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.certificate {
	background: #e2eff3; /* Light yellow background */
	padding: 30px;
	border: 15px double #3498db; /* Double border with blue color */
	border-radius: 16px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	text-align: center;
	width: 800px;
	max-width: 100%;
	position: relative;
	overflow: hidden;
}

.corner-design {
	position: absolute;
	width: 50px;
	height: 50px;
	background: linear-gradient(145deg, #3498db, #8e44ad);
	border-radius: 50%;
	opacity: 0.5;
}

.top-left {
	top: -25px;
	left: -25px;
}

.top-right {
	top: -25px;
	right: -25px;
}

.bottom-left {
	bottom: -25px;
	left: -25px;
}

.bottom-right {
	bottom: -25px;
	right: -25px;
}

.certificate img {
	max-width: 100px;
	height: auto;
	margin-bottom: 10px;
}

.certificate h2 {
	font-size: 36px;
	margin-bottom: 10px;
	color: #2980b9;
}

.certificate p {
	font-family: 'Roboto', sans-serif;
	font-size: 20px;
	margin-bottom: 5px;
	color: #2c3e50;
}

.certificate .username {
	font-family: 'Raleway', sans-serif;
	color: #e74c3c;
	font-weight: bold;
}

.certificate .test {
	font-family: 'Raleway', sans-serif;
	color: #8e44ad;
	font-weight: bold;
}

.certificate .details {
	font-family: 'Roboto', sans-serif;
	color: #2c3e50;
	margin-top: 10px;
	font-size: 18px;
}

.certificate .serial-number {
	position: absolute;
	top: 20px;
	right: 20px;
	font-family: 'Roboto', sans-serif;
	color: #2c3e50;
	font-size: 16px;
	font-weight: bold;
}

.certificate .signature {
	margin-top: 20px;
	display: flex;
	justify-content: space-between;
	padding: 0 20px;
}

.certificate .signature div {
	text-align: center;
}

.certificate .signature div p {
	margin: 0;
	font-size: 16px;
	color: #34495e;
}

.btn {
	padding: 10px 20px;
	background-color: #3498db; /* Blue button */
	color: white;
	text-decoration: none;
	border-radius: 5px;
	margin-top: 10px;
	transition: background-color 0.3s ease;
	display: inline-block;
}

.btn:hover {
	background-color: #2980b9; /* Darker blue on hover */
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
<script>
    function downloadPDF() {
        const button = document.querySelector('.btn');
        button.style.display = 'none';
        html2canvas(document.querySelector('.certificate')).then(canvas => {
            const imgData = canvas.toDataURL('image/png');
            const { jsPDF } = window.jspdf;
            const pdf = new jsPDF('landscape');
            pdf.addImage(imgData, 'PNG', 10, 10, 280, 200);
            pdf.save('Certificate.pdf');
            button.style.display = 'block';
        });
    }
    </script>
</head>
<body>

	<!-- Scripting Tag -->
	<%
	Certificate certificate = (Certificate) request.getAttribute("Certificate");
	Double percentage = (Double) (certificate.getScore() / (certificate.getNumberOfQuestion() * 2.0)) * 100;
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	String currentDate = formatter.format(date);
	%>


	<div class="certificate">
		<div class="corner-design top-left"></div>
		<div class="corner-design top-right"></div>
		<div class="corner-design bottom-left"></div>
		<div class="corner-design bottom-right"></div>

		<img src="../images/logo.jpg" alt="Company Logo">
		<h2>Certificate of Completion</h2>
		<p class="serial-number">
			Certificate Number:
			<%=certificate.getCertificateNumber()%></p>
		<p>This is to certify that</p>
		<p>
			<strong class="username"><%=certificate.getUserName()%></strong>
		</p>
		<p>has successfully completed the</p>
		<p>
			<strong class="test"  ><%=certificate.getTestName()%></strong> <br><br>Test
		</p>
		<p>We recognize your dedication and hard work. This achievement
			highlights your capability and determination. Keep pushing boundaries
			and aiming for excellence. Your future is bright!</p>
		<p class="details">
			Percentage:<%=(int) Math.round(percentage)%>%</p>
		<div class="signature">
			<div>
				<p>_________________________</p>
				<p>Authorized Signature</p>
			</div>
			<div>
				<p class="details">
					Date Issued:
					<%=currentDate%></p>
			</div>
		</div>
		<a href="javascript:void(0)" onclick="downloadPDF()" class="btn">Download
			Certificate</a>
	</div>
</body>
</html>