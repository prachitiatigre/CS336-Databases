<!--  Prachiti Atigre -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
</head>

<body>
	
	<form action = "makeLogin.jsp" method = "POST">
       
       Enter your First Name: <input type = "text" name = "firstname" required/> <br/>
       Enter your Last Name: <input type = "text" name = "lastname" required/> <br/>
       Enter A Username: <input type = "text" name = "username" required/> <br/>
       Enter A Password: <input type = "password" name = "password"required/> <br/>
       
       <input type = "radio" name = "role" value = "customer" required> Customer
       <input type = "submit" value = "Submit"/>
     
     </form>
     
</body>
</html>