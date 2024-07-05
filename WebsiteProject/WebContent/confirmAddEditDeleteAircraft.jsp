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
	
	String aircraftID = request.getParameter("aircraftID"); 
	String numOfSeats = request.getParameter("numOfSeats");
	String operationDays = request.getParameter("operationDays");
	String optionSelected = (String) session.getAttribute("optionSelected");
	String AEDOption = (String) session.getAttribute("AEDOption");
	
	if(optionSelected.equals("aircraft")) { 
		
		if(AEDOption.equals("add")) { 
			
			ResultSet result1 = stmt.executeQuery("select * from aircraft where aircraftID='" + aircraftID + "'");
			
			if (result1.next()) {
			   	out.println("This aircraft already exists!");
			   	out.println("<br><a href='executeAddEditDelete.jsp'>Try again!</a>");
			} 
			else {
				String query = "insert into aircraft(aircraftID, numOfSeats, operationDays) value ('"+aircraftID+ "','" +numOfSeats+ "','" +operationDays+ "')";
			   	stmt.executeUpdate(query);
			   	out.println("The aircraft is successfully added!");
			   	session.setAttribute("aircraftID", aircraftID);
			}
		}
		else if(AEDOption.equals("edit")) {
			
			String updateNumOfSeats = "UPDATE aircraft set numOfSeats='"+numOfSeats+ "'" + "WHERE aircraftID='"+aircraftID + "'";
			String updateOperationDays = "UPDATE aircraft set operationDays='"+operationDays+ "'" + "WHERE aircraftID='"+aircraftID + "'";

			ResultSet result1 = stmt.executeQuery("select * from aircraft where aircraftID='" +aircraftID + "'");

			if (result1.next()) {
				stmt.executeUpdate(updateNumOfSeats);
				stmt.executeUpdate(updateOperationDays);
				out.println("The aircraft is successfully edited!");
			} 
			else {
				out.println("This aircraft does not exist!");
				out.println("<br><a href='executeAddEditDelete.jsp'>Try again!</a>");
			}
		}
		else if(AEDOption.equals("delete")) {
			
			String deleteAircraft = "DELETE FROM aircraft WHERE aircraftID='"+aircraftID +"'";

			ResultSet result1 = stmt.executeQuery("select * from aircraft where aircraftID='" +aircraftID + "'");

			if (result1.next()) {
				stmt.execute(deleteAircraft);
				out.println("The aircraft is successfully deleted!");
			} 
			else {
				out.println("This aircraft does not exist!");
				out.println("<br><a href='executeAddEditDelete.jsp'>Try again!</a>");
			}
		}
	}
	%>
</body>
</html>