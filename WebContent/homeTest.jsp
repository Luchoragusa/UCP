<%@page import="data.DataIntegrante"%>
<%@page import="entities.Integrante"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.concurrent.LinkedBlockingDeque"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="ISO-8859-1">
		<title>[PSG]Panel Usuario</title>
	</head>
	
	<body>
		<%
		if (session.getAttribute("Nombre") == null)
			response.sendRedirect("loginTest.jsp");
		%>
		<b><i>[PSG] Bienvenido al panel de usuario!</i></b>
		<br>
		<b>Nombre:</b> ${Nombre} 
		<br>
		<b>Apellido:</b> ${Apellido}
		<br>
		<b>Id:</b> ${id}
		
		<table border="0" align="center" width="1000">
			
			<%
				DataIntegrante di = new DataIntegrante();
				LinkedList<Integrante> usuarios =  di.getAll();
				for (Integrante i : usuarios) {
			%>	
			
			<% i.getNombre();%> 
			
			<%
				}
			%>
			
		</table>

		<form action="logoutS" method="post">
			<input type = "submit" value = "Logout"><br>
		</form>
	</body>
	
</html>