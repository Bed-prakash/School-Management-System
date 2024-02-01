package com.jsp.student.model;


public class SubjectsInfo {
	private int java; 
	public SubjectsInfo(int java, int coreJava, int webTechnology, int sQL, int javaLibrary, int spring,
			int studentId) {
		this.java = java;
		this.CoreJava = coreJava;
		this.WebTechnology = webTechnology;
		this.SQL = sQL;
		this.JavaLibrary = javaLibrary;
		this.Spring = spring;
		this.StudentId = studentId;
	}

	public int getJava() {
		return java;
	}

	public void setJava(int java) {
		this.java = java;
	}

	public int getCoreJava() {
		return CoreJava;
	}

	public void setCoreJava(int coreJava) {
		CoreJava = coreJava;
	}

	public int getWebTechnology() {
		return WebTechnology;
	}

	public void setWebTechnology(int webTechnology) {
		WebTechnology = webTechnology;
	}

	public int getSQL() {
		return SQL;
	}

	public void setSQL(int sQL) {
		SQL = sQL;
	}

	public int getJavaLibrary() {
		return JavaLibrary;
	}

	public void setJavaLibrary(int javaLibrary) {
		JavaLibrary = javaLibrary;
	}

	public int getSpring() {
		return Spring;
	}

	public void setSpring(int spring) {
		Spring = spring;
	}

	public int getStudentId() {
		return StudentId;
	}

	public void setStudentId(int studentId) {
		StudentId = studentId;
	}

	private int CoreJava;
	private int WebTechnology;
	private int SQL;
	private int JavaLibrary;
	private int Spring;
	private int StudentId;
	public SubjectsInfo() {
	
	}
	
	@Override
	public String toString() {
		return "Student [java=" + java + ", CoreJava=" + CoreJava + ", WebTechnology=" + WebTechnology + ", SQL=" + SQL
				+ ", JavaLibrary=" + JavaLibrary + ", Spring=" + Spring + ", StudentId=" + StudentId + "]";
	}
}

