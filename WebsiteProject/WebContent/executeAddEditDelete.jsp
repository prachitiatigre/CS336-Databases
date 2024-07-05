<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ page import ="java.sql.*" %>
	
	<% 
	String optionSelected = (String) session.getAttribute("optionSelected");
	String AEDOption = (String) session.getAttribute("AEDOption");
	
	if(optionSelected.equals("customer")) { %>
		
		<% if(AEDOption.equals("add")) { %>
		
			<form action = "confirmAddEditDeleteCustomer.jsp" method = "POST" style="display:inline-block;">
				First Name: <input type = "text" name = "firstname" required/> <br/>
				Last Name: <input type = "text" name = "lastname" required/> <br/>
				Username: <input type = "text" name = "username" required/> <br/>
			    Password: <input type = "text" name = "password" required/> <br/>
			<input type = "submit" value = "Add"/>
    		</form>
		
		<% }
		else if(AEDOption.equals("edit")) { %>
			
			<form action = "confirmAddEditDeleteCustomer.jsp" method = "POST" style="display:inline-block;">
			    First Name: <input type = "text" name = "firstname" required/> <br/>
				Last Name: <input type = "text" name = "lastname" required/> <br/>
				Username: <input type = "text" name = "username" required/> <br/>
			    Password: <input type = "text" name = "password" required/> <br/>
			<input type = "submit" value = "Edit"/>
			</form>
			
		<% }
		else if(AEDOption.equals("delete")) { %>
			
			<form action = "confirmAddEditDeleteCustomer.jsp" method = "POST" style="display:inline-block;">
				Username: <input type = "text" name = "username" required/> <br/>
				<input type = "submit" value = "Delete"/>
    		</form>
		<% }
	}
	
	if(optionSelected.equals("customerRep")) { %>
	
		<% if(AEDOption.equals("add")) { %>
	
			<form action = "confirmAddEditDeleteCustomer.jsp" method = "POST" style="display:inline-block;">
				First Name: <input type = "text" name = "firstname" required/> <br/>
				Last Name: <input type = "text" name = "lastname" required/> <br/>
				Username: <input type = "text" name = "username" required/> <br/>
	    		Password: <input type = "text" name = "password" required/> <br/>
			<input type = "submit" value = "Add"/>
			</form>
			
		<% }
		else if(AEDOption.equals("edit")) { %>
			
			<form action = "confirmAddEditDeleteCustomer.jsp" method = "POST" style="display:inline-block;">
    			First Name: <input type = "text" name = "firstname" required/> <br/>
				Last Name: <input type = "text" name = "lastname" required/> <br/>
				Username: <input type = "text" name = "username" required/> <br/>
    			Password: <input type = "text" name = "password" required/> <br/>
    		<input type = "submit" value = "Edit"/>
     		</form>
		
		<% }
		else if(AEDOption.equals("delete")) { %>
			
			<form action = "confirmAddEditDeleteCustomer.jsp" method = "POST" style="display:inline-block;">
				Username: <input type = "text" name = "username" required/> <br/>
				<input type = "submit" value = "Delete"/>
			</form>		

		<% }
	}
	
	if(optionSelected.equals("aircraft")) { %>
		
		<% if(AEDOption.equals("add")) { %>
		
			<form action = "confirmAddEditDeleteAircraft.jsp" method = "POST" style="display:inline-block;">
				Aircraft ID: <input type = "text" name = "aircraftID" required/> <br/>
				Number of Seats: <input type = "text" name = "numOfSeats" required/> <br/>
				Operation Days: <input type = "text" name = "operationDays" required/> <br/>
			<input type = "submit" value = "Add"/>
			</form>
		
		<% }
		else if(AEDOption.equals("edit")) { %>
			
			<form action = "confirmAddEditDeleteAircraft.jsp" method = "POST" style="display:inline-block;">
				Aircraft ID: <input type = "text" name = "aircraftID" required/> <br/>
				Number of Seats: <input type = "text" name = "numOfSeats" required/> <br/>
				Operation Days: <input type = "text" name = "operationDays" required/> <br/>
			<input type = "submit" value = "Edit"/>
			</form>
			
		<% }
		else if(AEDOption.equals("delete")) { %>
			<form action = "confirmAddEditDeleteAircraft.jsp" method = "POST" style="display:inline-block;">
				Aircraft ID: <input type = "text" name = "aircraftID" required/> <br/>
				Number of Seats: <input type = "text" name = "numOfSeats" required/> <br/>
				Operation Days: <input type = "text" name = "operationDays" required/> <br/>
			<input type = "submit" value = "Delete"/>
			</form>
		<% }
	}
	else if(optionSelected.equals("airport")) { %>
		
		<% if(AEDOption.equals("add")) { %>
			
			<form action = "confirmAddEditDeleteAirport.jsp" method = "POST" style="display:inline-block;">
				Airport ID: <input type = "text" name = "airportID" required/> <br/>
				Number of Aircrafts: <input type = "text" name = "numOfAircrafts" required/> <br/>
			<input type = "submit" value = "Add"/>
		    </form>
		<% }
		else if(AEDOption.equals("edit")) { %>
		
			<form action = "confirmAddEditDeleteAirport.jsp" method = "POST" style="display:inline-block;">
				Airport ID: <input type = "text" name = "airportID" required/> <br/>
				Number of Aircrafts: <input type = "text" name = "numOfAircrafts" required/> <br/>
			<input type = "submit" value = "Edit"/>
			</form>
			
		<% }
		else if(AEDOption.equals("delete")) { %>
		
			<form action = "confirmAddEditDeleteAirport.jsp" method = "POST" style="display:inline-block;">
				Airport ID: <input type = "text" name = "airportID" required/> <br/>
			<input type = "submit" value = "Delete"/>
		    </form>
		<% }
	}
	else if(optionSelected.equals("flight")) { %>
		
		<% if(AEDOption.equals("add")) { %>
			
			<form action = "confirmAddEditDeleteFlight.jsp" method = "POST" style="display:inline-block;">
				Flight ID: <input type = "text" name = "flightID" required/> <br/>
				Domestic Or International?: <input type = "text" name = "domesticOrInternational" required/> <br/>
		   	 	Departure Airport: <input type = "text" name = "departureAirport" required/> <br/>
			    Destination Airport: <input type = "text" name = "destinationAirport" required/> <br/>
			    Departure Time: <input type = "text" name = "departureTime" required/> <br/>
			    Arrival Time: <input type = "text" name = "arrivalTime" required/> <br/>
			    Flight Date: <input type = "text" name = "flightDate" required/> <br/>
			    Flight Duration: <input type = "text" name = "flightDuration" required/> <br/>
			    Number of Stops: <input type = "text" name = "stops" required/> <br/>
			    Price: <input type = "text" name = "price" required/> <br/>
			    Class Type: <input type = "text" name = "classType" required/> <br/>
			    Cancellation Fee: <input type = "text" name = "cancellationFee" required/> <br/>
			    Airline ID: <input type = "text" name = "airlineID" required/> <br/>
			    Trip Type: <input type = "text" name = "tripType" required/> <br/>
       			<input type = "submit" value = "Add"/>
     		</form>
		<% }
		else if(AEDOption.equals("edit")) { %>
			
			<form action = "confirmAddEditDeleteFlight.jsp" method = "POST" style="display:inline-block;">
				Flight ID: <input type = "text" name = "flightID" required/> <br/> 
				Domestic Or International?: <input type = "text" name = "domesticOrInternational" required/> <br/>
		   	 	Departure Airport: <input type = "text" name = "departureAirport" required/> <br/>
			    Destination Airport: <input type = "text" name = "destinationAirport" required/> <br/>
			    Departure Time: <input type = "text" name = "departureTime" required/> <br/>
			    Arrival Time: <input type = "text" name = "arrivalTime" required/> <br/>
			    Flight Date: <input type = "text" name = "flightDate" required/> <br/>
			    Flight Duration: <input type = "text" name = "flightDuration" required/> <br/>
			    Number of Stops: <input type = "text" name = "stops" required/> <br/>
			    Price: <input type = "text" name = "price" required/> <br/>
			    Class Type: <input type = "text" name = "classType" required/> <br/>
			    Cancellation Fee: <input type = "text" name = "cancellationFee" required/> <br/>
			    Airline ID: <input type = "text" name = "airlineID" required/> <br/>
			    Trip Type: <input type = "text" name = "tripType" required/> <br/>
       			<input type = "submit" value = "Edit"/>
     		</form>
			
		<% }
		else if(AEDOption.equals("delete")) { %>
			
			<form action = "confirmAddEditDeleteFlight.jsp" method = "POST" style="display:inline-block;">
				Flight ID: <input type = "text" name = "flightID" required/> <br/>
				<input type = "submit" value = "Delete"/>
      		</form>
      		
		<% } 
	}
	%>

</body>
</html>