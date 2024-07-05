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
	
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
	
	String airportID = request.getParameter("airportID");
	String numOfAircrafts = request.getParameter("numOfAircrafts");
	
	String optionSelected = (String) session.getAttribute("optionSelected");
	String AEDOption = (String) session.getAttribute("AEDOption");
	
	if(optionSelected.equals("airport")) { 
		
		if(AEDOption.equals("add")) {
			
			ResultSet result1 = stmt.executeQuery("select * from airport where airportID='" + airportID + "'");
			
			if (result1.next()) {
				
				out.println("This airport already exists!");
			   	out.println("<br><a href='executeAddEditDelete.jsp'>Try again!</a>");
			} 
			else {
				String query = "insert into airport(airportID, numOfAircrafts) value ('"+airportID+ "' , '"+numOfAircrafts+ "')";
				stmt.executeUpdate(query);
			   	session.setAttribute("airportID", airportID);     	
			   	out.println("The airport " +airportID+ " has been successfully added");
			}			
		}
		else if(AEDOption.equals("edit")) {

			String updateAirportID = "UPDATE airport set numOfAircrafts='"+numOfAircrafts+ "'" + "WHERE airportID='"+airportID + "'";
			
			ResultSet result1 = stmt.executeQuery("select * from airport where airportID='" + airportID + "'");
			
			if (result1.next()) {
				stmt.executeUpdate(updateAirportID);
				out.println("The number of aircrafts for airport " +airportID+ " has been successfully added!");
			} 
			else {
				out.println("This airport does not exist!");
				out.println("<br><a href='executeAddEditDelete.jsp'>Try again!</a>"); 
			}
		}
		else if(AEDOption.equals("delete")) {
			
			String deleteAirport = "DELETE FROM airport WHERE airportID='"+airportID + "'";
			
			ResultSet result1 = stmt.executeQuery("select * from airport where airportID='" + airportID + "'");
			
			if (result1.next()) {
				stmt.execute(deleteAirport);
				out.println("The airport " +airportID+ " has been successfully deleted!");
			   	
			}
			else {
			   out.println("This airport does not exist!");
			   out.println("<br><a href='executeAddEditDelete.jsp'>Try again!</a>");    	
			}
		}
	}
	%>
	
	<br>
	<a href = "customerRepFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>

</body>
</html>