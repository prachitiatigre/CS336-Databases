<!--  Prachiti Atigre -->

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
	try {
			
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		Statement stmt = con.createStatement();
			
		String username = request.getParameter("username");
		String customerChoice = request.getParameter("customerChoice");
		
		ResultSet result1 = stmt.executeQuery("select totalFee from users where username = '" +username+ "'");
		String totalFee = "";
		while(result1.next()) {
			totalFee = result1.getString(1);
		}
		
		ResultSet result2 = stmt.executeQuery("select totalTicketFee from users where username = '" +username+ "'");
		String totalTicketFee = "";
		while(result2.next()) {
			totalTicketFee = result2.getString(1);
		}
		
		if (customerChoice.equals("View All Flights")) {  
			
			session.setAttribute("user", username);
			response.sendRedirect("viewAllFlights.jsp");
			
		}
		else if (customerChoice.equals("Make A Flight Reservation")) { 
			
			session.setAttribute("user", username);
			response.sendRedirect("makeAFlightReservation.jsp");	
			
		} 
		else if (customerChoice.equals("View My Past Reservations")) { 
			
			String reserve = "past";
			session.setAttribute("user", username);
			session.setAttribute("reserveType", reserve);
			response.sendRedirect("viewMyReservations.jsp");
			
		}
		else if(customerChoice.equals("View My Upcoming Reservations")) {
			
			String reserve = "upcoming";
			session.setAttribute("user", username);
			session.setAttribute("reserveType", reserve);
			session.setAttribute("totalFee", totalFee);
			session.setAttribute("totalTicketFee", totalTicketFee);
			response.sendRedirect("viewMyReservations.jsp");
			
		}
		else if(customerChoice.equals("View All Questions")) {
			
			session.setAttribute("user", username);
			response.sendRedirect("viewAllQuestions.jsp");
			
		}
		else if(customerChoice.equals("Browse Questions by Keywords")) {
			
			session.setAttribute("user", username);
			response.sendRedirect("browseQuestionsByKeywords.jsp");
			
		}
		else if(customerChoice.equals("Ask A Question")) {
			
			session.setAttribute("user", username);
			response.sendRedirect("askAQuestion.jsp");
			
		}
		else if(customerChoice.equals("Logout")) {
			session.setAttribute("user", username);
			response.sendRedirect("logout.jsp");
			
		} 
		%>
		
	<%
		db.closeConnection(con);
	%>
	
	<%
	}
	catch (Exception e) {
		out.print(e);
		
	} %>

</body>
</html>