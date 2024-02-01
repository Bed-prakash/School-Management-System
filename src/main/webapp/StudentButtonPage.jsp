<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Button page</title>
    <style>
        body{
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: rgba(0, 0, 0, 0.25);
           
        }
        div{
            width: 30%;
            height: 60%;
            padding-top:2vw;
            border-radius: 10px;
            background-color: white;
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            flex-direction: column;
        }
        input{
            font-size: 2vw;
            width: 15vw;
            height: 5vw;
            border: 1px solid black;
            margin-bottom: 5vw;
            border-radius: 10px;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: white;
            box-shadow: 5px 5px 5px black;
            transition: all 0.5s;
        }
        input:hover{
            transform: scale(1.1);
            background-color: rgb(8, 225, 221);
        }
    </style>
   
</head>
<body>
     <div>
        <form action="Student1OnlyDetail.jsp">
            <input type="submit" value="See Marks">
        </form>
        <form  action="AdminByStudentDetailUpdate.jsp" method="post">
            <input type="submit" value="Update Detail">
        </form>
      	 <h1 style="color: red; font-size: 1.5vw;"><%if(session.getAttribute("error")!=null){ %> <%=session.getAttribute("error") %> <%}%></h1>
    </div>


</body>
</html>