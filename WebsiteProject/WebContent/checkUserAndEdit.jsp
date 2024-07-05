<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Make Login</title>
</head>
<body>

	<%@ page import ="java.sql.*" %>
	<%
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String username = request.getParameter("username");
		String uniqueNum = request.getParameter("uniqueNum");
		String seatNum = request.getParameter("seatNum");
		String flightID = request.getParameter("flightID");
		String price = request.getParameter("price");
		String cancellationFee = request.getParameter("cancellationFee");
		String classType = request.getParameter("classType");
		
		String updateQuery = "update ticket set seatNum = '" +seatNum+ "' , price = '" +price+ "', cancellationFee = '" +cancellationFee+ "', classType = '" 
			+classType+ "', dateReserved = current_date() where flightID='"+flightID + "'";
		
		String updateUsers = "update users set totalFee = '" +cancellationFee+ "' , totalTicketFee = '" +price+ "'";
		
		ResultSet result3 = stmt.executeQuery("select * from flights where flightID = '" +flightID+ "'");
		
		if(result3.next() == true) {
			
			ResultSet result1 = stmt.executeQuery("select * from users where username = '" +username+ "'");	
			
			if(result1.next() == true) {
			
				ResultSet result2 = stmt.executeQuery("select * from ticket where uniqueNum='" + uniqueNum+ "' and username = '" 
					+username+ "' and flightID = '" +flightID+ "'");
				
				if(result2.next() == true) {
					stmt.executeUpdate(updateQuery);
					out.println("The flight details have been edited successfully made!");
					
					ResultSet result4 = stmt.executeQuery("select * from users where username = '" +username+ "'");
					
					if(result4.next() == true) {
						stmt.executeUpdate(updateUsers);
					}
					else {
						//Do nothing
					}
					
				}
				else {
					out.println("This reservation does not exist!");
					out.println("<br><a href='editFlightReservation.jsp'>Try again!</a>");
				}
				
			}
			else {
				out.println("The username you entered does not exist!");
				out.println("<br><a href='editFlightReservation.jsp'>Try again here</a>");
			}
		}
		else
		{
			out.println("The flight you wanted to reserve does not exist!");
			out.println("<br><a href='editFlightReservation.jsp'>Try again here</a>");
		}
	%>
	
	<br>
	<a href = "customerRepFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>
</body>
</html>