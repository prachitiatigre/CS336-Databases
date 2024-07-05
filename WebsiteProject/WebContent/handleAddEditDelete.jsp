<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	try {
			
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		Statement stmt = con.createStatement();
			
		String choice = request.getParameter("command"); %>
	
		<%
		if (choice.equals("add")) {
			
			String AED = "add";
			session.setAttribute("AEDOption", AED);
			response.sendRedirect("executeAddEditDelete.jsp");
		}
		else if (choice.equals("edit")) {
			
			String AED = "edit";
			session.setAttribute("AEDOption", AED);
			response.sendRedirect("executeAddEditDelete.jsp");
		}
		else if (choice.equals("delete")) {
			
			String AED = "delete";
			session.setAttribute("AEDOption", AED);
			response.sendRedirect("executeAddEditDelete.jsp");
		
		} %>
		<%
			db.closeConnection(con);%>
	<%
	} 
	catch (Exception e) {
		out.print(e);
		
	} %>
</body>
</html>