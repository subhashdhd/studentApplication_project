package com.student.dao;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.student.connectors.ConnectionFactory;
import com.student.dto.Student;

public class StudentSDAOImplimentation implements StudentDAO{
	private Connection cn;
	
	public StudentSDAOImplimentation() {
		this.cn=ConnectionFactory.requestConnection();
	}
	
		
	@Override
	public boolean insertStudent(Student s) {
		String query="INSERT INTO STUDENT VALUES (0,?,?,?,?,?,?,SYSDATE())";
		PreparedStatement ps=null;
		int res=0;
		
		try {
			ps=cn.prepareStatement(query);
			
			
			ps.setString(1, s.getName()); 
			ps.setLong(2, s.getPhone());
			ps.setString(3, s.getMailId());
			ps.setString(4, s.getBranch());
			ps.setString(5, s.getLocation());
			ps.setString(6, s.getPass());
			
			res=ps.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return res>0;
		
		
	}

	@Override
	public boolean updateStudent(Student s) {
		PreparedStatement ps=null;
		int res=0;
		String query="UPDATE STUDENT SET NAME=? , BRANCH=? , LOCATION=? , PASSWORD=? , PHONE=? , MAILID=? WHERE ID=?";
		
		try {
			ps=cn.prepareStatement(query);
			ps.setString(1, s.getName());
			ps.setString(2,s.getBranch());
			ps.setString(3,s.getLocation());
			ps.setString(4,s.getPass());
			ps.setLong(5, s.getPhone());
			ps.setString(6, s.getMailId());
			ps.setInt(7, s.getId());
			
			res=ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res>0;
	}

	@Override
	public boolean deleteStudent(Student s) {
		
		String query1="DELETE FROM STUDENT WHERE PHONE=? AND PASSWORD=?";
		PreparedStatement ps1=null;
		
		String query2="SELECT PASSWORD FROM STUDENT WHERE PHONE=? ";
		PreparedStatement ps2=null;
		
		int res1=0;
		ResultSet res2=null;
		
		try {
			ps1=cn.prepareStatement(query1);
			ps1.setLong(1, s.getPhone() );
			ps1.setString(2, s.getPass());
			
			ps2=cn.prepareStatement(query2);
			ps2.setLong(1, s.getPhone());
			
			
			res2=ps2.executeQuery();
			if(res2.next()) {
				String pass=res2.getString("PASSWORD");
				if(pass.equals(s.getPass())) {
					res1=ps1.executeUpdate();
				}
				else {
					return false;
				}
			}
			else {
				return false;
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res1>0;
	}

	@Override
	public Student getStudent(String mailId, String pass) {
		
		Student s=new Student();
		PreparedStatement ps=null; 
		ResultSet res=null;
		

		String query = "SELECT * FROM STUDENT WHERE MAILID=? AND PASSWORD=?";
		
		try {
			ps=cn.prepareStatement(query);
			ps.setString(1, mailId);
			ps.setString(2, pass);
			
			res=ps.executeQuery();
			
			if(res.next()) {
				String pass1=res.getString("PASSWORD");
				if(pass1.equals(pass)) {
	
					s.setId(res.getInt("ID"));
					s.setName(res.getString("NAME"));
					s.setPhone(res.getLong("PHONE"));
					s.setBranch(res.getString("BRANCH"));
					s.setMailId(res.getString("MAILID"));
					s.setLocation(res.getString("LOCATION"));
					s.setPass(res.getString("PASSWORD"));
					
				}
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return s;
	}

	@Override
	public List<Student> getStudent() {
	    List<Student> students = new ArrayList<>();

	    String query = "SELECT * FROM STUDENT";

	    try (PreparedStatement ps = cn.prepareStatement(query);
	         ResultSet res = ps.executeQuery()) {

	        while (res.next()) {
	            Student s = new Student();
	            s.setId(res.getInt("ID"));
	            s.setName(res.getString("NAME"));
	            s.setPhone(res.getLong("PHONE"));
	            s.setBranch(res.getString("BRANCH"));
	            s.setMailId(res.getString("MAILID"));
	            s.setLocation(res.getString("LOCATION"));
	            // Handle date field if present
	            // s.setDate(res.getDate("DATE"));

	            students.add(s);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Replace with proper logging
	    }

	    return students;
	}



	@Override
	public Student getStudent(String mailId, long phone) {
		Student s=new Student();
		PreparedStatement ps=null; 
		ResultSet res=null;
		

		String query = "SELECT * FROM STUDENT WHERE MAILID=? AND PHONE=?";
		
		try {
			ps=cn.prepareStatement(query);
			ps.setString(1, mailId);
			ps.setLong(2, phone);
			
			res=ps.executeQuery();
			
			if(res.next()) {
					s.setId(res.getInt("ID"));
					s.setName(res.getString("NAME"));
					s.setPhone(res.getLong("PHONE"));
					s.setBranch(res.getString("BRANCH"));
					s.setMailId(res.getString("MAILID"));
					s.setLocation(res.getString("LOCATION"));
					s.setPass(res.getString("PASSWORD"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return s;
	}
	
}
