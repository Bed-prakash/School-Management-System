package com.jsp.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.student.DataAccessObjectDAO.AdminDAO;
import com.jsp.student.DataAccessObjectDAO.AdminDAOImplimentation;
import com.jsp.student.model.SubjectsInfo;

@WebServlet("/marksUrl")
public class AdminStudentMarksUpdate extends HttpServlet {
	 private final AdminDAO admin=new AdminDAOImplimentation();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		HttpSession session = request.getSession();

		String idStr = request.getParameter("addid");
		int id = Integer.parseInt(idStr);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/schoolmanagementsystem?user=root&password=12345");

			SubjectsInfo s=new SubjectsInfo();
			String javaStr = request.getParameter("java");
			int java = Integer.parseInt(javaStr);
			
			String coreJavaStr = request.getParameter("coreJava");
			int coreJava = Integer.parseInt(coreJavaStr);
			
			String WebTechnologyStr = request.getParameter("WebTechnology");
			int WebTechnology = Integer.parseInt(WebTechnologyStr);
			
			String JavaLibraryStr = request.getParameter("JavaLibrary");
			int JavaLibrary = Integer.parseInt(JavaLibraryStr);
			
			String SQLStr = request.getParameter("SQL");
			int SQL = Integer.parseInt(SQLStr);
			
			String SpringStr = request.getParameter("Spring");
			int Spring = Integer.parseInt(SpringStr);
			
			if (java >= 0 && java <= 100 && coreJava >= 0 && coreJava <= 100 && WebTechnology >= 0
					&& WebTechnology <= 100 && JavaLibrary >= 0 && JavaLibrary <= 100 && SQL >= 0 && SQL <= 100
					&& Spring >= 0 && Spring <= 100) {
				s.setJava(java);
				s.setWebTechnology(WebTechnology);
				s.setCoreJava(coreJava); 
				s.setJavaLibrary(JavaLibrary);
				s.setSQL(SQL);
				s.setSpring(Spring);
				
				PreparedStatement ps1 = connection.prepareStatement("select* from subjectinfo where StudentId=?");
				ps1.setInt(1, id);
				ResultSet res = ps1.executeQuery();
				
				if (res.next()) {

					int result2= admin.studentMarksUpdateion(s,id);
					System.out.println(result2);
					if (result2 > 0) {
						RequestDispatcher rd = request.getRequestDispatcher("Successfull.jsp");
						rd.forward(request, response);
					} else {
						session.setAttribute("error", "Invalid Marks...!");
						RequestDispatcher rd = request.getRequestDispatcher("AdminAccess.jsp");
						rd.include(request, response);
						writer.println(
								"<h1 style='position: fixed; justify-content: center; font-size: 1.7vw; left: 45%; bottom: 4vw; color: red;'>Invalid Marks...!</h1>");
						
					}
				} else {
					int result= admin.insertStudentMarks(s,id);
					if (result > 0) {
						session.setAttribute("error", "Data Inserted  Successfully...!");
						RequestDispatcher rd = request.getRequestDispatcher("Successfull.jsp");
						rd.forward(request, response);

					} else {
						RequestDispatcher rd = request.getRequestDispatcher("AdminAccess.jsp");
						rd.include(request, response);
						writer.println(
								"<h1 style='position: fixed; justify-content: center; font-size: 1.7vw; left: 45%; bottom: 4vw; color: red;'>Invalid Input...!</h1>");
					}
				}
			} else {
				session.setAttribute("error", "Invalid Update Marks...!");
				RequestDispatcher rd = request.getRequestDispatcher("Successfull.jsp");
				rd.forward(request, response);
				session.setMaxInactiveInterval(5);	
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error", "Student Marks is Already Updated...!");
			RequestDispatcher rd = request.getRequestDispatcher("Successfull.jsp");
			rd.forward(request, response);
			session.setMaxInactiveInterval(5);	
		}

	}
}
