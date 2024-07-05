<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	<form action = "checkUserAndEdit.jsp" method = "POST" style="display:inline-block;">
		Username: <input type = "text" name = "username" required/> <br/>
		Unique Number: <input type = "text" name = "uniqueNum" required/> <br/>
		Seat Number: <input type = "text" name = "seatNum" required/> <br/>
		Flight ID: <input type = "text" name = "flightID" required/> <br/>
		Price: <input type = "text" name = "price" required/> <br/>
		Cancellation Fee: <input type = "text" name = "cancellationFee" required/> <br/>
		Class Type: <input type = "text" name = "classType" required/> <br/>
		<input type = "submit" value = "Edit"/>
	</form>
</body>
</html>