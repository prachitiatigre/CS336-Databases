<!--  Prachiti Atigre -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservations</title>
</head>
<body>
	
	<%@ page import ="java.sql.*" %>
	
	<%
	String username = (String) session.getAttribute("user");
	String reserveType = (String) session.getAttribute("reserveType");
	String totalFee = (String) session.getAttribute("totalFee");
	String totalTicketFee = (String) session.getAttribute("totalTicketFee");
	
	%>
	
	<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		String set;
		ResultSet result;
		
		if(reserveType.equals("past")) {
			set = "select * from ticket where username = '" +username+ "' and flightDate < current_date()";
			result = stmt.executeQuery(set);
		}
		else {
			set = "select * from ticket where username = '" +username+ "' and flightDate >= current_date()";
			result = stmt.executeQuery(set);
		}
	%>
	
	<%  if(reserveType.equals("past")) { %>
		
		<h1> Your Past Reservations </h1>
		
		<TABLE BORDER = "1">
			<TR>
			<TH>Unique Num</TH>
			<TH>Seat Number</TH>
			<TH>Flight ID</TH>
			<TH>Departure Airport</TH>
			<TH>Destination Airport</TH>
			<TH>Price</TH>
			<TH>Cancellation Fee</TH>
			<TH>Airline ID</TH>
			<TH>Class Type</TH>
			<TH>Username</TH>
			<TH>Flight Date</TH>
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
			</TR>
			<%} %>
		</TABLE>
		
		<br>
		<a href = "customerFirstPage.jsp"> <button> Home </button></a>
		<a href = "logout.jsp"> <button> Logout </button></a>
		
	<% } 
	
	else { %>
		
		<h1> Your Upcoming Reservations </h1>
		
		<TABLE BORDER = "1">
			<TR>
			<TH>Unique Num</TH>
			<TH>Seat Number</TH>
			<TH>Flight ID</TH>
			<TH>Departure Airport</TH>
			<TH>Destination Airport</TH>
			<TH>Price</TH>
			<TH>Cancellation Fee</TH>
			<TH>Airline ID</TH>
			<TH>Class Type</TH>
			<TH>Username</TH>
			<TH>Flight Date</TH>
			<TH>Cancel</TH>
		</TR>
	
		<% while(result.next()) { %>
			
			<%
			String uniqueNum = result.getString(1);
			String tFee = result.getString(6);
			String cFee = result.getString(7);
			String user = result.getString(10);
			String flightID = result.getString(3);
			%>
			
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
			
			<TD> 
				<form method = "post" action = "cancelFlightReservation.jsp"> 
					<input type="submit" name="button_clicked" value="Cancel">
					<input type="hidden" name=uniqueNum value="<%=uniqueNum%>">
					<input type="hidden" name=totalFee value="<%=totalFee%>">
					<input type="hidden" name=totalTicketFee value="<%=totalTicketFee%>">
					<input type="hidden" name=cancellationFee value="<%=cFee%>">
					<input type="hidden" name=ticketFee value="<%=tFee%>">
					<input type="hidden" name=username value="<%=user%>">
					<input type="hidden" name=flightID value="<%=flightID%>">
				</form>
			</TD>
			
			</TR>
			<%} %>
		</TABLE>
	
		<br>
		<a href = "customerFirstPage.jsp"> <button> Home </button></a>
		<a href = "logout.jsp"> <button> Logout </button></a>
		
	<% } %>
</body>
</html>