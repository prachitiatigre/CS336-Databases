<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	<form method = "post" action = "determineAircraftAirportFlight.jsp">
		  
		  Would you like to modify information for aircrafts, airports, or flights?<br/>
		  <input type = "radio" name = "command" value = "aircrafts" required/> Aircrafts
		  <br>
		  <input type = "radio" name = "command" value = "airports" required/> Airports
		  <br>
		  <input type = "radio" name = "command" value = "flights" required/> Flights
		  <br>
		  <input type = "submit" value = "Submit"/>
	</form>
</body>
</html>
