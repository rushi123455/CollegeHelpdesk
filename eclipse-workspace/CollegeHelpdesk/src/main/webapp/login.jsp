<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Login</title>

		<!-- 🔥 GOOGLE FONT -->
		<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

		<style>
			body {
				margin: 0;
				font-family: 'Poppins', sans-serif;
			}

			/* MAIN */
			.container {
				display: flex;
				height: 100vh;
			}

			/* LEFT */
			.left {
				width: 40%;
				background: #0f172a;
				color: white;
				display: flex;
				justify-content: center;
				align-items: center;
			}

			.login-box {
				width: 70%;
			}

			/* 🔥 BIG TITLE */
			.login-box h2 {
				font-size: 36px;
				font-weight: 700;
			}

			.login-box p {
				color: #aaa;
			}

			/* INPUT */
			input,
			select {
				width: 100%;
				padding: 14px;
				margin-top: 15px;
				border: none;
				border-bottom: 2px solid #555;
				background: transparent;
				color: white;
				font-size: 16px;
			}

			/* BUTTON */
			button {
				width: 100%;
				padding: 14px;
				margin-top: 25px;
				background: linear-gradient(135deg, #8b5cf6, #6366f1);
				border: none;
				color: white;
				border-radius: 6px;
				font-size: 18px;
				font-weight: 600;
				cursor: pointer;
			}

			button:hover {
				opacity: 0.9;
			}

			/* ERROR */
			.error {
				color: red;
				margin-top: 10px;
				font-weight: 500;
			}

			/* RIGHT */
			.right {
				width: 60%;
				background: linear-gradient(135deg, #8b5cf6, #6366f1);
				display: flex;
				justify-content: center;
				align-items: center;
				flex-direction: column;
			}

			/* 🔥 BIG TEXT */
			.right h1 {
				color: white;
				font-size: 60px;
				font-weight: 700;
				text-align: center;
			}

			.right p {
				color: #eee;
				font-size: 20px;
				margin-top: 10px;
			}
		</style>

	</head>

	<body>

		<div class="container">

			<!-- LEFT -->
			<div class="left">
				<div class="login-box">

					<h2>Login</h2>
					<p>Enter your account details</p>

					<% String error=request.getParameter("error"); if("1".equals(error)){ %>
						<div class="error">Invalid Email or Password</div>
						<% } %>

							<form action="login" method="post">

								<input type="email" name="email" placeholder="Email" required>

								<input type="password" name="password" placeholder="Password" required>

								<select name="role">
									<option value="admin">Admin</option>
									<option value="student">Student</option>
								</select>

								<button>Login</button>

							</form>

							<br>
							<a href="register.jsp" style="color:#aaa;">Don't have account? Register</a>

				</div>
			</div>

			<!-- RIGHT (ONLY TEXT NOW) -->
			<div class="right">

				<h1>Welcome to<br>Student Portal</h1>
				<p>Login to access your account</p>

			</div>

		</div>

	</body>

	</html>