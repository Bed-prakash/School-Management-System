<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	width: 100%;
	height: 100vh;
	display: flex;
	justify-content: space-evenly;
	flex-direction: column;
	align-items: center;

}

table {
	width: 98%;
	height: 10vw;
	border-collapse: collapse;
	background-color: #fff;
}

th, td {
	border: 1px solid black;
	font-size: 2.2vw
}

td {
	padding-left: 2vw;
	font-size: 2vw;
}
th{
	background-color: bisque;
}

a {
	width: 20vw;
	height: 5vw;
	border: 1px solid black;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 5px 5px 5px black;
	display: flex;
	justify-content: center;
	align-items: center;
	text-decoration: none;
	font-size: 2vw;
	transition: all 0.5s;
}

a:hover {
	transform: scale(1.2);
	background-color: rgba(16, 209, 230, 0.848);
}
</style>
</head>
<body>
	<%
	response.setContentType("text/html");

	int id = (int) session.getAttribute("id");

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/schoolmanagementsystem?user=root&password=12345");
	PreparedStatement ps = connection.prepareStatement("select* from subjectinfo  where StudentId=?");
	ps.setInt(1, id);
	ResultSet result = ps.executeQuery();
	if (result.next()) {
		
	PreparedStatement ps1 = connection.prepareStatement("select* from studentinfo where StudentId=?");
	ps1.setInt(1, id);
	ResultSet result1 = ps1.executeQuery();
	if (result1.next()) {
	%>
	<table>
		<tr>
			<th><%="Student Name"%></th>
			<th><%="Student Mobile No"%></th>
			<th><%="Student Email Id"%></th>
			<th><%="Student DOB"%></th>
			<th><%="Student DOJ"%></th>
		</tr>
		<tr>
			<td><center><%=result1.getString("StudentName")%></center></td>
			<td><center><%=result1.getString("StudentMobileNumber")%></center></td>
			<td><center><%=result1.getString("StudentEmailId")%></center></td>
			<td><center><%=result1.getString("StudentDateOfBirth")%></center></td>
			<td><center><%=result1.getString("StudentJoiningDate")%></center></td>
		</tr>
	</table>
	<table>
		<tr>
			<th><%="java"%></th>
			<th><%="CoreJava"%></th>
			<th><%="Web Technology"%></th>
			<th><%="SQL Marks"%></th>
			<th><%="Java Library"%></th>
			<th><%="Spring"%></th>
		</tr>
		<tr>
			<td><center><%=result.getInt("java")%></center></td>
			<td><center><%=result.getInt("CoreJava")%></center></td>
			<td><center><%=result.getInt("WebTechnology")%></center></td>
			<td><center><%=result.getInt("SQLMarks")%></center></td>
			<td><center><%=result.getInt("JavaLibrary")%></center></td>
			<td><center><%=result.getInt("Spring")%></center></td>
		</tr>
	</table>
	<a href="./index.jsp">Home</a>
	<%
	} else {
		RequestDispatcher rd = request.getRequestDispatcher("StudentButtonPage.jsp");
		rd.include(request, response);
		session.setAttribute("error", "Data is not avelable");
	}
	} else {
	RequestDispatcher rd = request.getRequestDispatcher("StudentButtonPage.jsp");
	rd.include(request, response);
	session.setAttribute("error", "Data is not avelable");
	}
	%>

</body>
</html>