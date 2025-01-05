package com.student.connectors;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	public static Connection requestConnection() {
		Connection cn=null;
		
		String url="jdbc:mysql://localhost:3306/company_1";
		String user="root";
		String Mpassword="Subhas@123";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");// loading driver classes
			cn=DriverManager.getConnection(url, user, Mpassword);
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return cn;
	}
	
}
