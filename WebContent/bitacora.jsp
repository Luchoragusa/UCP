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
		<title>[PSG]Bitacora</title>
	</head>
	
	<body>
		<form action="bitacoraS" method="post">
			<input type = "submit" value = "Abrir Bitacora"><br>
		</form>
	
		<form action="cerrarBitacoraS" method="post">
			<input type = "submit" value = "Cerrar Bitacora"><br>
		</form>
	</body>
	
			<table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
		<tr bgcolor=grey>
			<th>Hora Inicio</th>
			<th>Fecha Inicio</th>
			<th>horaFin</th>
			<th>Fecha Fin</th>	
			<th>Horas Jugadas</th>		
		</tr>
		<%
			LinkedList<Hora> horas = new LinkedList<>();
		
			Integrante i = new Integrante();
			i.setIdIntegrante((int) session.getAttribute("id"));
			Hora hora = new Hora(); 
			DataHoras dh = new DataHoras();
	
			hora.setIdIntegrante(i.getIdIntegrante());
			horas = dh.get5HorasDelIntegrante(hora);	
			
			for(Hora h :  horas) {
		%>
			<tr>
				<th> <%=h.getHoraInicio() %> </th>
				<th> <%=h.getFechaInicio() %> </th>
				<th> <%=h.getHoraFin() %> </th>
				<th> <%=h.getFechaFin() %> </th>
				<th> <%=h.getHorasJugadas() %> </th>
		   </tr>
		<%
			}
		%>
		</table>
</html>