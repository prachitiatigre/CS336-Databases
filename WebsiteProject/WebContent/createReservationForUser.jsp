<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Enter Flight Info </title>
</head>
<body>
	<form action = "customerRepAddReservation.jsp" method = "POST" style="display:inline-block;">
		Username: <input type = "text" name = "username" required/> <br/>		
		Seat Number: <input type = "text" name = "seatNum" required/> <br/>
	    Flight ID: <input type = "text" name = "flightID" required/> <br/>
		<input type = "submit" value = "Create"/>
	</form>
</body>
</html>