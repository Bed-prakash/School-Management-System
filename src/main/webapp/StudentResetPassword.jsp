<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
<link rel="stylesheet" href="./StudentPasswordUpdate.css">
<script src="./index.js" defer></script>
<style>
    body{
        background-color: rgba(0, 0, 0, 0.277);
    }
    form{
        background-color: #fff;
    }
</style>

</head>
<body>
<div id="studentContainer">
    <form action="ForgetPssword" method="post" id="form2">
        <label id="label">Students Login</label>
        <div class="divInput">
            <label for="">Email Id</label>
            <input id="button1" class="input in2" placeholder="Enter Email Id" type="email" name="email">
        </div>
        <div class="divInput">
            <label for="">Password</label>
            <input id="button2" class="input in2" placeholder="Enter Password" type="password" name="pass">
        </div>
        <div class="divInput">
            <label for="">New Password</label>
            <input id="button3"  placeholder="Enter Password" type="password" name="Newpass">
        </div>
        <div class="divInput">
            <label for="">Confirm New Password</label>
            <input id="button4"  placeholder="Enter Password" type="password" name="CNewpass">
        </div>
          <div class="buttonInput">
            <input class="submit" type="submit" value="Login">
            <div class="submit" onclick="clear4()" >Cancel</div>
        </div>     
        <h1 style="color: red; font-size: 1.7vw;"><%if(((String)session.getAttribute("error"))!=null){ %><%=((String)session.getAttribute("error")) %> <%}else{%><%=""%><%}%></h1>
     </form>
</div>
</body>
</html>