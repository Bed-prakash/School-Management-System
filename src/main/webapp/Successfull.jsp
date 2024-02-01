
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
#bdy {
	background-color: rgba(0, 0, 0, 0.17);
	width: 100%;
	height: 98vh;
	overflow: hidden;
	display: flex;
	justify-content: space-evenly;
	flex-direction: column;
	align-items: center;
	background-color: rgba(0, 128, 0, 0.53);
}

h1 {
	font-size: 5vw;
	color: pink;
}

a {
	width: 30vw;
	height: 5vw;
	display: flex;
	justify-content: center;
	align-items: center;
	text-decoration: none;
	font-size: 2vw;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 5px 5px 5px black;
	border: 10px;
	transition: all 0.2s;
}

a:hover {
	background-color: rgb(9, 223, 230);
	transform: scale(1.2);
}
</style>
</head>
<body>
	<div id="bdy">
		<h1 <% 
		if(session.getAttribute("error")!=null)
				{ %>style="color:red; font-size: 3.5vw;" <%} %> >
			<% if(session.getAttribute("error")!=null){ %><%=session.getAttribute("error") %>
			<%}else{%> Updated Successfully...!<%} %></h1>
		<a href="./index.jsp">Click Me For Closing This Page</a>
		<%session.removeAttribute("error");%>
	</div>

<!-- 
	try {
		Thread thread=new Thread();
		Thread.sleep(20000);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	
	} catch (Exception e) {
		e.printStackTrace();
	}
	--> 
</body>
</html>