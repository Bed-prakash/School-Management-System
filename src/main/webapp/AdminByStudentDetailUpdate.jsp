<%@page import="java.sql.Date"%>
<%@page import="java.io.PrintWriter"%>
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
  <link rel="stylesheet" href="./StudentPasswordUpdate.css">
   <script src="./StudentInfo.js" defer></script>
   <style>
   		body{
   			width: 100%;
   			height: 100vh;
   			overflow: hidden;
			background-color: rgba(0, 0, 0, 0.2);	
   		}
        form{
            width: 33%;
            height: 40vw;
            display:flex;
            background-color: white;
            flex-direction: column;
            border: 1px solid black;
            justify-content: space-evenly;
            padding-top: 1vw;
            padding-bottom: 2vw;
        }
        .input{
        	padding-left: 1vw;
        }
   </style>
</head>
<body>	
	<!-- StudentDetailUpdateFinal -->
		
	<form action="StudentDetailUpdateFinal" method="post">
        <label id="label">Update Student Data</label>
     	<div class="divInput">
            <label for="name1">Student Id</label>
            <input class="input"  id="name1" type="text" readonly  <%  if(session.getAttribute("id")==null){ %>placeholder="<%="Enter Your Id"%>"<%} else if(session.getAttribute("id")!=null){%> value="<%=session.getAttribute("id") %>" <%}%> name="id">

		</div>
        <div class="divInput">
            <label for="name">Student Name</label>
            <input class="input" id="name" type="text" <% if(session.getAttribute("name")==null){ %> placeholder="<%="Enter Your Name"%>" <%} else if(session.getAttribute("name")!=null){%>value="<%=session.getAttribute("name") %>"<%}%> name="name">
           
        </div>
        <div class="divInput">
            <label for="number">Student mobile Number</label>
            <input class="input" id="number" type="text" <% if(session.getAttribute("mobile")!=null){%>value="<%=session.getAttribute("mobile") %>"<%}else if(session.getAttribute("mobile")==null){ %>placeholder="<%="Enter Your Mobile No"%>"<%}%> name="mobile">
        </div>
        <div class="divInput">
            <label for="number">Student email id</label>
            <input class="input" id="number" type="text" <% if(session.getAttribute("email")!=null){%> value="<%=session.getAttribute("email") %>"<%}else if(session.getAttribute("email")==null){ %>placeholder="<%="Enter Your email Id"%>"<%}%> name="email">
        </div>

        <div class="divInput">
            <label for="Cource">Student Cource</label>
            <input class="input" list="cource" id="Cource" type="text" <% if(session.getAttribute("cource")!=null){%>value="<%=session.getAttribute("cource") %>"<%}else if(session.getAttribute("cource")==null){ %>placeholder="<%="Enter Your Cource"%>"<%}%> name="cource">
            <datalist id="cource">
                <option >Java Full Stack</option>
                <option >Python Full Stack</option>
            </datalist>
        </div>
        <div class="divInput">
            <label for="Birth">Student Date Of Birth</label>
            <input class="input" id="Birth" type="date" <% if(session.getAttribute("dob")!=null){%> value="<%=session.getAttribute("dob") %>"<%}else if(session.getAttribute("dob")==null){ %>placeholder="<%="Enter Your DOB"%>"<%}%> name="dob">
        </div>
        <%session.removeValue("dob") ;
		session.removeValue("cource");
		session.removeValue("email");
		session.removeValue("email");
		session.removeValue("mobile");
		session.removeValue("name");
		session.removeValue("id");
		%>
        <div class="buttonInput">
            <input class="submit" type="submit" value="Update">
            <div class="submit" onclick="clear()" >Cancle</div>
        </div>
    </form>
	
</body>
</html>