package com.student.servlet;

import java.io.IOException;

import java.util.List;
import com.student.dto.Student;
import com.student.dao.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewData")
public class ViewData extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    	 HttpSession session = req.getSession(false); // Do not create a new session
    	    if (session == null || session.getAttribute("success") == null) {
    	        resp.sendRedirect("login.jsp"); // Redirect to login page
    	        return;
    	    }
    	
            StudentDAO sdao = new StudentSDAOImplimentation();
            List<Student> students = sdao.getStudent();

            // Debugging information (optional)
            System.out.println("Fetched Students: " + students);

            req.setAttribute("students", students);
            req.getRequestDispatcher("viewData.jsp").forward(req, resp);
        
    }
}
