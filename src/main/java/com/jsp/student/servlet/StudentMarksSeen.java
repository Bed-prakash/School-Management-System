package com.jsp.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StudentMarksSeen extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		HttpSession session = request.getSession();

		int id = (int) session.getAttribute("id");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/schoolmanagementsystem?user=root&password=12345");
			PreparedStatement ps = connection.prepareStatement(
					"select* from studentinfo  where StudentId=?");
			ps.setInt(1, id);
			ResultSet result=ps.executeQuery();
			if (result.next()) {
			
				RequestDispatcher rd = request.getRequestDispatcher("Student1OnlyDetail.jsp");
				rd.include(request, response);
			
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("StudentButtonPage.jsp");
				rd.include(request, response);
				session.setAttribute("error", "Incorrect Value");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
