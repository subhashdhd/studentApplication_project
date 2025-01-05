package com.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import com.student.dao.*;
import com.student.dto.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/login")

public class Login extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		PrintWriter out=res.getWriter();
		HttpSession session=req.getSession();
		
		
		String emailid=req.getParameter("mailId");
		String password=req.getParameter("password");
		
		
		
		StudentDAO sdao=new StudentSDAOImplimentation();
		
		Student s=sdao.getStudent(emailid, password);
		
		if(s.getName()!=null) {
			if(password.equals(s.getPass())) {
//				req.setAttribute("success",s);
//				RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
//				rd.forward(req, res);
				
				session.setAttribute("success", s);
				RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
				rd.forward(req, res);
				
			}
			
		}
		else {
			req.setAttribute("failure","login failed");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, res);
		}
	}
}
