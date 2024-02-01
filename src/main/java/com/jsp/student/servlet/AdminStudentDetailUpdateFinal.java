package com.jsp.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/StudentDetailUpdateFinal")
//connected with AdminByStudentDetailUpdate jsp file 
public class AdminStudentDetailUpdateFinal extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		
		String id1=request.getParameter("id");
		int id=Integer.parseInt(id1);
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String cource = request.getParameter("cource");
		String dob = request.getParameter("dob");
		Date dateOfBirth = Date.valueOf(dob);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/schoolmanagementsystem?user=root&password=12345");
			PreparedStatement ps = connection.prepareStatement(
					"update studentinfo set StudentName=?, StudentMobileNumber=?,StudentEmailId=? , StudentCource=?,StudentDateOfBirth=? where StudentId=? ");
			ps.setString(1, name);
			ps.setString(2, mobile);
			ps.setString(3, email);
			ps.setString(4, cource);
			ps.setDate(5, dateOfBirth);
			ps.setInt(6, id);
			int res = ps.executeUpdate();
			if (res > 0) {
				RequestDispatcher rd = request.getRequestDispatcher("Successfull.jsp");
				rd.forward(request, response);
			} else {
				writer.print("<h1 style='color: green; font-size: 3vw;'>Invalid Input</h1>");

			}

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
			writer.print(
					"<h1 style='position: fixed; font-size: 1.7vw; left: 37%; bottom: 4vw; color: green; font-size: 3vw;'>Invalid Detail With Exception</h1>");
		}
	}
}