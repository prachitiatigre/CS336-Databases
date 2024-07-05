
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Most Active Flights</title>
</head>
<body>
	<h1>Most Active Flights</h1>

	<%
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;

		rs = stmt.executeQuery("SELECT airlineID, count(airlineID) as tickets_sold FROM ticket group by airlineID order by count(airlineID) DESC");
	
		%>
		
		<TABLE BORDER = "1">
		<tr>
		<th>  AirlineID </th>
		<th> Number of Tickets Sold </th>
		</tr>
		
		<%
		while(rs.next()) { %>
			
			<tr>
			<td><%=rs.getString(1) %> </td>
			<td><%=rs.getString(2) %> </td>
 			</tr>
		
		<% }
		db.closeConnection(con);
	}
	catch (Exception e) {
		out.print(e);
	}
	%>
	</table>

	<br>
	<a href = "adminFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>

</body>
</html>