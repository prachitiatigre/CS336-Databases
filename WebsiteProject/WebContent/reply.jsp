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
		String questionAsked = request.getParameter("Question");
		String questionAnswer = request.getParameter("Answer");
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		ResultSet r4= stmt.executeQuery("select * from QA"); 
		
		int x= stmt.executeUpdate("update QA set answers ='" + questionAnswer + "' where questions ='" + questionAsked + "'");	 
		out.println("The question has been successfully answered!");
	%>
	
	<br>
	<a href = "customerRepFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>

</body>
</html>