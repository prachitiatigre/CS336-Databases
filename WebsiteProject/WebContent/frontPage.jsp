<!--  Prachiti Atigre -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
	
	<form method = "post" action = "determineLoginOrRegister.jsp">
		    
		  <input type = "radio" name = "command" value = "login" required/>Login
		  <br>
		  <input type = "radio" name = "command" value = "register" required/>Register
		  <br>
		  <input type = "submit" value = "Submit"/>
	
	</form>	

</body>
</html>