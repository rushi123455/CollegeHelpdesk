<!DOCTYPE html>
<html>

<head>
	<title>College Helpdesk</title>

	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

	<style>
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		body {
			font-family: 'Poppins', sans-serif;
		}

		/* BACKGROUND */
		body::before {
			content: "";
			position: fixed;
			width: 100%;
			height: 100%;
			background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
				url('https://images.unsplash.com/photo-1523240795612-9a054b0db644');
			background-size: cover;
			background-position: center;
			z-index: -1;
		}

		/* NAVBAR */
		.navbar {
			display: flex;
			justify-content: space-between;
			padding: 20px 50px;
			color: white;
			position: sticky;
			top: 0;
			backdrop-filter: blur(10px);
		}

		.navbar a {
			color: white;
			margin-left: 20px;
			text-decoration: none;
		}


		.hero {
			height: 100vh;
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
			text-align: center;
			color: white;
		}

		.hero h1 {
			font-size: 60px;
		}

		.hero p {
			font-size: 20px;
		}

		=.btn {
			margin-top: 20px;
			padding: 12px 25px;
			background: #4facfe;
			color: white;
			border-radius: 30px;
			text-decoration: none;
		}


		.about-section {
			padding: 60px;
			display: flex;
			justify-content: center;
		}

		.about-box {
			display: flex;
			width: 85%;
			background: rgba(255, 255, 255, 0.1);
			backdrop-filter: blur(20px);
			border-radius: 20px;
			overflow: hidden;
		}

		.about-img img {
			width: 400px;
			height: 100%;
			object-fit: cover;
		}

		.about-content {
			padding: 40px;
			color: white;
		}

		.about-content h2 {
			font-size: 35px;
		}


		.section {
			padding: 60px;
			text-align: center;
			color: white;
		}

		.container {
			display: flex;
			justify-content: center;
			flex-wrap: wrap;
		}

		.card {
			width: 260px;
			margin: 15px;
			padding: 20px;
			border-radius: 15px;
			background: rgba(255, 255, 255, 0.1);
			backdrop-filter: blur(15px);
			color: white;
		}

		.card img {
			width: 70px;
		}


		.course-card {
			width: 260px;
			margin: 15px;
			padding: 20px;
			border-radius: 15px;
			background: rgba(255, 255, 255, 0.1);
			backdrop-filter: blur(15px);
			color: white;
			text-align: center;
		}

		.course-card img {
			width: 70px;
		}


		.footer {
			text-align: center;
			padding: 20px;
			color: white;
		}
	</style>

</head>

<body>


	<div class="navbar">
		<h2>College Helpdesk</h2>
		<div>
			<a href="#">Home</a>
			<a href="#about">About</a>
			<a href="#services">Services</a>
			<a href="#courses">Courses</a>
			<a href="login.jsp">Login</a>
		</div>
	</div>


	<div class="hero">
		<h1>Welcome to College Helpdesk</h1>
		<p>AI Powered Student Management System</p>
		<a href="login.jsp" class="btn">Get Started</a>
	</div>

	<!-- ABOUT -->
	<div class="about-section" id="about">
		<div class="about-box">

			<div class="about-img">
				<img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f">
			</div>

			<div class="about-content">
				<h2>About Us</h2>
				<p>
					College Helpdesk is a smart system to manage students, courses and provide AI support.
					It helps institutions automate work and improve communication.
				</p>
				<p>
					Built using Java, JSP, Servlets and AI integration for better performance.
				</p>
			</div>

		</div>
	</div>

	<!-- SERVICES -->
	<div class="section" id="services">
		<h2>Our Services</h2>

		<div class="container">

			<div class="card">
				<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">
				<h3>Student Management</h3>
				<p>Manage student data easily</p>
			</div>

			<div class="card">
				<img src="https://cdn-icons-png.flaticon.com/512/906/906175.png">
				<h3>Courses</h3>
				<p>Manage all courses</p>
			</div>

			<div class="card">
				<img src="https://cdn-icons-png.flaticon.com/512/4712/4712109.png">
				<h3>AI Chatbot</h3>
				<p>Instant help using AI</p>
			</div>

		</div>
	</div>

	<!-- COURSES -->
	<div class="section" id="courses">
		<h2>Our Courses</h2>

		<div class="container">

			<div class="course-card">
				<img src="https://cdn-icons-png.flaticon.com/512/226/226777.png">
				<h3>Java</h3>
				<p>OOP, JDBC, Servlets, JSP</p>
			</div>

			<div class="course-card">
				<img src="https://cdn-icons-png.flaticon.com/512/5968/5968350.png">
				<h3>Python</h3>
				<p>AI, Data Science, ML</p>
			</div>

			<div class="course-card">
				<img src="https://cdn-icons-png.flaticon.com/512/4712/4712109.png">
				<h3>AI & ML</h3>
				<p>Deep learning and projects</p>
			</div>

			<div class="course-card">
				<img src="https://cdn-icons-png.flaticon.com/512/4248/4248443.png">
				<h3>SQL</h3>
				<p>Database & queries</p>
			</div>

		</div>
	</div>

	<!-- FOOTER -->
	<div class="footer">
		<p>© 2026 College Helpdesk</p>
	</div>

</body>

</html>