package com.jsp.student.DataAccessObjectDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;

import com.jsp.student.model.SubjectsInfo;

public class AdminDAOImplimentation implements AdminDAO{
	private final String url="jdbc:mysql://localhost:3306/schoolmanagementsystem?user=root&password=12345";
	private final String select="select* from admin where AdminEmailId=? and AdminPassword=?";
	@Override
	public boolean adminLogin(String emailId, String password) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement ps=connection.prepareStatement(select);
			ps.setString(1, emailId);
			ps.setString(2, password);
			ResultSet resultset=ps.executeQuery();
			if (resultset.next()) {
				return true;
			} else {
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
		
	}
	
	@Override
	public int studentMarksUpdateion(SubjectsInfo s,int StudentId) {
		try {
			
			int java=s.getJava();
			int CoreJava=s.getCoreJava();
			int WebTechnology=s.getWebTechnology();
			int SQL=s.getSQL();
			int JavaLibrary=s.getJavaLibrary();
			int Spring =s.getSpring();
			System.out.println(java+" "+CoreJava+" "+WebTechnology+" "+SQL+" "+JavaLibrary+" "+Spring+" "+StudentId);
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement ps2 = connection.prepareStatement(
					"update subjectinfo set `java`=?, `CoreJava`=?, `WebTechnology`=?, `SQLMarks`=?, `JavaLibrary`=?, `Spring`=? where `StudentId`=?");
			ps2.setInt(1, java);
			ps2.setInt(2, CoreJava);
			ps2.setInt(3, WebTechnology);
			ps2.setInt(4, SQL);
			ps2.setInt(5, JavaLibrary);
			ps2.setInt(6, Spring);
			ps2.setInt(7, StudentId);
			int result2 = ps2.executeUpdate();
			System.out.println("admin  "+result2);
			if (result2 > 0) {
				return result2;
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return -1;
	}

	@Override
	public void allStudentDetail() {
		
		
	}

	@Override
	public int insertStudentMarks(SubjectsInfo s,int StudentId) {
		
		try {
			int java=s.getJava();
			int CoreJava=s.getCoreJava();
			int WebTechnology=s.getWebTechnology();
			int SQL=s.getSQL();
			int JavaLibrary=s.getJavaLibrary();
			int Spring =s.getSpring();
			
			Connection connection=DriverManager.getConnection(url);
			PreparedStatement ps = connection.prepareStatement(
					"INSERT INTO `subjectinfo` (`java`, `CoreJava`, `WebTechnology`, `SQLMarks`, `JavaLibrary`, `Spring`, `StudentId`) VALUES (?,?,?,?,?,?,?)");
			ps.setInt(1, java);
			ps.setInt(2, CoreJava);
			ps.setInt(3, WebTechnology);
			ps.setInt(4, SQL);
			ps.setInt(5, JavaLibrary);
			ps.setInt(6, Spring);
			ps.setInt(7, StudentId);
			int result = ps.executeUpdate();
			if (result > 0) {
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	return -1;
	}

	@Override
	public void deleteStudentDetail() {
	
		
	}

}

