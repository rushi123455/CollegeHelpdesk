<%@ page import="java.sql.*,com.college.util.DBConnection" %>

	<!DOCTYPE html>
	<html>

	<head>
		<title>Admin Dashboard</title>

		<style>
			body {
				margin: 0;
				font-family: 'Segoe UI', sans-serif;
				background: #f4f6f9;
			}

			/* Header */
			.header {
				background: #0d6efd;
				color: white;
				padding: 15px;
				text-align: center;
				font-size: 22px;
			}

			/* Container */
			.container {
				width: 90%;
				margin: 30px auto;
			}

			/* Card Box */
			.card {
				background: white;
				padding: 20px;
				border-radius: 10px;
				box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
			}

			/* Table */
			table {
				width: 100%;
				border-collapse: collapse;
			}

			th {
				background: #0d6efd;
				color: white;
				padding: 12px;
			}

			td {
				padding: 10px;
				border-bottom: 1px solid #ddd;
			}

			tr:hover {
				background: #f1f1f1;
			}

			/* Buttons */
			.btn {
				padding: 6px 12px;
				border-radius: 5px;
				text-decoration: none;
				color: white;
				font-size: 14px;
			}

			.edit {
				background: orange;
			}

			.edit:hover {
				background: darkorange;
			}

			.delete {
				background: red;
			}

			.delete:hover {
				background: darkred;
			}

			.logout {
				display: inline-block;
				margin-top: 20px;
				padding: 10px 20px;
				background: black;
				color: white;
				text-decoration: none;
				border-radius: 5px;
			}

			/* Top actions */
			.top-bar {
				display: flex;
				justify-content: space-between;
				margin-bottom: 15px;
			}

			.add-btn {
				background: green;
				padding: 10px 15px;
				color: white;
				border-radius: 5px;
				text-decoration: none;
			}

			.add-btn:hover {
				background: darkgreen;
			}
		</style>

	</head>

	<body>

		<% if(session.getAttribute("role")==null || !session.getAttribute("role").equals("admin")){
			response.sendRedirect("login.jsp"); return; } %>

			<div class="header">
				Admin Dashboard
			</div>

			<div class="container">

				<div class="card">

					<!-- TOP BAR -->
					<div class="top-bar">
						<h3>Student List</h3>
						<a href="register.jsp" class="add-btn">+ Add Student</a>
					</div>

					<table>

						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Email</th>
							<th>Mobile</th>
							<th>Course</th>
							<th>Action</th>
						</tr>

						<% Connection con=DBConnection.getConnection(); PreparedStatement
							ps=con.prepareStatement("SELECT * FROM users WHERE role='student'");
ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr>
<td><%=rs.getInt(" id")%>
							</td>
							<td>
								<%=rs.getString("name")%>
							</td>
							<td>
								<%=rs.getString("email")%>
							</td>
							<td>
								<%=rs.getString("mobile")%>
							</td>
							<td>
								<%=rs.getString("course")%>
							</td>

							<td>
								<a class="btn edit" href="editStudent.jsp?id=<%=rs.getInt(" id")%>">Edit</a>
								<a class="btn delete" href="deleteStudent?id=<%=rs.getInt(" id")%>"
									onclick="return confirm('Delete this student?')">Delete</a>
							</td>
							</tr>

							<% } %>

					</table>

				</div>

				<center>
					<a class="logout" href="logout">Logout</a>
				</center>

			</div>

	</body>

	</html>