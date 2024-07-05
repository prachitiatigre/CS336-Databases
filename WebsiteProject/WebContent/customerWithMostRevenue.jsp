<!-- Sonali Rana -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*" %>
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
		ResultSet result;
		String firstname = "", lastname = "";
		
		String findMostPrice = "select * from users where totalFee + totalTicketFee = (select max(totalFee + totalTicketFee) from users)";
		result = stmt.executeQuery(findMostPrice);
		
		while(result.next()) {
			firstname = result.getString(1);
			lastname = result.getString(2);
		}
	%>
	<b> The Customer with the most generated value is: </b> <%=firstname%> <%=lastname%>
	
	<br>
	<a href = "adminFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>
	
</body>
</html>