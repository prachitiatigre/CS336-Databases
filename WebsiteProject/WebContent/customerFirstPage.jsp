<!--  Prachiti Atigre -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer First Page</title>
</head>
<body>
	
	<%
    	if ((session.getAttribute("user") != null)) {
	%>
		Welcome <%=session.getAttribute("user") %>

	<%} 
    	
	%>
	<br/>
	<form action = "handleCustomerChoice.jsp" method = "POST">
       
       <input type = "submit" name = "customerChoice" value = "View All Flights">
       <input type = "submit" name = "customerChoice" value = "Make A Flight Reservation">
       <input type = "submit" name = "customerChoice" value = "View My Past Reservations">
       <input type = "submit" name = "customerChoice" value = "View My Upcoming Reservations">
       
       <br>
       <input type = "submit" name = "customerChoice" value = "View All Questions">
       <input type = "submit" name = "customerChoice" value = "Browse Questions by Keywords">
       <input type = "submit" name = "customerChoice" value = "Ask A Question">
       
       <br>
       <input type = "submit" name = "customerChoice" value = "Logout">
	   <input type="hidden" name = "username" value="<%=session.getAttribute("user")%>">
     </form> 
     
</body>
</html>