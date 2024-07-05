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
		if (choice.equals("View Customer with Most Revenue")) {
			response.sendRedirect("customerWithMostRevenue.jsp"); 
		}
		else if (choice.equals("View Sales Reports")) {
			response.sendRedirect("salesReport.jsp");
		
		}
		else if (choice.equals("View Reservations")) {
			response.sendRedirect("adminViewReservations.jsp");
		
		}
		else if (choice.equals("View Most Active Flights")) {
			response.sendRedirect("mostActiveFlights.jsp");
		
		}
		else if (choice.equals("Add, Edit, Or Delete Information")) {
			response.sendRedirect("updateAdmin.jsp");
		}
		db.closeConnection(con);
	} 
	catch (Exception e) {
		out.print(e);
	} %>
</body>
</html>