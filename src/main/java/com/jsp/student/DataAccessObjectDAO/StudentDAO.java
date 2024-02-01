package com.jsp.student.DataAccessObjectDAO;

import com.jsp.student.model.StudentInfo;

public interface StudentDAO {
	int studentRegistration(StudentInfo s);

	void studentPasswordUpdation(String emailId);

	int studentLogin(String emailId,String password);

	void deleteStudentDetail(String mobileNumber);

}
