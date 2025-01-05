package com.student.dao;

import java.util.List;

import com.student.dto.Student;

public interface StudentDAO {
	public boolean insertStudent(Student s);
	public boolean updateStudent(Student s);
	public boolean deleteStudent(Student s);
	public Student getStudent(String mailId , String pass);
	public Student getStudent(String mailId , long phone);
	public List<Student> getStudent();
}
