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
	
	Welcome Customer Rep <%=session.getAttribute("user") %> !!
	
	<%@ page import ="java.sql.*" %>
	
	<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		String set = "select *from QA where answers is null";
		ResultSet result = stmt.executeQuery(set);	
	%>
	
	<TABLE BORDER = "1">
	<TR>
	<TH>Questions</TH>
	<TH>Answers</TH>
	</TR>
	
	<%while(result.next()){ %>
	
	<%
	String question = result.getString(1);
	String answer = result.getString(2);
	%>
	
	<TR>
	<TD><%=result.getString(1) %></TD>
	<TD><%=result.getString(2) %></TD>
	<TD>
		<form method = "post" action = "answer.jsp">
			<input type= "submit" name= "button_clicked" value = "reply">
			<input type = "hidden" name = questionAsked value ="<%=question%>">
			<input type = "hidden" name =questionAnswer value ="<%=answer%>">
		</form>
	</TD>
	</TR>
	<%} %>
	</TABLE>
	
	<br>
	<a href = "customerRepFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>
	
</body>
</html>