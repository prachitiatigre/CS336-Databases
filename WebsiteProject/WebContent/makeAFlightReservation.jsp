<!--  Prachiti Atigre -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import= "java.time.format.DateTimeFormatter, java.time.LocalDateTime"%>
<%@ page import = "java.text.DateFormat, java.text.SimpleDateFormat, java.util.Date, java.util.Calendar"   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sort/Filter/Date</title>
</head>
<body>
	
	<b>
	Welcome <%=session.getAttribute("user") %> !!! </b> 
 	<br>
	<br>
	
	<%
	String username = request.getParameter("username");
	%>
	
	<form action="addReservation.jsp" method="POST">
		
		Trip Type
		<input type="radio" name="tripType" value = "One-Way" required> One Way
		<input type="radio" name="tripType" value = "Round-Trip" required> Round Trip
		<br>
		<br>
		
		Sort By:
		<input type="radio" name="sort" value="price" required> Price
	    <input type="radio" name="sort" value="departureTime" required> Departure Time
	    <input type="radio" name="sort" value="arrivalTime" required> Arrival Time
	    <input type="radio" name="sort" value="flightDuration" required> Flight Duration
		<br>
		<br>
	
		Filter By:
		<br>
		
		<select name="stopsFilter" required>
		<option  disabled selected> Number of Stops </option>
			
			<option> 0 </option>
			<option> 1 </option>
			<option> 2 </option>
			<option> 3+ </option>
			
		</select>
		
		<select name="airlineFilter" required>
		<option  disabled selected> Airline ID </option>
			<%
			ApplicationDB db3 = new ApplicationDB();	
			Connection con3 = db3.getConnection();	
			Statement stmt3 = con3.createStatement();
			String query3 = "select distinct airlineID from flights";
	
			ResultSet rs3 = stmt3.executeQuery(query3);
			
			while(rs3.next()){
			%>
				<option> <%=rs3.getString("airlineID") %> </option>
			<% 
			}
			%>
		</select>
		
		<select name="departureTimeFilter" required>
		<option  disabled selected> Departure Time </option>
			
			<option> Midnight (12:00am - 4:59am) </option>
			<option> Morning (5:00am - 11:59am) </option>
			<option> Afternoon (12:00pm - 5:59pm) </option>
			<option> Night (6:00pm - 11:59pm) </option>
			
		</select>
		
		<select name="arrivalTimeFilter" required>
		<option  disabled selected> Arrival Time </option>
			
			<option> Midnight (12:00am - 4:59am) </option>
			<option> Morning (5:00am - 11:59am) </option>
			<option> Afternoon (12:00pm - 5:59pm) </option>
			<option> Night (6:00pm - 11:59pm) </option>
			
		</select>
		
	 	 $
		<input type="text" name="priceFilter" placeholder="Price"> 
		
		<br>
			
		<select name="departureAirport" required>
		<option  disabled selected> Departure Airport </option>
			<%
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();
			String query1 = "select distinct departureAirport from flights";
	
			ResultSet rs1 = stmt.executeQuery(query1);
			
			while(rs1.next()){
			%>
				<option> <%=rs1.getString("departureAirport") %> </option>
			<% 
			}
			%>
		</select>
		
		<select name="destinationAirport" required>
		<option  disabled selected> Destination Airport </option>
			<%
			ApplicationDB db1 = new ApplicationDB();	
			Connection con1 = db1.getConnection();	
			Statement stmt1 = con1.createStatement();
			String query2 = "select distinct destinationAirport from flights";
	
			ResultSet rs2 = stmt1.executeQuery(query2);
			
			while(rs2.next()){
			%>
				<option> <%=rs2.getString("destinationAirport") %> </option>
			<% 
			}
			%>
		</select>
		
		<br>
		<br>
		
		Select a Departure Date
		<select name="departureDay" required>
		<option  disabled selected> Day </option>
			
			<% for(int i = 1; i<=31; i++) {
			%>
				<option> <%= i %> </option>
				<%
			}
			%>
		</select>
		
		<select name="departureMonth" required>
		<option  disabled selected> Month </option>
			
			<option> January </option>
			<option> February </option>
			<option> March </option>
			<option> April </option>
			<option> May </option>
			<option> June </option>
			<option> July </option>
			<option> August </option>
			<option> September </option>
			<option> October </option>
			<option> November </option>
			<option> December </option>
			
		</select>
		
		<select name="departureYear" required>
		<option  disabled selected> Year </option>
			
			<% for(int i = 2020; i<=2031; i++) {
			%>
				<option> <%= i %> </option>
				<%
			}
			%>
		</select>
		
		<br>
		
		<input type="radio" name="flexibleDate" value = "Yes"> Select this option if you are flexible with dates (+/- 3 days)
		<br>
		<input type="submit" value="Search">
		<input type="hidden" name=username value="<%=username%>">
		
		<br>
	</form>
</body>
</html>