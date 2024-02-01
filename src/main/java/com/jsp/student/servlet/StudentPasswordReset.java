package com.jsp.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ForgetPssword")
public class StudentPasswordReset extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		
		String email =request.getParameter("email");
		String pass =request.getParameter("pass");
		String Newpass =request.getParameter("Newpass");
		String CNewpass =request.getParameter("CNewpass");
		if (Newpass.equals(CNewpass)) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager
						.getConnection("jdbc:mysql://localhost:3306/schoolmanagementsystem?user=root&password=12345");
				PreparedStatement ps = connection.prepareStatement("update studentinfo set StudentPassword=? where StudentPassword=? and StudentEmailId=?");
				ps.setString(1,Newpass );
				ps.setString(2, pass);
				ps.setString(3, email);
				int result=ps.executeUpdate();
				if (result>0) {
					RequestDispatcher rd=request.getRequestDispatcher("Successfull.jsp");
					rd.forward(request, response);
				} else {
					RequestDispatcher rd=request.getRequestDispatcher("StudentResetPassword.jsp");
					rd.include(request, response);
					session.setAttribute("error","Incorrect Password");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			RequestDispatcher rd=request.getRequestDispatcher("StudentResetPassword.jsp");
			rd.include(request, response);
			session.setAttribute("error","Missmatch New Password");
		}
	}
}
