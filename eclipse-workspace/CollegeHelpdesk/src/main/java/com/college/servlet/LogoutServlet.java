package com.college.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

import jakarta.servlet.annotation.WebServlet;

@SuppressWarnings("serial")
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req,HttpServletResponse res)
    throws ServletException,IOException{

        req.getSession().invalidate();
        res.sendRedirect("login.jsp");
    }
}