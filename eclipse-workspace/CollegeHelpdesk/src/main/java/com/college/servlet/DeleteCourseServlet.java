package com.college.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.college.util.DBConnection;
import jakarta.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/deleteCourse")
public class DeleteCourseServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req,HttpServletResponse res)
    throws ServletException,IOException{

        int id = Integer.parseInt(req.getParameter("id"));

        try{
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
            "DELETE FROM courses WHERE id=?");

            ps.setInt(1,id);
            ps.executeUpdate();

            res.sendRedirect("admin.jsp");

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}