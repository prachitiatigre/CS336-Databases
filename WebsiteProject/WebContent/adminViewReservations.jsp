<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reservation List</title>
</head>

<body>
	<h1> Choose to See a List of Reservations by FlightID or Customer Name </h1>
	<%@ page import ="java.sql.*" %>
	
	<form action= "adminViewReservations.jsp" method ="POST">
	<select name= "Flight Number">
	<option disabled selected> Flight Number </option>
		
		<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		String query = "select distinct flightID from ticket";

		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()) { %>
			<option><%=rs.getString("flightID") %></option>
		<% } %>
	</select>
	<input type = "submit" value = "Submit"/>
	</form>
	
	<form action= "adminViewReservations.jsp" method ="POST">
	<select name= "Username">
	<option disabled selected> Customer Name </option>
		
		<%
		ApplicationDB ab = new ApplicationDB();	
		Connection connection = ab.getConnection();	
		Statement s = connection.createStatement();
		String que = "select distinct username from ticket";

		ResultSet result = stmt.executeQuery(que);
		
		while(result.next()) { %>
			<option><%=result.getString("username") %></option>
		<% } %>
	</select>
	<input type = "submit" value = "Submit"/>
	</form>
	<br>
	
	<%
	if (request.getParameter("Flight Number") != null && !request.getParameter("Flight Number").isEmpty()) {
		
		String flightNumber = request.getParameter("Flight Number"); 
		ResultSet result1= stmt.executeQuery("Select* from ticket where flightID = '" + flightNumber + "'"); %>
		
		<TABLE BORDER = "1">
		<TR>
			<TH>Unique Number</TH>
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
	
		<% while(result1.next()) { %>
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
			</TR>
			<% } %>
		</TABLE>
	<% } 
	else if (request.getParameter("Username") != null && !request.getParameter("Username").isEmpty()) {
	
		String name = request.getParameter("Username"); 
		ResultSet result1= stmt.executeQuery("Select* from ticket where username = '" + name + "'"); %>
		
		<TABLE BORDER = "1">
		<TR>
			<TH>Unique Number</TH>
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
		
		<% while(result1.next()){ %>
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
			</TR>
			<% } %>
		</TABLE>
	<% }
	%>
	
	<br>
	<a href = "adminFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>
	
</body>
</html>