package com.jsp.student.model;

import java.sql.Date;

public class StudentInfo {
	private int studentId;
	private  String studentName;
	private  String studentMobileNumber;
	private  String studentEmailId;
	private  String studentPassword;
	private  String studentCource;
	private  String studentGender;
	private  Date studentDateOfBirth;
	private  Date studentJoiningDate;
	
	public StudentInfo() {
		
	}
	public StudentInfo(int studentId, String studentName, String studentMobileNumber, String studentEmailId,
			String studentPassword, String studentCource, String studentGender, Date studentDateOfBirth,
			Date studentJoiningDate) {
		this.studentId = studentId;
		this.studentName = studentName;
		this.studentMobileNumber = studentMobileNumber;
		this.studentEmailId = studentEmailId;
		this.studentPassword = studentPassword;
		this.studentCource = studentCource;
		this.studentGender = studentGender;
		this.studentDateOfBirth = studentDateOfBirth;
		this.studentJoiningDate = studentJoiningDate;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentMobileNumber() {
		return studentMobileNumber;
	}
	public void setStudentMobileNumber(String studentMobileNumber) {
		this.studentMobileNumber = studentMobileNumber;
	}
	public String getStudentEmailId() {
		return studentEmailId;
	}
	public void setStudentEmailId(String studentEmailId) {
		this.studentEmailId = studentEmailId;
	}
	public String getStudentPassword() {
		return studentPassword;
	}
	public void setStudentPassword(String studentPassword) {
		this.studentPassword = studentPassword;
	}
	public String getStudentCource() {
		return studentCource;
	}
	public void setStudentCource(String studentCource) {
		this.studentCource = studentCource;
	}
	public String getStudentGender() {
		return studentGender;
	}
	public void setStudentGender(String studentGender) {
		this.studentGender = studentGender;
	}
	public Date getStudentDateOfBirth() {
		return studentDateOfBirth;
	}
	public void setStudentDateOfBirth(Date studentDateOfBirth) {
		this.studentDateOfBirth = studentDateOfBirth;
	}
	public Date getStudentJoiningDate() {
		return studentJoiningDate;
	}
	public void setStudentJoiningDate(Date studentJoiningDate) {
		this.studentJoiningDate = studentJoiningDate;
	}
	@Override
	public String toString() {
		return "StudentInfo [studentId=" + studentId + ", studentName=" + studentName + ", studentMobileNumber="
				+ studentMobileNumber + ", studentEmailId=" + studentEmailId + ", studentPassword=" + studentPassword
				+ ", studentCource=" + studentCource + ", studentGender=" + studentGender + ", studentDateOfBirth="
				+ studentDateOfBirth + ", studentJoiningDate=" + studentJoiningDate + "]\n";
	}
	
	
}

