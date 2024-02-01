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

import com.jsp.student.DataAccessObjectDAO.AdminDAO;
import com.jsp.student.DataAccessObjectDAO.AdminDAOImplimentation;

@WebServlet("/Login")
public class AdminLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		AdminDAO dao = new AdminDAOImplimentation();
		boolean result = dao.adminLogin(email, password);
		PrintWriter writer = res.getWriter();
		HttpSession session = req.getSession();

		res.setContentType("text/html");
		if (result) {
			RequestDispatcher rd = req.getRequestDispatcher("AllStudentDetail.jsp");
			rd.include(req, res);

		} else {
			session.setMaxInactiveInterval(10);
			session.setAttribute("msg", "Invalid Input");
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.include(req, res);
		}

	}

}
