<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FlighID in waitinglist</title>
</head>

<body>
	
	<%@ page import ="java.sql.*" %>
	
	<%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
	%>
	
	<form action= "customerRepWaitingList.jsp" method ="POST">
	<select name= "flightNumber">
	<option disabled selected> Flight Number </option>
	
	<%
		String query = "select distinct flightID from waitingList";

		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()) { %>
			<option><%=rs.getString("flightID") %></option>
		<% } %>
	
	</select>
 	<input type = "submit" value = "Submit"/>
	</form>
	<br>
	
	<%
	if(request.getParameter("flightNumber") != null && !request.getParameter("flightNumber").isEmpty()) {
		
		String flightNum = request.getParameter("flightNumber"); 
		ResultSet result1= stmt.executeQuery("Select username from waitingList where flightID = '" + flightNum + "'"); %> 
		
		<TABLE BORDER = "1">
			<TR>
			<TH>Names</TH>
			</TR>
			<%while(result1.next()){ %>
			<TR>
			<TD><%=result1.getString(1) %></TD>
			</TR>
			<%} %>
		</TABLE>
	 
	<% } %>
	
	<br>
	<a href = "customerRepFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>
</body>
</html>