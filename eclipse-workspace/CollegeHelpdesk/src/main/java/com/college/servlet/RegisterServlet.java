package com.college.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.college.util.DBConnection;
import jakarta.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,HttpServletResponse res)
    throws ServletException,IOException{

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String mobile = req.getParameter("mobile");
        String course = req.getParameter("course");

        try{
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
            "INSERT INTO users(name,email,password,role,mobile,course) VALUES(?,?,?,?,?,?)");

            ps.setString(1,name);
            ps.setString(2,email);
            ps.setString(3,password);
            ps.setString(4,"student");   // default role
            ps.setString(5,mobile);
            ps.setString(6,course);

            ps.executeUpdate();

            res.sendRedirect("login.jsp");

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}