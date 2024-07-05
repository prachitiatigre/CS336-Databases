<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Airports: Departure and Destination</title>
</head>

<body>
	<%@ page import ="java.sql.*" %>
	
	<%
	ApplicationDB db = new ApplicationDB();		
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
	
	String query = "select distinct departureAirport from flights union select distinct destinationAirport from flights";
	ResultSet rs = stmt.executeQuery(query);
	%>
	
	<div class = "selection">
	<form action= "listOfFlightsByAirport.jsp">
		<select name="Airport" id="Airport">
			<option disabled selected>Airport</option>
			<% while(rs.next()) { %>
				<option><%=rs.getString("departureAirport") %></option>
			<% } %>
			
		</select>
		<button>Submit</button>
	</form>
	</div>
	<br>
	<%
	ResultSet result1 = stmt.executeQuery(query);
	
	if(request.getParameter("Airport") != null && !request.getParameter("Airport").isEmpty()) {
		
		String airport = request.getParameter("Airport");
		result1= stmt.executeQuery("Select * from flights where departureAirport= '" + airport + "' OR destinationAirport= '" + airport + "'"); %>
		
		<TABLE BORDER = "1">
			<TR>
			<TH>flightID</TH>
			<TH>Domestic Or International</TH>
			<TH>Departure Airport</TH>
			<TH>Destination Airport</TH>
			<TH>Departure Time</TH>
			<TH>Arrival Time</TH>
			<TH>Flight Date</TH>
			<TH>Flight Duration</TH>
			<TH>Stops</TH>
			<TH>Price</TH>
			<TH>Class Type</TH>
			<TH>Cancellation Fee</TH>
			<TH>Airline ID</TH>
			<TH>WaitingList</TH>
			<TH>Trip Type</TH>
			</TR>
			<%while(result1.next()){ %>
			<TR>
			<TD><%=result1.getString(1) %></TD>
			<TD><%=result1.getString(2) %></TD>
			<TD><%=result1.getString(3) %></TD>
			<TD><%=result1.getString(4) %></TD>
			<TD><%=result1.getString(5) %></TD>
			<TD><%=result1.getString(6) %></TD>
			<TD><%=result1.getString(7) %></TD>
			<TD><%=result1.getString(8) %></TD>
			<TD><%=result1.getString(9) %></TD>
			<TD><%=result1.getString(10) %></TD>
			<TD><%=result1.getString(11) %></TD>
			<TD><%=result1.getString(12) %></TD>
			<TD><%=result1.getString(13) %></TD>
			<TD><%=result1.getString(14) %></TD>
			<TD><%=result1.getString(15) %></TD>
				
			</TR>
			<%} %>
	</TABLE>
		
	<% }
	%>
	
	<br>
	<a href = "customerRepFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>
	
</body>
</html>