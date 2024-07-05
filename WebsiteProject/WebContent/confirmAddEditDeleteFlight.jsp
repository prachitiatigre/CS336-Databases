<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ page import ="java.sql.*" %>
	
	<% 
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
	
	String flightID = request.getParameter("flightID"); 
	String domesticOrInternational = request.getParameter("domesticOrInternational");
	String departureAirport = request.getParameter("departureAirport");
	String destinationAirport = request.getParameter("destinationAirport");
	String departureTime = request.getParameter("departureTime");
	String arrivalTime = request.getParameter("arrivalTime");
	String flightDate = request.getParameter("flightDate");
	String flightDuration = request.getParameter("flightDuration");
	String stops = request.getParameter("stops");
	String price = request.getParameter("price");
	String classType = request.getParameter("classType");
	String cancellationFee = request.getParameter("cancellationFee");
	String airlineID = request.getParameter("airlineID");
	String tripType = request.getParameter("tripType");
	
	String optionSelected = (String) session.getAttribute("optionSelected");
	String AEDOption = (String) session.getAttribute("AEDOption");
	
	if(optionSelected.equals("flight")) { 
		
		if(AEDOption.equals("add")) { 
			
			ResultSet result1 = stmt.executeQuery("select * from flights where flightID='" + flightID + "'");
			
			if (result1.next()) {
				out.println("This flight already exists!");
			   	out.println("<br><a href='executeAddEditDelete.jsp'>Try again!</a>");
			}
			else {
				
				String query = "insert into flights values ('" +flightID+ "' , '" +domesticOrInternational+ "' , '" +departureAirport+ "' , '" +destinationAirport+ "' , '" 
						+departureTime+ "' , '" +arrivalTime+ "' , '" +flightDate+ "' , '" +flightDuration+ "', '" +stops+ "' , '" +price+ "' , '" 
							+classType+ "' , '" +cancellationFee+ "' , '" +airlineID+ "' , '" + "1" + "' , '" +tripType+ "')";
						
				
				stmt.executeUpdate(query);
			   	session.setAttribute("flightID", flightID);     
			   	out.println("Flight " +flightID+ " has been successfully added!");
			}
		}
		else if(AEDOption.equals("edit")) {
			
			String updateDomesticOrInternational = "UPDATE flights set domesticOrInternational='"+domesticOrInternational+ "'" + "WHERE flightID='"+flightID + "'";
			String updateDepartureAirport = "UPDATE flights set departureAirport='"+departureAirport+ "'" + "WHERE flightID='"+flightID + "'";
			String updateDestinationAirport = "UPDATE flights set destinationAirport='"+destinationAirport+ "'" + "WHERE flightID='"+flightID + "'";
			String updateDepartureTime = "UPDATE flights set departureTime='"+departureTime+ "'" + "WHERE flightID='"+flightID + "'";
			String updateArrivalTime = "UPDATE flights set arrivalTime='"+arrivalTime+ "'" + "WHERE flightID='"+flightID + "'";
			String updateFlightDate = "UPDATE flights set flightDate='"+flightDate+ "'" + "WHERE flightID='"+flightID + "'";
			String updateFlightDuration = "UPDATE flights set flightDuration='"+flightDuration+ "'" + "WHERE flightID='"+flightID + "'";
			String updateStops = "UPDATE flights set stops='"+stops+ "'" + "WHERE flightID='"+flightID + "'";
			String updatePrice = "UPDATE flights set price='"+price+ "'" + "WHERE flightID='"+flightID + "'";
			String updateClassType = "UPDATE flights set classType='"+classType+ "'" + "WHERE flightID='"+flightID + "'";
			String updateCancellationFee = "UPDATE flights set cancellationFee='"+cancellationFee+ "'" + "WHERE flightID='"+flightID + "'";
			String updateAirlineID = "UPDATE flights set airlineID='"+airlineID+ "'" + "WHERE flightID='"+flightID + "'";
			String updateTripType = "UPDATE flights set tripType='"+tripType+ "'" + "WHERE flightID='"+flightID + "'";
			
			ResultSet result1 = stmt.executeQuery("select * from flights where flightID='" + flightID + "'");
			
			if (result1.next()) {
				stmt.executeUpdate(updateDomesticOrInternational);
				stmt.executeUpdate(updateDepartureAirport);
				stmt.executeUpdate(updateDestinationAirport);
				stmt.executeUpdate(updateDepartureTime);
				stmt.executeUpdate(updateArrivalTime);
				stmt.executeUpdate(updateFlightDate);
				stmt.executeUpdate(updateFlightDuration);
				stmt.executeUpdate(updateStops);
				stmt.executeUpdate(updatePrice);
				stmt.executeUpdate(updateClassType);
				stmt.executeUpdate(updateCancellationFee);
				stmt.executeUpdate(updateAirlineID);
				stmt.executeUpdate(updateTripType);
				
				out.println("Flight " +flightID+ " has been successfully edited!");
			}
			else {
				out.println("This flight does not exist!");
				out.println("<br><a href='executeAddEditDelete.jsp'>Try again!</a>");   	
			}
		}
		else if(AEDOption.equals("delete")) {
			
			String deleteFlight = "DELETE FROM flights WHERE flightID='"+flightID + "'";
			
			ResultSet result1 = stmt.executeQuery("select * from flights where flightID='" + flightID + "'");
			
			if (result1.next()) {
				stmt.execute(deleteFlight);
				out.println("Flight " +flightID+ " has been successfully deleted!");
			} 
			else {
				out.println("This flight does not exist!");
				out.println("<br><a href='executeAddEditDelete.jsp'>Try again!</a>");   	
			}
		}
	}
	%>
	
	<br>
	<a href = "customerRepFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>

</body>
</html>