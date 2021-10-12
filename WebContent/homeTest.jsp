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

			
			HashMap<HashMap<Integrante,Rango>,HashMap<Horas,Subdivision>> uActivos = new HashMap<>();
			
			DataIntegrante di = new DataIntegrante();
			Rango r = new Rango();
			DataRango dr = new DataRango();

			
			uActivos = di.getServicio();
			
			
			for(HashMap.Entry<HashMap<Integrante,Rango>,HashMap<Horas,Subdivision>> entry :  uActivos.entrySet()) { %>
			
				<% for(HashMap.Entry<Integrante,Rango> entry1 : (entry.getKey()).entrySet() ) { %>
					<tr>
					<th> <%= entry1.getKey().getNombre() %> </th>
					<th> <%= entry1.getKey().getApellido() %> </th>
					<th> <%= entry1.getValue().getNomRango() %> </th>
					
				
				<%
				}
				%>
				<% for(HashMap.Entry<Horas,Subdivision> entry2 : (entry.getValue()).entrySet() ) { %>
					
					<th> <%= entry2.getValue().getDescripcion() %> </th>
					<th> <%= entry2.getKey().getHoraInicio() %> </th>
					</tr>
				
				
				<%
				}
				%>
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
			<%
			DataRoboxdia drxd = new DataRoboxdia();
					
					HashMap<HashMap<Integrante,Roboxdia>,LugarRobo> inteRxdR = new HashMap<>();
					
					
					inteRxdR = drxd.getUltimos5robos();
					
					
					for(HashMap.Entry<HashMap<Integrante,Roboxdia>,LugarRobo> en:  inteRxdR.entrySet()) {
			%>
			
				<% for(HashMap.Entry<Integrante,Roboxdia> en1 : (en.getKey()).entrySet() ) { %>
					<tr>
					<th> <%= en1.getKey().getNombre() %> </th>
					<th> <%= en1.getKey().getApellido() %> </th>
					<th> <%= en1.getValue().getResultado() %> </th>
					<th> <%= en1.getValue().getHora_robo() %> </th>
					<th> <%= en1.getValue().getIdRobo() %> </th>
					
				
				<%
				}
				%>
				
				
					<th> <%= en.getValue().getNomRobo() %> </th>
					</tr>
				
			<%
			}
			%>
		</table>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		<form action="logoutS" method="post">
			<input type = "submit" value = "Logout"><br>
		</form>
	</body>
	
</html>