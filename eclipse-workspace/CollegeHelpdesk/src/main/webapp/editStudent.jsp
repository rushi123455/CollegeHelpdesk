<%@ page import="java.sql.*,com.college.util.DBConnection" %>

	<% String idParam=request.getParameter("id"); if(idParam==null){ out.println("Invalid Access"); return; } int
		id=Integer.parseInt(idParam); Connection con=DBConnection.getConnection(); PreparedStatement
		ps=con.prepareStatement("SELECT * FROM users WHERE id=?"); ps.setInt(1,id); ResultSet rs=ps.executeQuery();
		if(!rs.next()){ out.println("User not found"); return; } %>

		<!DOCTYPE html>
		<html>

		<head>
			<title>Edit Student</title>

			<!-- 🔥 GOOGLE FONT -->
			<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap"
				rel="stylesheet">

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

				/* LEFT PANEL */
				.left {
					width: 40%;
					background: #0f172a;
					color: white;
					display: flex;
					justify-content: center;
					align-items: center;
				}

				.left h1 {
					font-size: 40px;
					text-align: center;
				}

				/* RIGHT FORM */
				.right {
					width: 60%;
					background: linear-gradient(135deg, #4facfe, #00f2fe);
					display: flex;
					justify-content: center;
					align-items: center;
				}

				.form-box {
					background: white;
					padding: 30px;
					border-radius: 12px;
					width: 350px;
					box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.2);
					text-align: center;
				}

				.form-box h2 {
					margin-bottom: 20px;
				}

				/* INPUT */
				input,
				select {
					width: 100%;
					padding: 12px;
					margin: 10px 0;
					border: 1px solid #ccc;
					border-radius: 6px;
				}

				/* BUTTON */
				button {
					width: 100%;
					padding: 12px;
					background: linear-gradient(135deg, #8b5cf6, #6366f1);
					border: none;
					color: white;
					border-radius: 6px;
					font-size: 16px;
					cursor: pointer;
				}

				button:hover {
					opacity: 0.9;
				}
			</style>

		</head>

		<body>

			<div class="container">

				<!-- LEFT SIDE -->
				<div class="left">
					<h1>Edit Student<br>Details</h1>
				</div>

				<!-- RIGHT SIDE FORM -->
				<div class="right">

					<div class="form-box">

						<h2>Update Student</h2>

						<form action="updateStudent" method="post">

							<input type="hidden" name="id" value="<%=rs.getInt(" id")%>">

							<input name="name" value="<%=rs.getString(" name")%>" placeholder="Name">

							<input name="email" value="<%=rs.getString(" email")%>" placeholder="Email">

							<input name="mobile" value="<%=rs.getString(" mobile")%>" placeholder="Mobile">

							<select name="course">
								<option <%=rs.getString("course").equals("Java")?"selected":""%>>Java</option>
								<option <%=rs.getString("course").equals("Python")?"selected":""%>>Python</option>
								<option <%=rs.getString("course").equals("C")?"selected":""%>>C</option>
							</select>

							<button>Update</button>

						</form>

					</div>

				</div>

			</div>

		</body>

		</html>