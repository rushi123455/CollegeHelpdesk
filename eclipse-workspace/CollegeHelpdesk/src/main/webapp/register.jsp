<!DOCTYPE html>
<html>

<head>
	<title>Student Registration</title>

	<style>
		body {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
			background: linear-gradient(135deg, #667eea, #764ba2);
			height: 100vh;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.container {
			background: white;
			padding: 30px;
			width: 320px;
			border-radius: 10px;
			box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.2);
			text-align: center;
		}

		.container h2 {
			margin-bottom: 20px;
			color: #333;
		}

		input,
		select {
			width: 90%;
			padding: 10px;
			margin: 10px 0;
			border-radius: 5px;
			border: 1px solid #ccc;
			outline: none;
			transition: 0.3s;
		}

		input:focus,
		select:focus {
			border-color: #667eea;
			box-shadow: 0 0 5px #667eea;
		}

		button {
			width: 100%;
			padding: 10px;
			background: #667eea;
			color: white;
			border: none;
			border-radius: 5px;
			font-size: 16px;
			cursor: pointer;
			transition: 0.3s;
		}

		button:hover {
			background: #5a67d8;
		}

		a {
			display: block;
			margin-top: 15px;
			text-decoration: none;
			color: #555;
		}

		a:hover {
			color: #000;
		}
	</style>

</head>

<body>

	<div class="container">
		<h2>Student Registration </h2>

		<form action="register" method="post">

			<input name="name" placeholder="Full Name" pattern="[A-Za-z ]{3,}"
				title="Name should be at least 3 letters only" required>

			<input name="email" placeholder="Gmail only" pattern=".+@gmail\.com" title="Only Gmail allowed" required>

			<input type="password" name="password" placeholder="Password" pattern=".{6,}" title="Minimum 6 characters"
				required>

			<input name="mobile" placeholder="Mobile Number" pattern="[0-9]{10}" title="Enter 10 digit mobile number"
				required>

			<select name="course">
				<option value="Java">Java</option>
				<option value="Python">Python</option>
				<option value="C">C</option>
			</select>

			<button>Register</button>


		</form>

		<a href="login.jsp"> Back to Login</a>
	</div>

</body>

</html>