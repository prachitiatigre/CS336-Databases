<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>

<body>
	<% 
	try {
			
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		Statement stmt = con.createStatement();
			
		String choice = request.getParameter("command"); %>
	
		<%
		if (choice.equals("makeFlightForUser")) {
			response.sendRedirect("createReservationForUser.jsp"); 
		}
		
		else if (choice.equals("editReservation")) {
			response.sendRedirect("editFlightReservation.jsp");
		
		}
		else if (choice.equals("replyToQuestions")){
			response.sendRedirect("customerRepReplyQuestions.jsp");
		
		}
		else if (choice.equals("aircraftsAirportsFlights")){
			response.sendRedirect("aircraftsAirportsFlights.jsp");
		
		}
		else if (choice.equals("waitingList")){
			response.sendRedirect("customerRepWaitingList.jsp");
		
		}
		else if (choice.equals("flightsForAirport")){
			response.sendRedirect("listOfFlightsByAirport.jsp");
		
		}%>
		<%
			db.closeConnection(con);%>
	<%
	} 
	catch (Exception e) {
		out.print(e);
		
	} %>
</body>
</html>