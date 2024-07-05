<!--  Prachiti Atigre -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import ="java.sql.*" %>
	
	<%
		
		String uniqueNum = request.getParameter("uniqueNum");
		String username = request.getParameter("username");
		String flightID = request.getParameter("flightID");
		
		String totalFee = request.getParameter("totalFee");
		String totalTicketFee = request.getParameter("totalTicketFee");
		
		String cancellationFee = request.getParameter("cancellationFee");
		String ticketFee = request.getParameter("ticketFee");
		
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		
		String deleteQuery, feeQuery, updateWaitinglistQuery, Q;
		String updateTicketPrice;
		ResultSet result;
		
		int totalfee, cancellationfee, fee = 0;
		
		result = stmt.executeQuery("select * from ticket where uniqueNum = '" +uniqueNum+ "'");
		
		if(cancellationFee.equals("0")) {
			deleteQuery = "delete from ticket where uniqueNum = '" +uniqueNum+ "'";
			stmt.executeUpdate(deleteQuery);
		}
		else {
			
			while(result.next()) {
				
				if(totalFee != null) {
					totalfee = Integer.parseInt(totalFee);
					cancellationfee = Integer.parseInt(cancellationFee);
					fee = totalfee + cancellationfee;
					
				}
				else {

					totalfee = 0;
					cancellationfee = Integer.parseInt(cancellationFee);
					fee = totalfee + cancellationfee;
				}
			
			}
			
			feeQuery = "update users set totalFee = '" +fee+ "' where username = '" +username+ "'";
			stmt.executeUpdate(feeQuery);
			
			deleteQuery = "delete from ticket where uniqueNum = '" +uniqueNum+ "'";
			stmt.executeUpdate(deleteQuery);
			
    		updateWaitinglistQuery = "update flights set waitingList = '1' where flightID = '" +flightID+ "'";
    		stmt.executeUpdate(updateWaitinglistQuery);
			
    		out.println("Your flight has been successfully cancelled!");
		}
		
		int ttf = Integer.parseInt(totalTicketFee);
		int tf = Integer.parseInt(ticketFee);
		int finaltf = ttf - tf;
		
		updateTicketPrice = "update users set totalTicketFee = '" +finaltf+ "' where username = '" +username+ "'";
		stmt.executeUpdate(updateTicketPrice);
		
	%>
	
	<br>
	<a href = "customerFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>
	
</body>
</html>