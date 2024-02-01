package com.jsp.student.DataAccessObjectDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.jsp.student.model.StudentInfo;


public  class StudentDAOImplimentation implements StudentDAO{
	private final String url="jdbc:mysql://localhost:3306/schoolmanagementsystem?user=root&password=12345";
	private final String insert="insert into studentinfo(StudentName, StudentMobileNumber, StudentEmailId, StudentPassword, StudentCource, StudentGender, StudentDateOfBirth, StudentJoiningDate)values(?,?,?,?,?,?,?,?)";
	private final String select="select* from studentinfo where StudentEmailId=? and StudentPassword=?";
	
	@Override
	public int studentRegistration(StudentInfo s) {
		
//		PrintWriter writer = res.getWriter();
//		res.setContentType("text/html");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url);
			PreparedStatement ps = connection.prepareStatement(insert);
			ps.setString(1,s.getStudentName());
			ps.setString(2,s.getStudentMobileNumber());
			ps.setString(3,s.getStudentEmailId());
			ps.setString(4,s.getStudentPassword());
			ps.setString(5,s.getStudentCource());
			ps.setString(6,s.getStudentGender()); 
			
			ps.setDate(7,s.getStudentDateOfBirth());
			ps.setDate(8,s.getStudentJoiningDate());
			
			int result=ps.executeUpdate();
			if (result>0) {
				return result; 
			} else {
				return result;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public void studentPasswordUpdation(String emailId) {
		
		
	}

	@Override
	public int studentLogin(String emailId,String password) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement ps=connection.prepareStatement(select);
			ps.setString(1, emailId);
			ps.setString(2, password);
			ResultSet result=ps.executeQuery();
			if (result.next()) {
				int id=result.getInt("StudentId");
				return id;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	@Override
	public void deleteStudentDetail(String mobileNumber) {
		// TODO Auto-generated method stub
		
	}

}

