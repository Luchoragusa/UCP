<%@page import="data.DataIntegrante"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.concurrent.LinkedBlockingDeque"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>[PSG]Bitacora</title>
	</head>
	
	<body>
		<%
			if (session.getAttribute("id") == null)
			response.sendRedirect("loginTest.jsp");
		%>
		<form action="bitacoraS" method="post">
			<input type = "submit" value = "Abrir Bitacora"><br>
		</form>
	
		<form action="cerrarBitacoraS" method="post">
			<input type = "submit" value = "Cerrar Bitacora"><br>
		</form>
	</body>
</html>