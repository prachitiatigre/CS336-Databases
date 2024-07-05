<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
		String seatNum = request.getParameter("seatNum");
		String flightID = request.getParameter("flightID");
		String waitingList= "";
		String priceFee = "";
		int pricefee = 0, priceAfterConversion = 0, totalPrice = 0;
		
		ResultSet rs1 = stmt.executeQuery("select * from users where username='" + username + "'");
		
		if(rs1.next()) {
			
			ResultSet rs2 = stmt.executeQuery("select * from flights where flightID='" + flightID + "'");
			
			if(rs2.next()) {
				
				waitingList = rs2.getString(14);
				
				if(waitingList.equals("1")) {
					
					String departureA = rs2.getString(3);
					String destinationA = rs2.getString(4);
					String airlineid = rs2.getString(13);
					String price = rs2.getString(10);
					String cFee = rs2.getString(12);
					String classtype = rs2.getString(11);
					String flightdate = rs2.getString(7);
					
					String query = "insert into ticket (seatNum, flightID, departureAirport, destinationAirport, price, cancellationFee, airlineID, classType, username, flightDate, dateReserved)" + 
								" value ('" +seatNum+ "', '" +flightID+ "' , '" +departureA+ "' , '" +destinationA+ "' , '" +price+
										"' , '" +cFee+ "' , '" +airlineid+ "' , '" +classtype+ "' , '" +username+ "' , '" +flightdate+ "' , current_date())";
						
					stmt.executeUpdate(query);
						
					String updateWaitingList = "update flights set waitingList = '0' where flightID = '" +flightID+ "'";
					stmt.executeUpdate(updateWaitingList);
						
					ResultSet rs3 = stmt.executeQuery("select * from users where username = '" +username+ "'");
						
					while(rs3.next()) {
						priceFee = rs3.getString(7);
					}
						
					if(priceFee == null) {
							
						pricefee = 0;
						priceAfterConversion = Integer.parseInt(price);
						totalPrice = pricefee + priceAfterConversion; 
					}
					else {
							
						pricefee = Integer.parseInt(priceFee);
						priceAfterConversion = Integer.parseInt(price);
						totalPrice = pricefee + priceAfterConversion;
					}
						
					String updateTotalPrice = "update users set totalTicketFee = '" +totalPrice+ "' where username = '" +username+ "'";
					stmt.executeUpdate(updateTotalPrice);
						
					session.setAttribute("command", "customerRepAddedReservation");
					out.println("The reservation for flight " +flightID+ " for " +username+ " has been successfully made!!");
						
				}
				else if(waitingList.equals("0")) {
					out.println("This flight is booked!");
				   	out.println("<br><a href='createReservationForUser.jsp'>Try again!</a>");
				}
			}
			else {
				out.println("The flight you wanted to reserve does not exist!");
				out.println("<br><a href='createReservationForUser.jsp'>Try again here</a>");
			}			
		}
		else {
			out.println("The username you entered does not exist!");
			out.println("<br><a href='createReservationForUser.jsp'>Try again here</a>");
		}
	%>
	<br>
	<a href = "customerRepFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>

</body>
</html>