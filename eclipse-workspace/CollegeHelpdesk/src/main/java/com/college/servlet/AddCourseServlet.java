package com.college.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.college.util.DBConnection;
import jakarta.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/addCourse")
public class AddCourseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,HttpServletResponse res)
    throws ServletException,IOException{

        String name=req.getParameter("name");
        String duration=req.getParameter("duration");
        double fees=Double.parseDouble(req.getParameter("fees"));

        try{
            Connection con=DBConnection.getConnection();

            PreparedStatement ps=con.prepareStatement(
            "INSERT INTO courses(course_name,duration,fees) VALUES(?,?,?)");

            ps.setString(1,name);
            ps.setString(2,duration);
            ps.setDouble(3,fees);

            ps.executeUpdate();

            res.sendRedirect("admin.jsp");

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}