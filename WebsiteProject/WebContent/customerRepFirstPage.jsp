<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<form method = "post" action = "handleCustomerRepChoice.jsp">
	
		  <input type = "radio" name = "command" value = "makeFlightForUser" required/> Make Flight Reservation for User
		  <br>
		  <input type = "radio" name = "command" value = "editReservation" required/> Edit Flight Reservation for Customer
		  <br>
		  <input type = "radio" name = "command" value = "replyToQuestions" required/> Reply to User's Questions
		  <br>
		  <input type = "radio" name = "command" value = "aircraftsAirportsFlights" required/> Add, Edit, or Delete Information for Aircrafts, Airports, and Flights
		  <br>
		  <input type = "radio" name = "command" value = "waitingList" required/> Waiting List
		  <br>
		  <input type = "radio" name = "command" value = "flightsForAirport" required/> Flights for a Given Airport
		  <br>
		  <input type = "submit" value = "Submit"/>
	</form>
	<a href = "logout.jsp"> <button> Logout </button> </a>
    

</body>
</html>