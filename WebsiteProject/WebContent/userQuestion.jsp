<!--  Ujani Patel -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question</title>
</head>

<body>
	
	<%@ page import ="java.sql.*" %>
	
	<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		
		String question = request.getParameter("Ask A Question"); 
		
		ResultSet result1= stmt.executeQuery("Select*from QA");
				
		int x= stmt.executeUpdate("insert into QA(questions) values('"+question+"')");	   	    
		
		out.println("Your question has been successfully added!");
	%>
	
	<br>
	<a href = "customerFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>

</body>
</html>