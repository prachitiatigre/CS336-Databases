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
	
	<h1> Sales Report </h1>

	<%
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	Statement stmt = con.createStatement();
	%>
	
	<div class="selection">
	<form action="salesReport.jsp">
		<select name="month" id="Month">
			<option value = "">Select Month</option>
			<option value = "'JANUARY'"> January </option>
			<option value = "'FEBRUARY'"> February </option>
			<option value = "'MARCH'"> March </option>
			<option value = "'APRIL'"> April </option>
			<option value = "'MAY'"> May </option>
			<option value = "'JUNE'"> June </option>
			<option value = "'JULY'"> July </option>
			<option value = "'AUGUST'"> August </option>
			<option value = "'SEPTEMBER'"> September </option>
			<option value = "'OCTOBER'"> October </option>
			<option value = "'NOVEMBER'"> November </option>
			<option value = "'DECEMBER'"> December </option>
		</select>
		<button>Submit</button>
	</form>
	
	<form action="salesReport.jsp">
		<select name="type" id="type">
			<option value = "">Select Filter</option>
			<option value = "airline"> Airline </option>
			<option value = "customer"> Customer </option>
			<option value = "flight"> Flight </option>
		</select>
		<button>Submit</button>
	</form>
	</div>
	
	<%
	if (request.getParameter("month") != null && !request.getParameter("month").isEmpty()) {
		
		String month = request.getParameter("month");
		String price = ("SELECT sum(price) FROM ticket WHERE DATE_FORMAT(dateReserved, '%M') = " + month);

		ResultSet rs = stmt.executeQuery("SELECT sum(price + cancellationFee) FROM ticket WHERE DATE_FORMAT(dateReserved, '%M') = " + month);
		out.println("<h3>");
		
		if(rs.next()) {
			if(rs.getString(1) != null) {
				out.println(month.replace("'", "")+" TOTAL REVENUE: $"+rs.getString(1));
				out.println("</h3>"); %>
				
				<TABLE BORDER = "1">
				<TR>
					<TH>Username</TH>
					<TH>Flight ID</TH>
					<TH>Price</TH>
					<TH>Cancellation Fee</TH>
					<TH>Date Reserved</TH>
				</TR>
				
				<!-- out.print("<tr><th>Username</th><th>FlightID</th> <th>Price</th><th>Cancellation Fee</th><th>Date Reserved</th></tr>");-->
			<% }
			else {
				out.print("No data for this month");
				//System.out.println("month = " + month+ " " + "price = " + price);
				out.println("</h3>");
			}
		} //need a reservations table
		
		rs = stmt.executeQuery("SELECT * FROM ticket WHERE DATE_FORMAT(dateReserved, '%M') = " + month + " ORDER BY dateReserved DESC");

		while (rs.next()) { %>
			 
			<TR>
			<TD><%=rs.getString(10) %></TD>
			<TD><%=rs.getString(3) %></TD>
			<TD><%=rs.getString(6) %></TD>
			<TD><%=rs.getString(7) %></TD>
			<TD><%=rs.getString(12) %></TD>
			<TR>
		<%}
	}
	%>
	</table>
	
	<%
	if(request.getParameter("type") != null && !request.getParameter("type").isEmpty()) {
		String listing = request.getParameter("type"); %>
		
		<br>
		<% if(listing.equals("flight")) { %>
			
			<TABLE BORDER = "1">
			<TR>
				<TH>Flight ID</TH>
				<TH>Total Revenue</TH>
			</TR>
			
			
			<% ResultSet rs = stmt.executeQuery("SELECT flightID, sum(price +cancellationFee) FROM ticket GROUP BY flightID");

			while (rs.next()) { %>
				
				<TR>
					<TD><%=rs.getString(1)%></TD>
					<TD><%=rs.getString(2)%></TD>
				<TR>
				
			<% } %>
			</table>
		<% }

		if(listing.equals("customer")) { %>
			
			<TABLE BORDER = "1">
			<TR>
				<TH>Customer</TH>
				<TH>Total Revenue</TH>
			</TR>
			
			<% ResultSet rs = stmt.executeQuery("SELECT username, sum(price +cancellationFee) FROM ticket GROUP BY username ORDER BY sum(price)");

			while (rs.next()) { %>
				
				<TR>
					<TD><%=rs.getString(1)%></TD>
					<TD><%=rs.getString(2)%></TD>
				<TR>
				 
			<% } %>
			</table>
		<% }

		if(listing.equals("airline")) { %>
			
			<TABLE BORDER = "1">
			<TR>
				<TH>Airline</TH>
				<TH>Total Revenue</TH>
			</TR>
			
			<% ResultSet rs = stmt.executeQuery("SELECT airlineID, sum(price +cancellationFee) FROM ticket GROUP BY airlineID");

			while (rs.next()) { %>
				
				<TR>
					<TD><%=rs.getString(1)%></TD>
					<TD><%=rs.getString(2)%></TD>
				<TR>
				
			<% }
		}%>
		</table>
	<% }
	db.closeConnection(con);
	%>
	
	<br>
	<a href = "adminFirstPage.jsp"> <button> Home </button></a>
	<a href = "logout.jsp"> <button> Logout </button></a>

</body>
</html>