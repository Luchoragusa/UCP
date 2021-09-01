<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Soy el HOME</title>
		<%
			response.setHeader("cache-control", "no-cache, no-store, must-revalidate"); // borrar cachea y anular algortmios predeterminados para almacenar cache
			response.setHeader("pragma", "no-cache"); // compatibilidad con navegadores viejos
			response.setDateHeader("Expires", 0); // tiempo en el que caduca la fecha de respuesta 
		%>
	</head>
	
	<body>
		<h1>Bienevenido Wachin</h1>
	</body>
</html>