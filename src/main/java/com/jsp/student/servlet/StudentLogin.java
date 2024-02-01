package com.jsp.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.student.DataAccessObjectDAO.StudentDAO;
import com.jsp.student.DataAccessObjectDAO.StudentDAOImplimentation;

@WebServlet("/studentLog")
public class StudentLogin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest reqest, HttpServletResponse response) throws ServletException, IOException {
		
		String email= reqest.getParameter("email");
	    String pass= reqest.getParameter("pass");
	    
	    HttpSession session=reqest.getSession();
	    StudentDAO studentDAO=new StudentDAOImplimentation();
	    int result= studentDAO.studentLogin(email, pass);
	    
	    PrintWriter writer=response.getWriter();
	    response.setContentType("text/html");
	    
	    if (result>=0) {
	    	session.setAttribute("id", result);  	
			RequestDispatcher rd=reqest.getRequestDispatcher("StudentButtonPage.jsp");
			rd.forward(reqest, response);

		} else {
			session.setMaxInactiveInterval(10);
			session.setAttribute("studentMsg","Invalid Detai" );
			RequestDispatcher rd=reqest.getRequestDispatcher("index.jsp");
			rd.include(reqest, response);

		}
	}
}

