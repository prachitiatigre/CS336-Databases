<!--  Prachiti Atigre -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.text.DateFormat, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar"   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flights</title>
</head>
<body>

	<%@ page import ="java.sql.*" %>
		
	<%
	String username = request.getParameter("username");
	
	String flexibleDateQuery = null;
	String reserveQuery = null;
	
	//Trip Type
	String tripType = request.getParameter("tripType");
	
	//Sort
	String sort = request.getParameter("sort"); 
	
	//Filters
	String stopsFilter = request.getParameter("stopsFilter");
	String airlineFilter = request.getParameter("airlineFilter");
	String departureTimeFilter = request.getParameter("departureTimeFilter");
	String arrivalTimeFilter = request.getParameter("arrivalTimeFilter");
	String priceFilter = request.getParameter("priceFilter");
	
	//Destination and Departure Airport
    String departureAirport = request.getParameter("departureAirport");   
    String destinationAirport = request.getParameter("destinationAirport");
    
    //Departure Date
    int departureDay = Integer.parseInt(request.getParameter("departureDay"));
    int departureYear = Integer.parseInt(request.getParameter("departureYear"));
    String m = request.getParameter("departureMonth");
    String flexibleDate = request.getParameter("flexibleDate");
    
    int departureMonth;
  
  	if(m.equals("January")) departureMonth = 1;
  	else if(m.equals("February")) departureMonth = 2;
  	else if(m.equals("March")) departureMonth = 3;
  	else if(m.equals("April")) departureMonth = 4;
  	else if(m.equals("May")) departureMonth = 5;
  	else if(m.equals("June")) departureMonth = 6;
  	else if(m.equals("July")) departureMonth = 7;
  	else if(m.equals("August")) departureMonth = 8;
  	else if(m.equals("September")) departureMonth = 9;
  	else if(m.equals("October")) departureMonth = 10;
  	else if(m.equals("November")) departureMonth = 11;
  	else departureMonth = 12;
  	
  	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	Calendar cal1 = Calendar.getInstance();
	Calendar cal2 = Calendar.getInstance();
	
	cal.set(Calendar.MONTH, departureMonth-1);
	cal.set(Calendar.YEAR, departureYear);
	cal.set(Calendar.DATE, departureDay);
	Date departureDate = cal.getTime();
	
	if(flexibleDate != null) {
		
		cal1.set(Calendar.MONTH, departureMonth-1);
		cal1.set(Calendar.YEAR, departureYear);
		cal1.set(Calendar.DATE, departureDay-3);
		Date departureDateMin = cal1.getTime();
		
		cal1.set(Calendar.MONTH, departureMonth-1);
		cal1.set(Calendar.YEAR, departureYear);
		cal1.set(Calendar.DATE, departureDay+3);
		Date departureDateMax = cal1.getTime();
		
		flexibleDateQuery = "flightDate between '" +df.format(departureDateMin) + "' and '" + df.format(departureDateMax) + "'";
	}

	String departureTimeQuery = null;
	if(departureTimeFilter != null) {
		
		if(departureTimeFilter.equals("Midnight (12:00am - 4:59am)")) {
			departureTimeQuery = "departureTime >= '00:00:00' and departureTime < '05:00:00'";
		}
		else if(departureTimeFilter.equals("Morning (5:00am - 11:59am)")) {
			departureTimeQuery = "departureTime >= '05:00:00' and departureTime < '12:00:00'";
		}
		else if(departureTimeFilter.equals("Afternoon (12:00pm - 5:59pm)")) {
			departureTimeQuery = "departureTime >= '12:00:00' and departureTime < '18:00:00'";
		}
		else if(departureTimeFilter.equals("Night (6:00pm - 11:59pm)")) {
			departureTimeQuery = "departureTime >= '18:00:00' and departureTime < '00:00:00'";
		}
	}
	
	String arrivalTimeQuery = null;
	if(arrivalTimeFilter != null) {
		
		if(arrivalTimeFilter.equals("Midnight (12:00am - 4:59am)")) {
			arrivalTimeQuery = "arrivalTime >= '00:00:00' and arrivalTime < '05:00:00'";
		}
		else if(arrivalTimeFilter.equals("Morning (5:00am - 11:59am)")) {
			arrivalTimeQuery = "arrivalTime >= '05:00:00' and arrivalTime < '12:00:00'";
		}
		else if(arrivalTimeFilter.equals("Afternoon (12:00pm - 5:59pm)")) {
			arrivalTimeQuery = "arrivalTime >= '12:00:00' and arrivalTime < '18:00:00'";
		}
		else if(arrivalTimeFilter.equals("Night (6:00pm - 11:59pm)")) {
			arrivalTimeQuery = "arrivalTime >= '18:00:00' and arrivalTime < '00:00:00'";
		}
	}
	
	if(tripType != null) {
	
		if(stopsFilter != null) {
			
			if(airlineFilter != null) {
			
				if(departureTimeFilter != null) {
				
					if(arrivalTimeFilter != null) {
					
						if(priceFilter != null) {
						
							if(flexibleDate != null) {
								reserveQuery = "select * from flights where (" + departureTimeQuery + ") and (" + arrivalTimeQuery + ")"
										+ " and stops = '" + stopsFilter + "'"
										+ " and airlineID = '" + airlineFilter + "'"
										+ " and departureAirport ='" + departureAirport + "'"
										+ " and destinationAirport = '" + destinationAirport + "'" 
										+ " and " + flexibleDateQuery
										+ " and price <= " +priceFilter
										+ " and tripType = '" + tripType + "'"
										+ " order by " + sort;
							}
							else if(flexibleDate == null) {
								reserveQuery = "select * from flights where (" + departureTimeQuery + ") and (" + arrivalTimeQuery + ")"
										+ " and stops = '" + stopsFilter + "'"
										+ " and airlineID = '" + airlineFilter + "'"
										+ " and departureAirport ='" + departureAirport + "'"
										+ " and destinationAirport = '" + destinationAirport + "'" 
										+ " and flightDate = '" + df.format(departureDate) + "'"
										+ " and price <= " +priceFilter
										+ " and tripType = '" + tripType + "'"
										+ " order by " + sort;
							}
						}
					}
				}
			}
		}
	}
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
    ResultSet rs1 = stmt.executeQuery(reserveQuery);
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
		<TH>Capacity</TH>
		<TH>Trip Type</TH>
		<TH>Reserve</TH>
		</TR>
	
	<% 
	while(rs1.next()) { %>
		
		<%
		String flightid = rs1.getString(1);
 		String departureA = rs1.getString(3);
 		String destinationA = rs1.getString(4);
 		String departureT = rs1.getString(5);
 		String arrivalT = rs1.getString(6);
 		String dateFlight = rs1.getString(7);
 		String duration = rs1.getString(8);
 		String stops = rs1.getString(9);
 		String price = rs1.getString(10);
 		String classT = rs1.getString(11);
 		String cFee = rs1.getString(12);
 		String airlineid = rs1.getString(13);
 		String waitinglist = rs1.getString(14);
 		String triptype = rs1.getString(15);
 		%>
		
		<TR>
		<TD><%=rs1.getString(1) %></TD>
		<TD><%=rs1.getString(2) %></TD>
		<TD><%=rs1.getString(3) %></TD>
		<TD><%=rs1.getString(4) %></TD>
		<TD><%=rs1.getString(5) %></TD>
		<TD><%=rs1.getString(6) %></TD>
		<TD><%=rs1.getString(7) %></TD>
		<TD><%=rs1.getString(8) %></TD>
		<TD><%=rs1.getString(9) %></TD>
		<TD><%=rs1.getString(10) %></TD>
		<TD><%=rs1.getString(11) %></TD>
		<TD><%=rs1.getString(12) %></TD>
		<TD><%=rs1.getString(13) %></TD>
		<TD><%=rs1.getString(14) %></TD>
		<TD><%=rs1.getString(15)%></TD>
		
		<TD> 
			<form method = "post" action = "confirmReservation.jsp"> 
				
				<% if(waitinglist.equals("1")) { %>
					<input type="submit" name="button_clicked" value="Reserve">
				<% }
				else if(waitinglist.equals("0")) {  %>
					<input type="submit" name="button_clicked" value="Waiting List">
				<% } %>
				
		    	<input type="hidden" name=flightID value="<%=flightid%>">
		    	<input type="hidden" name=departureAirport value="<%=departureA%>">
		    	<input type="hidden" name=destinationAirport value="<%=destinationA%>">
		    	<input type="hidden" name=flightDate value="<%=dateFlight%>">
		    	<input type="hidden" name=price value="<%=price%>">
		    	<input type="hidden" name=classType value="<%=classT%>">
		    	<input type="hidden" name=cancellationFee value="<%=cFee%>">
		    	<input type="hidden" name=airlineID value="<%=airlineid%>">
		    	<input type="hidden" name=waitinglist value="<%=waitinglist%>">
		    	<input type="hidden" name=tripType value="<%=triptype%>">
		    	<input type="hidden" name=username value="<%=session.getAttribute("user") %>">
			</form>
		</TD>
		</TR>
		
	<%} 
	%>
	
	</TABLE>
	
	<br>
		<a href = "customerFirstPage.jsp"> <button> Home </button></a>
		<a href = "logout.jsp"> <button> Logout </button></a>

</body>
</html>