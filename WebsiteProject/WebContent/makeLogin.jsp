<!--  Prachiti Atigre -->

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
		String password = request.getParameter("password");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String role = request.getParameter("role");
		
		ResultSet result1 = stmt.executeQuery("select * from users where username='" + username + "'");
		
		   if (result1.next()) {
		   	out.println("This username is taken!");
		   	out.println("<br><a href='register.jsp'>Try another one!</a>");
		   	
		   } else {
		   
		   	stmt.executeUpdate("insert into users (firstname, lastname, username, password, role) values('"+firstname+"','"+lastname+"','"+username+"','"+password+"','"+role+"')");
		   	session.setAttribute("user", username);
		   	out.println("The account has been successfully made!!"); %>
			
			<br>
			<a href="customerFirstPage.jsp"> <button> Home </button></a>
			<a href="logout.jsp"> <button> Logout </button></a> 
		   <% }
	%>

</body>
</html>