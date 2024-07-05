<!--  Prachiti Atigre -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Flights</title>
</head>
<body>

	<h1> All Flights</h1>
	
	<%@ page import ="java.sql.*" %>
	
	<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		String query = "";
		ResultSet result;
		
		query = "select * from flights";
		result = stmt.executeQuery(query);
		
		String flightType = request.getParameter("domesticOrInternational");
		session.setAttribute("domesticOrInternation", flightType);
		
	%>
	
	<form method = "post" action = "viewAllFlights.jsp">
		  <b> Sort By </b> 
		  <input type = "radio" name = "command" value = "price" required> Price
		  <input type = "radio" name = "command" value = "departureTime" required/>Departure Time
		  <input type = "radio" name = "command" value = "arrivalTime" required/>Arrival Time
		  <input type = "radio" name = "command" value = "duration" required/>Duration
		  <input type = "submit" value = "Submit"/>
	</form>	
	<br>
	
	<%
	if (request.getParameter("command") != null && !request.getParameter("command").isEmpty()) {
		
		String command = request.getParameter("command"); 
		
		if(command.equals("price")) {
			
			query = "select * from flights order by price";
			result = stmt.executeQuery(query);
			
		}
		else if(command.equals("departureTime")) {
			
			query = "select * from flights order by departureTime";
			result = stmt.executeQuery(query);
		}
		else if(command.equals("arrivalTime")) {
			
			query = "select * from flights order by arrivalTime";
			result = stmt.executeQuery(query);
			
		}
		else if(command.equals("duration")) {
			
			query = "select * from flights order by flightDuration";
			result = stmt.executeQuery(query);
		}
		else {
			query = "select * from flights";
			result = stmt.executeQuery(query);
		}
	}
	%>
	
	<TABLE BORDER = "1">
		<TR>
		<TH>Flight ID</TH>
		<TH>Type</TH>
		<TH>Departure Airport</TH>
		<TH>Destination Airport</TH>
		<TH>Departure Time</TH>
		<TH>Arrival Time</TH>
		<TH>Date</TH>
		<TH>Duration (Hrs)</TH>
		<TH>Stops</TH>
		<TH>Price</TH>
		<TH>Class Type</TH>
		<TH>Cancellation Fee</TH>
		<TH>Airline ID</TH>
		<TH>Trip Type</TH>
		</TR>
	
	<% while(result.next()) { %>
		<TR>
		<TD><%=result.getString(1) %></TD>
		<TD><%=result.getString(2) %></TD>
		<TD><%=result.getString(3) %></TD>
		<TD><%=result.getString(4) %></TD>
		<TD><%=result.getString(5) %></TD>
		<TD><%=result.getString(6) %></TD>
		<TD><%=result.getString(7) %></TD>
		<TD><%=result.getString(8) %></TD>
		<TD><%=result.getString(9) %></TD>
		<TD><%=result.getString(10) %></TD>
		<TD><%=result.getString(11) %></TD>
		<TD><%=result.getString(12) %></TD>
		<TD><%=result.getString(13) %></TD>
		<TD><%=result.getString(15) %></TD>
		</TR>
		<%} %>
	</TABLE>
	
	<br>
	<a href = "customerFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>

</body>
</html>