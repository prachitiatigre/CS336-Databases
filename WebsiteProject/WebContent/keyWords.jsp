<!--  Ujani Patel -->

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
		
		String keyWord = request.getParameter("keyword"); 
		if(keyWord.equals(""))
			keyWord= "";
		ResultSet set = stmt.executeQuery("Select questions,answers from QA where questions like'%"+ keyWord.trim()+"%'");
		   
	%>
	
	<Table Border = "1">
	<TR>
	<TH> Questions </TH>
	<TH> Answers </TH>
	</TR>
	<% while(set.next()){ %>
	<TR>
	<TD><%=set.getString(1)%></TD>
	<TD><%=set.getString(2)%></TD>
	<%} %>
	</Table>
	
	<br>
	<a href = "customerFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>

</body>
</html>