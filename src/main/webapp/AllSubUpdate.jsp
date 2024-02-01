<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./StudentPasswordUpdate.css">
<style>
	.input{
		padding-left: 1.5vw;
	}
</style>
</head>
<body>
<%
int studentId = (int) session.getAttribute("studentId");
%>
	<form action="">
		<label id="label">All Subject Mock Reating Updation</label>

		<div class="divInput">
			<label for="name">Java</label> <input id="name" type="text"
			class="input" placeholder="Enter Java Mock Reating" name="java">

		</div>
		<div class="divInput">
			<label for="number">Core Java</label> <input id="number" type="text"
			class="input" placeholder="Enter Core Java Mock Reating" name="coreJava">
		</div>

		<div class="divInput">
			<label for="Cource">Web Technology</label> <input list="cource"
				id="Cource" type="text"
				class="input" placeholder="Enter Web Technology Mock Reating" name="WebTechnology">
		</div>
		<div class="divInput">
			<label for="Gender">Java Library</label> <input id="Gender"
				type="text" placeholder="Enter Java Library Mock Reating"
				class="input" name="JavaLibrary">

		</div>
		<div class="divInput">
			<label for="Birth">SQL</label> <input id="Birth" type="text"
			class="input" placeholder="Enter SQL Mock Reating" name="SQL">
		</div>
		<div class="divInput">
			<label for="Date">Spring</label> <input id="Date" type="text"
			class="input" placeholder="Enter Spring Mock Reating" name="Spring">
		</div>
		<div class="buttonInput">
			<input class="submit" type="submit" value="Login">
			<div class="submit" onclick="clear()">Cancle</div>
		</div>
	</form>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	PrintWriter writer = response.getWriter();
	response.setContentType("text/html");
	
	

	String javaString = request.getParameter("java");
	int java = Integer.parseInt(javaString);
	String coreJavaString = request.getParameter("coreJava");
	int coreJava = Integer.parseInt(coreJavaString);
	String WebTechnologyString = request.getParameter("WebTechnology");
	int WebTechnology = Integer.parseInt(WebTechnologyString);
	String JavaLibraryString = request.getParameter("JavaLibrary");
	int JavaLibrary = Integer.parseInt(JavaLibraryString);
	String SQLString = request.getParameter("SQL");
	int SQL = Integer.parseInt(SQLString);
	String SpringString = request.getParameter("Spring");
	int Spring = Integer.parseInt(SpringString);

	
	Connection connection = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/schoolmanagementsystem?user=root&password=12345");
	String mobile = request.getParameter("mobileNumber");
	PreparedStatement ps = connection.prepareStatement(
			"update subjectinfo set java=? and CoreJava=? and WebTechnology=? and SQL=? JavaLibrary=? and Spring=? where StudentId=?");
	ps.setInt(1, java);
	ps.setInt(2, coreJava);
	ps.setInt(3, WebTechnology);
	ps.setInt(4, SQL);
	ps.setInt(5, JavaLibrary);
	ps.setInt(6, Spring);
	ps.setInt(7, studentId);
	ResultSet result = ps.executeQuery();
	if (result.next()) {
	%>
	<%="Updated Successfull"%>
	<%
	} else {
	%>
	<%="Invalid Detail"%>
	<%
	}
	%>
</body>
</html>