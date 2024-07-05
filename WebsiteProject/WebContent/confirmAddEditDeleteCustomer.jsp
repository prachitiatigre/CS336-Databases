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
	
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String username = request.getParameter("username"); 
	String password = request.getParameter("password");
	
	String optionSelected = (String) session.getAttribute("optionSelected");
	String AEDOption = (String) session.getAttribute("AEDOption");
	
	if(optionSelected.equals("customer")) {
		
		if(AEDOption.equals("add")) {
			
			String role = "customer";
			ResultSet result1 = stmt.executeQuery("select * from users where username='" + username + "'");
			
			if (result1.next()) {
				out.println("This username already exists!");
			   	
			} 
			else {
				session.setAttribute("role", "customer");
				String query = "insert into users(firstname, lastname, username, password, role) value ('"+firstname+ "','" 
					+lastname+ "','" +username+ "', '" +password+"', '"+role+"')";
			    stmt.executeUpdate(query);
			   	session.setAttribute("username", username);  
			   	
			   	out.println("The user is successfully added!"); %>
			   	<br>
				<a href = "adminFirstPage.jsp"> <button> Home </button></a>
				<a href = "logout.jsp"> <button> Logout </button></a>
			<% } 
		}
		else if(AEDOption.equals("edit")) {
			
			String updateUsername = "UPDATE users set username='"+username+ "'" + "WHERE username='"+username + "'";
			String updatePassword = "UPDATE users set password='"+password+ "'" + "WHERE username='"+username + "'";
			String updateFirstName = "UPDATE users set firstname='"+firstname+ "'" + "WHERE username='"+username + "'";
			String updateLastName = "UPDATE users set lastname='"+lastname+ "'" + "WHERE username='"+username + "'";
			
			String roleCheck = "";

			ResultSet result1 = stmt.executeQuery("select * from users where username='" + username + "'");
			
			if (result1.next()) {
				
				roleCheck = result1.getString(5);
				
				if(roleCheck.equals("customer")) {
					stmt.executeUpdate(updateUsername);
					stmt.executeUpdate(updatePassword);
					stmt.executeUpdate(updateFirstName);
					stmt.executeUpdate(updateLastName);
					
					out.println("The user is successfully edited!"); %>
				   	<br>
					<a href = "adminFirstPage.jsp"> <button> Home </button></a>
					<a href = "logout.jsp"> <button> Logout </button></a>
					
				<% }
				else {
					out.println("This user is not a customer!");	
				}
			}
			else {
				out.println("This user does not exist!");
			} 
		}
		else if(AEDOption.equals("delete")) {
			
			String roleCheck = "";
			
			String deleteAircraft = "DELETE FROM users WHERE username='"+username + "'";
			ResultSet result1 = stmt.executeQuery("select * from users where username='" + username + "'");
			
			if (result1.next()) {
				
				roleCheck = result1.getString(5);
				
				if(roleCheck.equals("customer")) {
					stmt.execute(deleteAircraft);
					
					out.println("The user is successfully deleted!"); %>
				   	<br>
					<a href = "adminFirstPage.jsp"> <button> Home </button></a>
					<a href = "logout.jsp"> <button> Logout </button></a>
					
				<% }
				else {
					out.println("This user is not a customer!");	
				}
			} 
			else {
				out.println("This username does not exist!");    	
			} 
		}	
	}
	else if(optionSelected.equals("customerRep")) {
		
		if(AEDOption.equals("add")) {
			
			String role = "customer representative";
			ResultSet result1 = stmt.executeQuery("select * from users where username='" + username + "'");
			
			if (result1.next()) {
				out.println("This username already exists!");
			} 
			else {
				session.setAttribute("role", "customer");
				String query = "insert into users(firstname, lastname, username, password, role) value ('"+firstname+ "','" +lastname+ "','" +username+ "', '" +password+"', '"+role+"')";
			    stmt.executeUpdate(query);
			   	session.setAttribute("username", username);
			   	
			   	out.println("The customer representative is successfully added!"); %>
			   	<br>
				<a href = "adminFirstPage.jsp"> <button> Home </button></a>
				<a href = "logout.jsp"> <button> Logout </button></a>
			   	
			<%}
		}  

		else if(AEDOption.equals("edit")) {
			
			String updateUsername = "UPDATE users set username='"+username+ "'" + "WHERE username='"+username + "'";
			String updatePassword = "UPDATE users set password='"+password+ "'" + "WHERE username='"+username + "'";
			String updateFirstName = "UPDATE users set firstname='"+firstname+ "'" + "WHERE username='"+username + "'";
			String updateLastName = "UPDATE users set lastname='"+lastname+ "'" + "WHERE username='"+username + "'";

			String roleCheck = "";
			
			ResultSet result1 = stmt.executeQuery("select * from users where username='" + username + "'");
			
			if (result1.next()) {
				
				roleCheck = result1.getString(5);
				
				if(roleCheck.equals("customer representative")) {
					stmt.executeUpdate(updateUsername);
					stmt.executeUpdate(updatePassword);
					stmt.executeUpdate(updateFirstName);
					stmt.executeUpdate(updateLastName);
					
					out.println("The customer representative is successfully edited!"); %>
				   	<br>
					<a href = "adminFirstPage.jsp"> <button> Home </button></a>
					<a href = "logout.jsp"> <button> Logout </button></a>
					
				<% }
				else {
					out.println("This user is not a customer representative!");	
				}
			}
			else {
				out.println("This user does not exist!");
			} 
		}
		else if(AEDOption.equals("delete")) {
			
			String roleCheck = "";
			
			String deleteAircraft = "DELETE FROM users WHERE username='"+username + "'";
			ResultSet result1 = stmt.executeQuery("select * from users where username='" + username + "'");
			
			if (result1.next()) {
				
				roleCheck = result1.getString(5);
				
				if(roleCheck.equals("customer representative")) {
					stmt.execute(deleteAircraft);
					
					out.println("The customer representative is successfully deleted!"); %>
				   	<br>
					<a href = "adminFirstPage.jsp"> <button> Home </button></a>
					<a href = "logout.jsp"> <button> Logout </button></a>
					
				<% }
				else {
					out.println("This user is not a customer representative!");	
				}
			} 
			else {
				out.println("This username does not exist!");
			} 
		}
	}
	%>
	
</body>
</html>