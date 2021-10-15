<%@page import="data.DataIntegrante"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
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
		
		<table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
		<tr bgcolor=grey>
			<th>Nombre</th>
			<th>Apellido</th>
			<th>nombRango</th>
			<th>descripcion</th>
			<th>horaInicio</th>
		</tr>
			<%
			LinkedList<Integrante> uActivos = new LinkedList<>();
				
				DataIntegrante di = new DataIntegrante();
					
				uActivos = di.getServicio();
				
				
				for(Integrante entry :  uActivos) {
			%>
			<tr>
					<th> <%=entry.getNombre() %> </th>
					<th> <%=entry.getApellido() %> </th>
					<th> <%=entry.getRango().getNomRango() %> </th>
					<th> <%=entry.getSub().getDescripcion() %> </th>
					<th> <%=entry.getHora().getHoraInicio() %> </th>
			</tr>
			<%
			}
			%>
		</table>
		

		
		<table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
		<tr bgcolor=grey>
			<th>Nombre</th>
			<th>Apellido</th>
			<th>resultado</th>
			<th>hora_robo</th>
			<th>idRobo</th>
			<th>nomRobo</th>
			
		</tr>
			
		</table>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		<form action="logoutS" method="post">
			<input type = "submit" value = "Logout"><br>
		</form>
	</body>
	
</html>