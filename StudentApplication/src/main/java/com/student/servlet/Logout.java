package com.student.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get the current session, if exists
        HttpSession session = req.getSession(false);
        
        // Invalidate the session if it exists
        if (session != null) {
            session.invalidate();
        }
        
        // Redirect to the login page
        
        
        resp.sendRedirect("login.jsp");
    }
}
