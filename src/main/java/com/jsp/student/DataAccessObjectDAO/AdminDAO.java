package com.jsp.student.DataAccessObjectDAO;

import com.jsp.student.model.SubjectsInfo;

public interface AdminDAO {
	boolean adminLogin(String emailId, String password);

	int studentMarksUpdateion(SubjectsInfo s,int id);

	void allStudentDetail();

	int insertStudentMarks(SubjectsInfo s, int id);

	void deleteStudentDetail();

}
