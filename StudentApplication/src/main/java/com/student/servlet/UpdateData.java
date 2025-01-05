package com.student.servlet;

import java.io.IOException;

import com.student.dto.Student;
import com.student.dao.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateData")
public class UpdateData extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		    if (session == null || session.getAttribute("success") == null) {
		        resp.sendRedirect("login.jsp"); // Redirect to login page
		        return;
		    }
		
		Student success=(Student)session.getAttribute("success");
		
		String name=req.getParameter("name");
		long phone=Long.parseLong(req.getParameter("phone"));
		String mailID=req.getParameter("email");
		String branch=req.getParameter("branch");
		String location = req.getParameter("location");
		String password=req.getParameter("password");
		
		Student s=null;
		StudentDAO sdao=new StudentSDAOImplimentation();
		
		
		
		System.out.println(password);
		
		System.out.println(success);
		
		if(success!=null && success.getPass().equals(password)) {
			
			
			s=sdao.getStudent(success.getMailId(), password);
			System.out.println(s);
			if(s!=null) {
				s.setName(name);
				s.setPhone(phone);
				s.setMailId(mailID);
				s.setBranch(branch);
				s.setLocation(location);
				System.out.println(s);
				
				boolean isUpdated=sdao.updateStudent(s);
				System.out.println(isUpdated);
				if(isUpdated) {
					req.setAttribute("usuccess", "Data Updated Successfuly");
					req.getRequestDispatcher("login.jsp").forward(req, resp);
				}
				else {
					req.setAttribute("failure", "Failed to Update 1");
					req.getRequestDispatcher("updateData.jsp").forward(req, resp);
				}
			}
			else {
				req.setAttribute("failure", "Failed to Update 2");
				req.getRequestDispatcher("updateData.jsp").forward(req, resp);
			}
			
			
		}
		else {
			req.setAttribute("failure", "Failed to Update 3");
			req.getRequestDispatcher("updateData.jsp").forward(req, resp);
		}
		
		
	}
}
