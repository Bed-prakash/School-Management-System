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
@WebServlet("/deleteStudent")
public class AdminDeleteStudent extends HttpServlet {
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
			PreparedStatement ps = connection.prepareStatement("delete from studentinfo where StudentId=?");
			ps.setInt(1, id);
			int result3=ps.executeUpdate();
			writer.println("resultset : " + result3 + " end");
			if (result3>0) {
				RequestDispatcher rd = req.getRequestDispatcher("Successfull.jsp");
				rd.forward(req, resp);
			}else {
				RequestDispatcher rd = req.getRequestDispatcher("AdminAccesss.jsp");
				rd.include(req, resp);
				writer.println("<h1 style='color:red'>Not Deleted..!</h1>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
