package com.jsp.student.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

import com.jsp.student.DataAccessObjectDAO.StudentDAO;
import com.jsp.student.DataAccessObjectDAO.StudentDAOImplimentation;
import com.jsp.student.model.StudentInfo;

@WebServlet("/Student")
public class StudentRegestration extends GenericServlet {

	//StudentInfo html file
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		StudentInfo s = new StudentInfo();
		s.setStudentName(req.getParameter("name"));
		s.setStudentMobileNumber(req.getParameter("mobile"));
		s.setStudentEmailId(req.getParameter("emailId"));
		s.setStudentPassword(req.getParameter("password"));
		s.setStudentCource(req.getParameter("cource"));
		s.setStudentGender(req.getParameter("gender"));

		Date dob = Date.valueOf(req.getParameter("dob"));
		Date joinDate = Date.valueOf(req.getParameter("joinDate"));
		s.setStudentDateOfBirth(dob);
		s.setStudentJoiningDate(joinDate);

//		System.out.println(s);
		
		StudentDAO dao=new StudentDAOImplimentation();
		int result= dao.studentRegistration(s);
		PrintWriter writer=res.getWriter();
		res.setContentType("text/html");
		
		if (result>0) {
			RequestDispatcher rd=req.getRequestDispatcher("Successfull.jsp");
			rd.include(req, res);
		} else {
			RequestDispatcher rd=req.getRequestDispatcher("StudentInfo.html");
			rd.include(req, res);
			writer.println(" <h1 style='color:red; position:absolute; top:1vw; left:42%;'>Duplicate Detail..!</h1>");
		}


	}

}

