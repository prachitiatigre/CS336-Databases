<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	<form method = "post" action = "determineCustomerOrRep.jsp">
		  Would you like to modify information for customers or customer representatives? <br/>
		  <input type = "radio" name = "command" value = "customer" required/> Customer
		  <br>
		  <input type = "radio" name = "command" value = "customerRepresentative" required/> Customer Representative
		  <br>
		  <input type = "submit" value = "Submit"/>
	
	</form>
</body>
</html>