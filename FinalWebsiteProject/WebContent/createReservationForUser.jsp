<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	<form action = "customerRepAddReservation.jsp" method = "POST" style="display:inline-block;">
		Username: <input type = "text" name = "username" required/> <br/>		
		Unique Number: <input type = "text" name = "uniqueNum" required/> <br/>
		Seat Number: <input type = "text" name = "seatNum" required/> <br/>
	    Flight ID: <input type = "text" name = "departureAirport" required/> <br/>
	    Departure Airport: <input type = "text" name = "departureAirport" required/> <br/>
	    Destination Airport: <input type = "text" name = "destinationTime" required/> <br/>
	    Price: <input type = "text" name = "price" required/> <br/>
	    Cancellation Fee: <input type = "text" name = "cancellationFee" required/> <br/>
	    Airline ID: <input type = "text" name = "airlineID" required/> <br/>
	    Class Type: <input type = "text" name = "classType" required/> <br/>
	    Flight Date: <input type = "text" name = "flightDate" required/> <br/>
		<input type = "submit" value = "Create"/>
	</form>
</body>
</html>