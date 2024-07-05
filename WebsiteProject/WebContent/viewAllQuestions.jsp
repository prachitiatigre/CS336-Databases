<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> View All Questions/Answers </title>
</head>
<H1>View All Questions/Answers</H1>

<body>
<%@ page import ="java.sql.*" %>
	
	<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		String set = "select * from QA";
		ResultSet result = stmt.executeQuery(set);	
	%>
	<TABLE BORDER = "1">
	<TR>
	<TH>Questions</TH>
	<TH>Answers</TH>
	</TR>
	<%while(result.next()){ %>
	<TR>
	<TD><%=result.getString(1) %></TD>
	<TD><%=result.getString(2) %></TD>
	</TR>
	<%} %>
	</TABLE>
	
	<br>
	<a href = "customerFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>

</body>
</html>