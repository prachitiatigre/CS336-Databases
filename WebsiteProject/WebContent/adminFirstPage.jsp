<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Admin Controls </title>
</head>
<body>
	<form method = "post" action = "determineAdminControl.jsp">
		    
		  <input type = "radio" name = "command" value = "View Customer with Most Revenue" required/> View Customer with Most Revenue
		  <br>
		  <input type = "radio" name = "command" value = "View Sales Reports" required/> View Sales Reports
		  <br>
		  <input type = "radio" name = "command" value = "View Reservations" required/> View Reservations
		  <br>
		  <input type = "radio" name = "command" value = "View Most Active Flights" required/> View Most Active Flights
		  <br>
		  <input type = "radio" name = "command" value = "Add, Edit, Or Delete Information" required/> Add, Edit, Or Delete Information
		  <br>
		  <input type = "submit" value = "Submit"/> 
	</form>
	<a href = "logout.jsp"> <button> Logout </button> </a>
	
</body>
</html>