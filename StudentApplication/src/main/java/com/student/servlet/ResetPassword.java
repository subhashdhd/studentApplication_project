package com.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.student.dao.StudentDAO;
import com.student.dao.StudentSDAOImplimentation;
import com.student.dto.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/resetpassword")
public class ResetPassword extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 HttpSession session = req.getSession(false); // Do not create a new session
		    if (session == null || session.getAttribute("success") == null) {
		        resp.sendRedirect("login.jsp"); // Redirect to login page
		        return;
		    }
		
		PrintWriter out=resp.getWriter();
		
		String newpass=req.getParameter("newPass");
		String email=req.getParameter("mailId");
		
		long  phone =Long.parseLong(req.getParameter("phone"));
		String  conpass=req.getParameter("confirmPass");
		
		
		StudentDAO sdao=new StudentSDAOImplimentation();
		Student s=new Student();
		
		if(newpass.equals(conpass)) {
			s.setMailId(email);
			s.setPhone(phone);
			s=sdao.getStudent(email, phone);
			if(s!=null) {
				s.setPass(conpass);
				boolean res1=sdao.updateStudent(s);
				if(res1) {
//					out.print("<h1>password updated successfully</h1>");
					req.setAttribute("psuccess","Password updated successfully");
					RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
					rd.forward(req, resp);
				}
				else {
//					out.print("<h1>Failed to Update</h1>");
					req.setAttribute("failure","Failed to Update Password");
					RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
					rd.forward(req, resp);
				}
				
			}
			else {
//				out.print("<h1>User not Found</h1>");
				req.setAttribute("user","User Not found");
				RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
				rd.forward(req, resp);
			}
		}
		else {
//			out.print("<h1>Password Mismatch</h1>");
			req.setAttribute("mismatch","Password Mismatch");
			RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
			rd.forward(req, resp);
		}
		
		
		
		
	}

}
