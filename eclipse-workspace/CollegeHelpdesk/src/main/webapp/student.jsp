<%@ page import="java.sql.*,com.college.util.DBConnection" %>

	<% if(session.getAttribute("role")==null || !session.getAttribute("role").toString().equalsIgnoreCase("student")){
		response.sendRedirect("login.jsp"); return; } String name=session.getAttribute("user").toString(); %>

		<!DOCTYPE html>
		<html>

		<head>
			<title>Student Dashboard</title>

			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

			<style>
				body {
					background: #f4f6f9;
				}

				/* Sidebar */
				.sidebar {
					height: 100vh;
					background: #343a40;
					color: white;
					padding: 20px;
				}

				.sidebar a {
					display: block;
					color: white;
					margin: 15px 0;
					text-decoration: none;
				}

				/* Banner */
				.banner {
					background: #0d6efd;
					color: white;
					padding: 20px;
					border-radius: 10px;
				}

				/* Chat Box */
				.chatbox {
					position: fixed;
					bottom: 20px;
					right: 20px;
					width: 250px;
					background: white;
					border: 1px solid #ccc;
					padding: 10px;
				}
			</style>

		</head>

		<body>

			<div class="container-fluid">
				<div class="row">

					<!-- Sidebar -->
					<div class="col-md-2 sidebar">
						<h4>Student</h4>
						<a href="#">Dashboard</a>
						<a href="#">Courses</a>
						<a href="#">Results</a>
						<a href="logout">Logout</a>
					</div>

					<!-- Main -->
					<div class="col-md-10 p-4">

						<div class="banner mb-4">
							<h3>Welcome, <%=name%>
							</h3>
						</div>

						<!-- Courses -->
						<h4>Courses</h4>

						<div class="row">

							<div class="col-md-4">
								<div class="card p-3">
									<h5>Java</h5>
									<p>Core Java + OOP</p>
									<button class="btn btn-primary">View</button>
								</div>
							</div>

							<div class="col-md-4">
								<div class="card p-3">
									<h5>Python</h5>
									<p>Basics + AI</p>
									<button class="btn btn-success">View</button>
								</div>
							</div>

							<div class="col-md-4">
								<div class="card p-3">
									<h5>C</h5>
									<p>Programming Basics</p>
									<button class="btn btn-warning">View</button>
								</div>
							</div>

						</div>

						<!-- Coming Soon -->
						<div class="mt-4 p-3 bg-light">
							<h5>Coming Soon</h5>
							<ul>
								<li>Live Classes</li>
								<li>Online Exams</li>
								<li>Certificates</li>
							</ul>
						</div>

					</div>
				</div>
			</div>

			<!-- SIMPLE CHATBOT -->
			<div class="chatbox">
				<h6>Chat</h6>

				<div id="chat" style="height:120px; overflow:auto;"></div>

				<input type="text" id="msg" class="form-control mb-2" placeholder="Type...">
				<button class="btn btn-dark w-100" onclick="sendMsg()">Send</button>
			</div>

			<script>
				function sendMsg() {

					let msg = document.getElementById("msg").value;
					let chat = document.getElementById("chat");


					chat.innerHTML += "<p><b>You:</b> " + msg + "</p>";


					fetch("chatbot", {
						method: "POST",
						headers: {
							"Content-Type": "application/x-www-form-urlencoded"
						},
						body: "msg=" + encodeURIComponent(msg)
					})
						.then(response => response.text())
						.then(data => {


							chat.innerHTML += "<p><b>Bot:</b> " + data + "</p>";
						});

					document.getElementById("msg").value = "";
				}
			</script>

		</body>

		</html>