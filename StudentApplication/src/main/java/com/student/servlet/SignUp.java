package com.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.student.dto.Student;
import com.student.dao.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/signup")
public class SignUp extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException , IOException {
		// TODO Auto-generated method stub
		String name=req.getParameter("name");
		long phone=Long.parseLong(req.getParameter("phone"));
		String mailID=req.getParameter("mailId");
		String branch=req.getParameter("branch");
		String location = req.getParameter("location");
		String password=req.getParameter("pass");
		String cpassword=req.getParameter("confirmPass");
		
		PrintWriter out=res.getWriter();
		
		Student s=new Student();
		StudentDAO sdao=new StudentSDAOImplimentation();
		if(password.equals(cpassword)) {
			s.setName(name);
			s.setPhone(phone);
			s.setMailId(mailID);
			s.setBranch(branch);
			s.setLocation(location);
			s.setPass(cpassword);
			boolean res1=sdao.insertStudent(s);
			if(res1) {
//				s=sdao.getStudent(mailID, cpassword);
//				out.print("<h1>Sign Up Succefull your Id Is : "+s.getId()+"</h1>");
				req.setAttribute("success","sighup successful");
				RequestDispatcher dr=req.getRequestDispatcher("signup.jsp");
				dr.forward(req, res);
				
			}
			else {
		//		out.print("<h1>Failed to Sigh Up</h1>");
				req.setAttribute("failure","Failed to SignUp");
				RequestDispatcher dr=req.getRequestDispatcher("signup.jsp");
				dr.forward(req, res);
			}
		}
		
	}
}
