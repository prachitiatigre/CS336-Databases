<!--  Prachiti Atigre -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>

<body>
	<%@ page import = "java.sql.*" %>
	
	<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		String role = "", query = "";

		String username = request.getParameter("username");   
	    String password = request.getParameter("password");
	    
	   	ResultSet result1 = stmt.executeQuery("select * from users where username='" + username + "'");
	    
	    if (result1.next()) {
	    	
	    	role = result1.getString(5);
	    	
	    	query = "select * from users where username = '" +username+ "' and password = '" +password+ "' and role = 'customer'"; 
	    	ResultSet result2 = stmt.executeQuery(query);
	    	
	    	if (result2.next()) {
	    	    	session.setAttribute("user", username);
	    	    	response.sendRedirect("sendAlert.jsp");
	    	} 
	    	else {
	    		
	    		if(role.equals("customer")) {
	    		
					out.println("The password you entered is incorrect!!"); %> 
					<br> <a href = "login.jsp"> <button> Try again here! </button></a>
	    		<% }
			}
	    	
	    	query = "select * from users where username = '" +username+ "' and password = '" +password+ "' and role = 'admin'";
	    	ResultSet result3 = stmt.executeQuery(query);
	    	
	    	if (result3.next()) {
    	    	session.setAttribute("user", username);
    	        response.sendRedirect("adminFirstPage.jsp");
			} 
    		else {
    			
    			if(role.equals("admin")) {
    	    		
					out.println("The password you entered is incorrect!!"); %>
					<br> <a href = "login.jsp"> <button> Try again here! </button></a>
	    		<% }
			}
	    	
	    	query = "select * from users where username = '" +username+ "' and password = '" +password+ "' and role = 'customer representative'";
	    	ResultSet result4 = stmt.executeQuery(query);
	    	//role = result4.getString(5);
	    	
	    	if (result4.next()) {
    	    	session.setAttribute("user", username);
    	        response.sendRedirect("customerRepFirstPage.jsp");
			} 
    		else {
				
    			if(role.equals("customer representative")) {
    	    		
					out.println("The password you entered is incorrect!!"); %>
					<br> <a href = "login.jsp"> <button> Try again here! </button></a>
	    		<% }

			}
	    	
	    }
	    else {
	    	out.println("The username you entered does not exist!"); %>
	    	
	    	<br> <a href = "register.jsp"> <button> Create an account here! </button></a>
	    <% }
	%>

</body>
</html>