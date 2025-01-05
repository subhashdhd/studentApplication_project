package com.student.servlet;

import java.io.IOException;
import java.util.List;

import com.student.dao.*;
import com.student.dto.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteUser")
public class DeleteStudent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    	 HttpSession session = req.getSession(false); // Do not create a new session
//    	    if (session == null || session.getAttribute("user") == null) {
//    	        resp.sendRedirect("login.jsp"); // Redirect to login page
//    	        return;
//    	    }
//    	
    	StudentDAO sdao = new StudentSDAOImplimentation();
        
        // Get the email and phone from the request parameters
        String email = req.getParameter("email");
        long phone = Long.parseLong(req.getParameter("phone"));
        
        // Fetch the student from the database
        Student s = sdao.getStudent(email, phone);
        
        // Proceed with deletion if the student exists
        if (s != null) {
            // Prevent deletion of admin user with id = 7
            if (s.getId() != 7) {
                boolean isDeleted = sdao.deleteStudent(s);
                
                if (isDeleted) {
                    req.setAttribute("success", "Student deleted successfully.");
                } else {
                    req.setAttribute("failure", "Failed to delete student.");
                }
            } else {
                req.setAttribute("failure1", "Admin data cannot be deleted.");
            }
        } else {
            req.setAttribute("failure", "Student not found.");
        }
        
        // Retrieve the updated list of students after deletion
        List<Student> students = sdao.getStudent();
        req.setAttribute("students", students);
        
        // Forward the request to the viewData.jsp page to display updated list and message
        req.getRequestDispatcher("viewData.jsp").forward(req, resp);
    }
}


