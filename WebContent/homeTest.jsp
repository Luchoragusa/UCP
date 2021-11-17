<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.Collection"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
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
		if (session.getAttribute("id") == null)
			response.sendRedirect("loginTest.jsp");
		else 
		{
			int idRol = Integer.parseInt(session.getAttribute("rol").toString());
		}
		%>
		<b><i>[PSG] Bienvenido al panel de usuario!</i></b>
		
		<table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
		<tr bgcolor=grey>
			<th>Nombre y apellido</th>
			<th>Rango</th>
			<th>SubDivision</th>
			<th>Hora Inicio</th>
			<th>Tiempo en Servicio</th>
		</tr>
		<%
			LinkedList<Integrante> uActivos = new LinkedList<>();
			DataIntegrante di = new DataIntegrante();
			uActivos = di.getServicio();
			for(Integrante entry :  uActivos) {
		%>
			<tr>
				<th> <%=entry.getNombre() + " " + entry.getApellido()%> </th>
				<th> <%=entry.getRanInt().getRango().getNomRango() %> </th>
				<th> <%
						String nSub = entry.getSub().getDescripcion();
						if(nSub != null)
							out.println(nSub);
						else
							out.println("Sin Sub");
				%> </th>
				<th> 
						<%	Hora hr = entry.getHora().getFirst();
						out.print(entry.getHora().getFirst().getHoraInicio()); %>
				</th>
				<th> 
					<% 
					LocalDate fecha = LocalDate.now();
					LocalTime tServicio;
					Duration diferencia = Duration.between(hr.getHoraInicio(), LocalTime.now());
					if (fecha.getDayOfMonth() == hr.getFechaInicio().getDayOfMonth())
				        tServicio = LocalTime.of(diferencia.toHoursPart(), diferencia.toMinutesPart());
					else
					{
						out.println(diferencia.toHoursPart() + " " +  diferencia.toMinutesPart());
						if (diferencia.toMinutesPart()>= -5)
						{
							out.print("se elimina la tuplaDateTime");
							DataHoras dh = new DataHoras();
							hr.setIdIntegrante(entry.getIdIntegrante());
							dh.remove(hr);
						}
						else
							tServicio = LocalTime.of(diferencia.toHoursPart()+23, diferencia.toMinutesPart()+59);
						tServicio = null; // dsp borrar esto
					}
					out.println(tServicio);
				     %>
			    </th>
			</tr>
		<%
			}
		%>
		</table><br>
		<table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
			<tr bgcolor=grey>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Resultado</th>
				<th>Hora del robo</th>
				<th>idRobo</th>
				<th>Nombre del Robo</th>
			</tr>
		</table><br><br>
		
		<form action="miPerfil.jsp">
			<input type = "submit" value = "Mi perfil"><br><br>
		</form>
		<form action="bitacora.jsp">
			<input type = "submit" value = "Bitacora"><br><br>
		</form>
		<form action="registrarLugarRobo.jsp">
			<input type = "submit" value = "Registrar Robos"><br><br>
		</form>
		
		<form action="loginTest.jsp">
			<input type = "submit" value = "Logout"><br>
		</form>
		
				<!-- Estos son los botones de admin, pero ni idea como esconederlos -->
		<div class="admin"> <br>
			<form action="gestionIntegrante.jsp">
				<input type = "submit" value = "Gestion Integrante"><br><br>
			</form>
			<form action="altaIntegrante.jsp">
				<input type = "submit" value = "Alta Integrante"><br><br>
			</form>
			<form action="registrarStockArma.jsp">
				<input type = "submit" value = "Armeria"><br>
			</form>
		</div>
		
	</body>
</html>