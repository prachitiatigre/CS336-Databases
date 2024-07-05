<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.websiteproject.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.alert {
  padding: 15px;
  background-color: #a31766;
  color: white;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 15px;
  line-height: 15px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: pink;
}
</style>
</head>

<h2>Flight Alert!</h2>


<body>

	<%@ page import ="java.sql.*" %>
	
		Welcome <%=session.getAttribute("user") %>
		
	<%	
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		Statement stmt = con.createStatement();
	
		String flightID = "";
		String username = (String) session.getAttribute("user");
		
		String query = "select * from waitingList where username = '" +username+ "'";
		ResultSet result = stmt.executeQuery(query);
		
		if(result.next() == false) {
			response.sendRedirect("customerFirstPage.jsp");
		}
		else {

			flightID = result.getString(2); 
			
			String Q = "select * from flights where flightID = '" +flightID+ "' and waitingList = '1'";
			ResultSet result1 = stmt.executeQuery(Q);
			
			if(result1.next() != false) { %>
				
				<div class="alert">
					<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			  		<strong> <%= username %> </strong> Your Flight <%= flightID%> is now available.
				</div>
				
				<form action = "customerFirstPage.jsp" method = "POST">
					<input type = "submit" name = "alertToHome" value = "Home">
				</form>
			<% }
			else {
				response.sendRedirect("customerFirstPage.jsp");
			}
		}%>
</body>
</html>


