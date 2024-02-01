<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./index.css">
<script src="./index.js" defer></script>
<style type="text/css">
.a{
	font-size: 1.2vw;
	 font-weight: bold;
	 text-decoration: none;
}
.a:hover{
	color: red;
}
</style>
</head>
<body>
	<div id="TeachersContainer">
		<form action="Login" method="post" id="form1">
			<label>Admin Login</label> <input id="in1" required class="input" name="email"
				placeholder="Enter Email Id" type="email"> <input id="in2"
				class="input" required name="password" placeholder="Enter Password"
				type="password">
			<div class="buttonInput">
				<input class="submit" type="submit" value="Login">
				<div onclick="clear1()" class="submit">Cancle</div>
			</div>

		</form>
	</div>
	<%String msg= (String)session.getAttribute("msg");
     	String studentMsg=(String)session.getAttribute("studentMsg");
  			PrintWriter writer=response.getWriter();
  			if(msg!=null){
  			%>
	<h1 id="error"><%=msg %>..!</h1>
	<%} 
		if(studentMsg!=null){     
     %>
		<h1 id="errorStudent"><%=studentMsg %>..!</h1>
	<%} %>
	<div id="buttonContainer">
		<button id="button" onclick="displayStudents()" class="submit">Students
			Login</button>
		<button id="button" onclick="displayTeacher()" class="submit">Admin
			Login</button>
	</div>
	<div id="studentContainer">
	<!-- Student Login -->
		<form action="studentLog" method="post" id="form2">
			<label>Students Login</label> <input required id="button1" class="input in2"
				placeholder="Enter Email Id" type="email" name="email"> <input
				id="button2" class="input in2" required placeholder="Enter Password"
				type="password" name="pass">
			<div class="buttonInput">
				<input class="submit" type="submit" value="Login">
				<div class="submit" onclick="clear2()">Cancle</div>
			</div>
			<div class="buttonInput">
				<a  class="a" href="./StudentPasswordUpdate.jsp">Forget Password ?</a><a class="a" href="./StudentInfo.html" >New Registretion ?</a>
			</div>
		</form>
	</div>
</body>
</html>