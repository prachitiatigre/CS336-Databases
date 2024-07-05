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
	
		String questionAsked = request.getParameter("questionAsked");
		String questionAnswer = request.getParameter("questionAnswer");
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
		ResultSet r3 = stmt.executeQuery("select questions from QA where questions='" + questionAsked + "'");		   
	%>
	
	<Table Border = "1">
	<TR>
	<TH> Question </TH>
	</TR>
	<% while(r3.next()){ %>
	
	<%
		String questions= r3.getString(1);
	%>
	<TR>
	<TD><%=r3.getString(1)%></TD>
	
	<TD>
		<form method = "post" action = "reply.jsp">
			  Answer: <input type = "text" name = "Answer" /> <br/>
	       	<input type = "submit" value = "Submit"/>
	     	<input type="hidden" name="Answer" value="Answer">
	     	<input type = "hidden" name = "Question" value ="<%=questions%>">
		</form>
	</TD>
	</TR>

	<%} %>
	</Table>

</body>
</html>