package com.college.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.college.util.DBConnection;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/login")
@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req,HttpServletResponse res)
    throws ServletException,IOException{

        String email=req.getParameter("email");
        String password=req.getParameter("password");
        String roleInput = req.getParameter("role");

        try{
            Connection con=DBConnection.getConnection();

            PreparedStatement ps=con.prepareStatement(
            "SELECT * FROM users WHERE email=? AND password=?");

            ps.setString(1,email);
            ps.setString(2,password);

            ResultSet rs=ps.executeQuery();

            if(rs.next()){

                String roleDB = rs.getString("role");

                if(roleDB.equalsIgnoreCase(roleInput)){

                    HttpSession s=req.getSession();
                    s.setAttribute("user",rs.getString("name"));
                    s.setAttribute("role",roleDB);
                    s.setAttribute("userId",rs.getInt("id"));

                    if(roleDB.equalsIgnoreCase("admin")){
                        res.sendRedirect("admin.jsp");
                    }else{
                        res.sendRedirect("student.jsp");
                    }

                }else{
                    res.getWriter().println("Wrong role selected ❌");
                }

            }else{
                res.sendRedirect("login.jsp?error=1");
            }

        }catch(Exception e){
            e.printStackTrace();   
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {

        res.sendRedirect("login.jsp");
    }
}