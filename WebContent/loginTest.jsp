<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>[PSG]Login</title>
	</head>
	
	<body>
		<form action="loginS" method="post">						<!-- action href a src>servlets -->
			User: <input type = "text" name = "user"><br><br>
			PW: <input type="password" name = "pw"><br><br>
			<input type = "submit" value = "Login"><br>
		</form>
	</body>
	
</html>