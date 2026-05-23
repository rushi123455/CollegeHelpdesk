package com.college.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.sql.*;
import com.college.util.DBConnection;

@SuppressWarnings("serial")
@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {

protected void doPost(HttpServletRequest req,HttpServletResponse res)
throws ServletException,IOException{

int id = Integer.parseInt(req.getParameter("id"));
String name = req.getParameter("name");
String email = req.getParameter("email");
String mobile = req.getParameter("mobile");
String course = req.getParameter("course");

try{
Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"UPDATE users SET name=?,email=?,mobile=?,course=? WHERE id=?");

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,mobile);
ps.setString(4,course);
ps.setInt(5,id);

ps.executeUpdate();

res.sendRedirect("admin.jsp");

}catch(Exception e){
e.printStackTrace();
}
}
}