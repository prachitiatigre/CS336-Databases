<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ page import ="java.sql.*" %>
	
	<% 
	String optionSelected = (String) session.getAttribute("optionSelected");
	%>
	
	<form method = "post" action = "handleAddEditDelete.jsp">
		  
		  Would you like to add, edit or delete <%= optionSelected %>? <br/>
		  <input type = "radio" name = "command" value = "add" required/> Add
		  <br>
		  <input type = "radio" name = "command" value = "edit" required/> Edit
		  <br>
		  <input type = "radio" name = "command" value = "delete" required/> Delete
		  <br>
		  <input type = "submit" value = "Submit"/>
	</form>

</body>
</html>