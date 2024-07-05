<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ask a Question</title>
</head>
<H1>Ask a Question</H1>

<body>
	
	<form action = "userQuestion.jsp" method = "POST">
		Question: <input type = "text" name = "Ask A Question" /> <br/>
    	<input type = "submit" value = "Submit"/>
     	<input type="hidden" name="Ask A Question" value="Ask A Question">
	</form>
</body>
</html>