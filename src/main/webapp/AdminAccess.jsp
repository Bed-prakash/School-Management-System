<%@page import="java.sql.Statement"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.io.PrintWriter"%>
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
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
	transition: all 0.5s;
}

body {
	
	display: flex;
	justify-content: space-evenly;
	flex-direction: column;
	overflow-y: scroll;
	overflow-x: scroll;
}
#table1Div{
width: 200%;
height: 100vh;
background-color: rgba(0, 0, 0, 0.223);
display: none;
justify-content: center;
align-items: center;
position: absolute;
top: 0px;
left: 0px;
}
#table1 {
	width:200%;
	border: 1px solid black;
	display:flex;
	margin-top:0vw;
	margin-right:2vw;
	background-color: white;
	border-collapse: collapse;
}
#cutTable{
	width: 4vw;
	height: 4vw;
	background-color:red;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.5vw;
	position: absolute;
	top:2vw;
	right: 2vw;
}

th,td {
	border: 1px solid black;
	width: 40vw;
	height: 5vw;
	font-size: 1.5vw
}

#form1 {
	width: 45vw;
	height: 5vw;
	background-color: white;
	margin-top: 3vw;
	margin-left:30%;
	/* background-color: rgba(0, 0, 0, 0.286); */
	border: 1px solid gray;
	border-radius: 5px;
	display: flex;
	justify-content: space-evenly;
	flex-direction: row;
	align-items: center;
	box-shadow: 2px 2px 5px black;
}

input {
	width: 55%;
	height: 2.3vw;
	border: 1px solid black;
	border-radius: 5px;
	font-size: 1.1vw;
	box-shadow: 5px 5px 5px black;
}

#button {
	width: 7vw;
	height: 2.5vw;
	font-size: 1.33vw;
	background-color: #fff;
}

#button:hover {
	background-color: rgba(0, 0, 0, 0.089);
	transform: scale(1.1);
}

.td, .th {
	padding: 0px;
	margin: 0px;
	font-size: 1.5vw;
	width: 11vw;
	border: 2px solid black;
	height: 3.5vw;
}

th {
	font-style: italic;
}

table {
	margin-left:2vw;
	border-collapse: collapse;
	background-color: white;
}

.div, a {
	width: 8vw;
	height: 1.9vw;
	text-decoration: none;
	font-size: 1.1vw;
	background-color: white;
	color: black;
	font-weight: bold;
	border: 1px solid black;
	border-radius: 5px;
	box-shadow: 4px 4px 1px black;
	border: 1px solid gainsboro;
	justify-content: center;
	display: flex;
	align-items: center;
}

.but {
	height: 2vw;
	font-family: normal;
}

.div:hover, a:hover {
	transform: scale(1.1);
	background-color: rgba(0, 0, 0, 0.177);
}

td {
	padding-left: 1vw;
}

.Update {
	width: 40vw;
	display: flex;
	height:3.5vw;
	font-size:1.7vw;
	border:1px solid black;
	justify-content: space-evenly;
	align-items: center;
	padding: 5vwpx;
}
.Update1{
	width: 39vw;
}
.Update2{
height: 6vw;
}

h1 {
	color: red;
}

#updateDiv, #updateDetailDiv {
	width: 100%;
	height: 98vh;
	background-color: white;
	z-index: 1;
	position: fixed;
	top: 0px;
	left: 0px;
	display: none;
	justify-content: center;
	align-items: center;
	background-color: rgba(0, 0, 0, 0.639);
	align-items: center;
	animation: MarksBox 1s;
}

@
keyframes  MarksBox {from { transform:scale(0);
	
}

to {
	transform: scale(1);
}

}
#updateDiv:hover {
	transform: scale(1);
}

#updateDetailDiv {
	display: flex;
}

.form2, .form4 {
	width: 30%;
	height: 90%;
	background-color: white;
	padding-bottom: 2vw;
	border-radius: 10px;
	background-color: white;
	border: 1px solid black;
	flex-direction: column;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
}

.form2 {
	height: 93%;
}

.divInput {
	width: 80%;
	padding-left: 5vw;
	/* background-color: bisque; */
	height: 12%;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
}

.buttonInput {
	margin-top: 2vw;
	width: 60%;
	height: 2.5vw;
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
	align-items: center;
}

label {
	font-size: 1.4vw;
	letter-spacing: 0.1vw;
}

.label {
	font-size: 1.5vw;
}

.input {
	width: 70%;
	height: 2.5vw;
	padding-left: 2vw;
	font-size: 1vw;
	border-radius: 5px;
	box-shadow: 3px 3px 3px solid black;
}

.input:hover {
	background-color: rgba(0, 0, 0, 0.10);
}

.in {
	padding-left: 1.5vw;
}

.submit {
	width: 6vw;
	height: 2.5vw;
	background-color: white;
	border: 1px solid black;
	box-shadow: 5px 5px 5px black;
	border-radius: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.5vw;
}

.submit:hover {
	background-color: rgba(0, 0, 0, 0.3);
	transform: scale(1.1);
}

.cut {
	font-size: 3.5vw;
	width: 3.5vw;
	height: 3vw;
	margin-left: 85%;
	margin-top: 1%;
	float: right;
	background-color: red;
	display: flex;
	justify-content: center;
	align-items: center;
}

#cut:hover {
	transform: scale(1.1);
}
</style>
<!--  <script src="./AdminAccess.js" defer></script>-->
<script type="text/javascript">
var num2=true;
function  openSeeDetail(){
	
	if (num2) {
		document.getElementById("table1Div").style.display="flex";
		num2=false;
	} else {
		document.getElementById("table1Div").style.display="none";
		num2=true;
	}
	
	
}

var num1 = true;	
function open1(id2) {
	

	if (num1) {
		document.getElementById("updateDiv").style.display = "flex";
		document.getElementById("stuId").value=id2;
		num1 = false;
	} else {
		document.getElementById("updateDiv").style.display = "none";
		document.getElementById("stuId").value=id2;
		num1 = true;
	}
}
var number = true;
function openUpdate() {
	console.log(number + "  number");
	
	if (number) {
		number = false;
		console.log(number + "  success");
		document.getElementById("updateDetailDiv").style.display = "flex";

	} else {
		number = true;
		document.getElementById("updateDetailDiv").style.display = "none";

	}
	
}


</script>
</head>
<body>
	<form action="AdminAccess.jsp" id="form1">
		<input class="in" type="number"
			placeholder="Search student by mobile number" name="mobileNumber"
			maxlength="10"> <input id="button" type="submit"
			value="Search"> <a href="AdminAccess.jsp" id="button">All
			Detail</a>

	</form>

	<br>
	<br>

	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	PrintWriter writer = response.getWriter();
	response.setContentType("text/html");

	Connection connection = DriverManager
			.getConnection("jdbc:mysql://localhost:3306/schoolmanagementsystem?user=root&password=12345");
	String mobile = request.getParameter("mobileNumber");
	PreparedStatement ps = connection.prepareStatement("select * from studentinfo where StudentMobileNumber=?");
	ps.setString(1, mobile);
	ResultSet result = ps.executeQuery();
	%>
	<%
	if (mobile != null) {
		if (result.next()) {
	%>
	<table>
		<tr>
			<th class="th"><%="Student Name"%></th>
			<th class="th"><%="Student Mo No"%></th>
			<th class="th"><%="Student Email Id"%></th>
			<th class="th"><%="Student DOB"%></th>
			<th class="th"><%="Student DOJ"%></th>
			<th class="Update"><%="Button For Operation"%></th>
		</tr>
		<tr>
			<td class=".td"><%=result.getString("StudentName")%></td>
			<td class=".td"><%=result.getString("StudentMobileNumber")%></td>
			<td class=".td"><%=result.getString("StudentEmailId")%></td>
			<td class=".td"><%=result.getString("StudentDateOfBirth")%></td>
			<td class=".td"><%=result.getString("StudentJoiningDate")%></td>
			<td class="Update Update1 Update2">
				<form action="detailUpdate" method="post">
					<input type="submit" class="div but" value="Update Detail"><input
						value="<%=result.getInt("StudentId")%>" hidden name="id">
				</form>
				<div onclick="open1(<%=result.getInt("StudentId")%>)" class="div">Add
					Marks</div>
				<form action="deleteStudent" method="post">
					<input value="<%=result.getInt("StudentId")%>" hidden name="id">
					<input type="submit"
						onclick="if(!(confirm('!Are you sure You want to delete student detail'))){return false}"
						class="div but" value="Delete">
				</form>
				<form action="AdminAccess.jsp" >
						<input value="<%=result.getInt("StudentId")%>" hidden name="idSee">
						<input type="submit" onclick="openSeeDetail()" class="div but" value="See detail">
					</form>
			</td>
		</tr>
		<%
		} else {
		%>
		<center>
			<h1><%="Invalid Mobile Number"%></h1>
		</center>
		<%
		}
		} else {
		Statement s = connection.createStatement();
		ResultSet res = s.executeQuery("select * from studentinfo");
		if (res.isBeforeFirst()) {
		%>
		<table>
			<tr>
				<th class="th"><%="Student Name"%></th>
				<th class="th"><%="Student Mo No"%></th>
				<th class="th"><%="Student Email Id"%></th>
				<th class="th"><%="Student DOB"%></th>
				<th class="th"><%="Student DOJ"%></th>
				<th class="Update"><%="Button For Operation"%></th>
			</tr>
			<%
			while (res.next()) {
			%>

			<tr>
				<td class="td"><%=res.getString("StudentName")%></td>
				<td class="td"><%=res.getString("StudentMobileNumber")%></td>
				<td class="td"><%=res.getString("StudentEmailId")%></td>
				<td class="td"><%=res.getString("StudentDateOfBirth")%></td>
				<td class="td"><%=res.getString("StudentJoiningDate")%></td>
				<td class="Update Update1">
					<form action="detailUpdate" method="post">
						<input type="submit" class="div but" value="Update Detail"><input
							value="<%=res.getInt("StudentId")%>" hidden name="id">
					</form>
					<div onclick="open1(<%=res.getInt("StudentId")%>)" class="div">Add
						Marks</div>
					<form action="deleteStudent" method="post">
						<input value="<%=res.getInt("StudentId")%>" hidden name="id">
						<input type="submit"
							onclick="if(!(confirm('!Are you sure You want to delete student detail'))){return false}"
							class="div but" value="Delete">
					</form>
					<form action="AdminAccess.jsp" >
						<input value="<%=res.getInt("StudentId")%>" hidden name="idSee">
						<input type="submit" onclick="openSeeDetail()" class="div but" value="See detail">
					</form>
				</td>
			</tr>
			<%
			}
			}
			}
			%>

		</table>
		<%
		String id = (String) session.getAttribute("addid");
		%>
		<div id="updateDiv">
			<form action="marksUrl" method="post" class="form2">
				<div onclick="open1()" class="cut">x</div>
				<center>
					<label class="label">All Subject Mock Reating Updation</label>
					<h1 class="label" style="font-size: 1.2vw; color: red;">Marks
						should between 0 to 100</h1>
				</center>

				<div class="divInput">
					<label for="studentId">Id</label> <input readonly id="stuId"
						class="input" type="text" name="addid">
				</div>

				<div class="divInput">
					<label for="name">Java</label> <input class="input" id="name"
						type="text" placeholder="Enter Java Mock Reating" name="java">

				</div>
				<div class="divInput">
					<label for="number">Core Java</label> <input class="input"
						id="number" type="text" placeholder="Enter Core Java Mock Reating"
						name="coreJava">
				</div>

				<div class="divInput">
					<label for="Cource">Web Technology</label> <input class="input"
						list="cource" id="Cource" type="text"
						placeholder="Enter Web Mock Reating" name="WebTechnology">
				</div>
				<div class="divInput">
					<label for="Gender">Java Library</label> <input class="input"
						id="Gender" type="text"
						placeholder="Enter Java Library Mock Reating" name="JavaLibrary">
				</div>
				<div class="divInput">
					<label for="Birth">SQL</label> <input class="input" id="Birth"
						type="text" placeholder="Enter SQL Mock Reating" name="SQL">
				</div>
				<div class="divInput">
					<label for="Date">Spring</label> <input class="input" id="Date"
						type="text" placeholder="Enter Spring Mock Reating" name="Spring">
				</div>
				<div class="buttonInput">
					<input class="submit" type="submit" value="Login">
					<div class="submit" onclick="clear()">Cancle</div>
				</div>
			</form>
		</div>
		<%
		String studentIdSee=request.getParameter("idSee");
		if(studentIdSee!=null){
		int id1=Integer.parseInt(studentIdSee);
		writer.print(id1);				
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/schoolmanagementsystem?user=root&password=12345");
		PreparedStatement ps1 = connection.prepareStatement("select * from studentinfo s1 ,subjectinfo s2 where s1.StudentId=s2.StudentId and s2.StudentId=?");
		ps1.setInt(1, id1);
		ResultSet res1 = ps1.executeQuery();
		if(res1.next()){
		%>
		<div  id="table1Div">
		<table id="table1">
			<div onclick="openSeeDetail()"  id="cutTable">X</div>
			<tr>
				<th><%="Student Id"%></th>
				<th><%="Student Name"%></th>
				<th><%="Student Mobile No"%></th>
				<th><%="Student Email Id"%></th>
				<th><%="Student DOB"%></th>
				<th><%="Student DOJ"%></th>
				<th><%="java"%></th>
				<th><%="CoreJava"%></th>
				<th><%="Web Technology"%></th>
				<th><%="SQL"%></th>
				<th><%="Java Library"%></th>
				<th><%="Spring"%></th>
			</tr>
			<tr>
				<th><%=res1.getInt("StudentId")%></th>
				<th><%=res1.getString("StudentName")%></th>
				<th><%=res1.getString("StudentMobileNumber")%></th>
				<th><%=res1.getString("StudentEmailId")%></th>
				<th><%=res1.getDate("StudentDateOfBirth")%></th>
				<th><%=res1.getDate("StudentJoiningDate")%></th>
				<th><%=res1.getInt("java")%></th>
				<th><%=res1.getInt("CoreJava")%></th>
				<th><%=res1.getInt("WebTechnology")%></th>
				<th><%=res1.getInt("SQLMarks")%></th>
				<th><%=res1.getInt("JavaLibrary")%></th>
				<th><%=res1.getInt("Spring")%></th>
			</tr>
		</table>
		</div>
	<%} }%>
</body>
</html>