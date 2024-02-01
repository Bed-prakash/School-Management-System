package com.jsp.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
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

import com.jsp.student.model.StudentInfo;

@WebServlet("/detailUpdate")
public class AdminStudentDetailUpdate extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter writer = resp.getWriter();		
		resp.setContentType("text/html");
		HttpSession session = req.getSession();
		
		String idString = req.getParameter("id");
		int id=Integer.parseInt(idString);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/schoolmanagementsystem?user=root&password=12345");
			PreparedStatement ps = connection.prepareStatement("select * from studentinfo where StudentId=?");
			ps.setInt(1, id);
			ResultSet result3 = ps.executeQuery();
//			writer.println("resultset : " + result3.next() + " end");
			if (result3.next()) {
				writer.println("<h1 style='color:red'>Valid Detail</h1>");
				session.setAttribute("id",id);
				session.setAttribute("name", result3.getString("StudentName"));
				session.setAttribute("mobile", result3.getString("StudentMobileNumber"));
				session.setAttribute("email", result3.getString("StudentEmailId"));
				session.setAttribute("dob", result3.getString("StudentDateOfBirth"));
				session.setAttribute("cource", result3.getString("StudentCource"));
				
				RequestDispatcher rd = req.getRequestDispatcher("AdminByStudentDetailUpdate.jsp");
				rd.forward(req, resp);
			}else {
				RequestDispatcher rd = req.getRequestDispatcher("AdminAccess.jsp");
				rd.include(req, resp);
				writer.println("<h1 style='color:red'>Invalid Detail</h1>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
