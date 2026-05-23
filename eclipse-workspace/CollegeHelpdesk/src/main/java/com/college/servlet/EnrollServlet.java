package com.college.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.college.util.DBConnection;
import jakarta.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/enroll")
public class EnrollServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,HttpServletResponse res)
    throws ServletException,IOException{

        int userId = (int)req.getSession().getAttribute("userId");
        int courseId = Integer.parseInt(req.getParameter("courseId"));

        try{
            Connection con = DBConnection.getConnection();

            // check already enrolled
            PreparedStatement check = con.prepareStatement(
            "SELECT * FROM enrollments WHERE user_id=? AND course_id=?");

            check.setInt(1,userId);
            check.setInt(2,courseId);

            ResultSet rs = check.executeQuery();

            if(!rs.next()){
                PreparedStatement ps = con.prepareStatement(
                "INSERT INTO enrollments(user_id,course_id) VALUES(?,?)");

                ps.setInt(1,userId);
                ps.setInt(2,courseId);
                ps.executeUpdate();
            }

            res.sendRedirect("student.jsp");

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}