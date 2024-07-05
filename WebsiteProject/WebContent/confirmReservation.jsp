<!--  Prachiti Atigre -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.text.DateFormat, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar, java.time.LocalDateTime" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ page import ="java.sql.*" %>
	<%
	
	String username = request.getParameter("username");
	String flightID = request.getParameter("flightID");
	String departureAirport = request.getParameter("departureAirport");
	String destinationAirport = request.getParameter("destinationAirport");
	String flightDate = request.getParameter("flightDate");
	String price = request.getParameter("price");
	String cancellationFee = request.getParameter("cancellationFee");
	String airlineID = request.getParameter("airlineID");
	String classType = request.getParameter("classType");
	String waitingList = request.getParameter("waitinglist");
	String tripType = request.getParameter("tripType");
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
	String priceFee = " ";
	
	int pricefee = 0, priceAfterConversion, totalPrice;

	if(waitingList.equals("1")) {	
		
		String query = "insert into ticket (seatNum, flightID, departureAirport, destinationAirport, price, cancellationFee, airlineID, classType, username, flightDate, dateReserved)" + 
				" value ('15', '" +flightID+ "' , '" +departureAirport+ "' , '" +destinationAirport+ "' , '" +price+
						"' , '" +cancellationFee+ "' , '" +airlineID+ "' , '" +classType+ "' , '" +username+ "' , '" +flightDate+ "' , current_date())";

		stmt.executeUpdate(query);
		
		String updateWaitingList = "update flights set waitingList = '0' where flightID = '" +flightID+ "'";
		stmt.executeUpdate(updateWaitingList);
		
		String updateUserList = "delete from waitingList where username = '" +username+ "' and flightID = '" +flightID+ "'";
		stmt.executeUpdate(updateUserList);
		
		ResultSet rs1 = stmt.executeQuery("select * from users where username = '" +username+ "'");
		
		while(rs1.next()) {
			priceFee = rs1.getString(7);
		}
		
		if(priceFee == null) {
			
			pricefee = 0;
			priceAfterConversion = Integer.parseInt(price);
			totalPrice = pricefee + priceAfterConversion; 
			
		}
		else {
			
			pricefee = Integer.parseInt(priceFee);
			priceAfterConversion = Integer.parseInt(price);
			totalPrice = pricefee + priceAfterConversion;
		}
		
		String updateTotalPrice = "update users set totalTicketFee = '" +totalPrice+ "' where username = '" +username+ "'";
		stmt.executeUpdate(updateTotalPrice); 
		
		out.println("Your flight from " +departureAirport+ "to " +destinationAirport+ " on " +flightDate+ " has been successfully booked!!");
		
		%>
		
	<% }
	else if(waitingList.equals("0")) {
		
		//Add user to waiting list
		String query = "insert into waitinglist (username, flightID) values ('" +username+ "' , '" +flightID + "')";
		stmt.executeUpdate(query);
		
		out.println("You have been added to the waiting list for the flight from " +departureAirport+ "to " +destinationAirport+ " on " 
			+flightDate+ ".");
		out.println("You will be sent an alert when a seat becomes available!"); 
		
		%>
		
	<% }
	db.closeConnection(con);
	%>

	<br>
	<a href = "customerFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>
		
</body>
</html>