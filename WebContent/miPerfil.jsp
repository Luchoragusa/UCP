<%@page import="entities.*"%>
<%@page import="data.*"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>[PSG]Perfil</title>
	</head>
	<body>
		<%
			if (session.getAttribute("Nombre") == null)
				response.sendRedirect("loginTest.jsp");
		%>
		
		<b><i>[PSG] Bienvenido a su perfil</i></b>
		<b>Id:</b> ${id}
		<% 
			DataIntegrante di = new DataIntegrante();
			Integrante i = new Integrante();
			i.setIdIntegrante((int)session.getAttribute("id"));
			i = di.getByIdIntegrante(i);
		%> <br>
			<b>Nombre y Apellido:</b>  <%=i.getNombre() + " " + i.getApellido()%> <br>
			<b>Rango:</b>  <%=i.getRanInt().getRango().getNomRango() %> <br>
			<b>Fecha ultimo ascenso:</b> <%=i.getRanInt().getFecha_desde() %> <br>
			<b>Dicord Id:</b>  <%=i.getDiscordId() %> <br>
			<b>Steam Hex: </b> <%=i.getSteamHex() %> <br>
			<b>Nombre Usuario: </b> <%=i.getUsuario() %> <br>
		

		<h4>-- Sub-Division --</h4>
		
		<% if(i.getSub().getDescripcion() != null) {%>
			<b>Nombre sub-division:</b>  <%=i.getSub().getDescripcion()%> <br>
			<b>Rango sub-division::</b>  <%=i.getSub().getRanSub().get(0).getNombreRangoSub() %> <br>
			<b>Fecha ultimo ascenso :</b> <%=i.getSub().getRanSub().get(0).getRsi().getFecha_desde() %> <br>
		<%} else %> <p style="background:red;">No tiene subdivision</p>
		<h2 align="center">-- Sanciones --</h2>
		<table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
			<tr bgcolor=blue>
				<th>Tipo Sancion</th>
				<th>Numero Sancion</th>
				<th>Estado de la sancion</th>
				<th>Fecha</th>
				<th>URL</th>
			</tr>
			<% 
				LinkedList<Sancion> listaS = i.getSancion();
				String url;
				for(Sancion s :  listaS) {
					url = s.getUrlSancion();
			%>
			<tr>
				<th> <%=s.getTipoSancion() %> </th>
				<th> <%=s.getNroSancion() %> </th>
				<th> 
				<%	
					if(s.isEstado())
						out.print("Activa");
					else
						out.print("Apelada");
				%> 
				</th>
				<th> <%=s.getFecha() %> </th>
				<th> 
					<a href="<%=s.getUrlSancion()%>" target="_blank">Url imagen</a> 
				</th>
			</tr>
			<%
				}
			%>
		</table><br>
		
		<h2 align="center">-- Bitacoras --</h2>
		<table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
			<tr bgcolor=grey>
				<th>Hora Inicio</th>
				<th>Fecha Inicio</th>
				<th>horaFin</th>
				<th>Fecha Fin</th>	
				<th>Horas Jugadas</th>		
			</tr>
			<%
				LinkedList<Hora> horas = i.getHora();	
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
			<%	
				LocalTime contadorHorasJugadas = LocalTime.of(0, 0);
				for(Hora h :  horas) 
				{
					if (h.getHorasJugadas() != null)
					{
						contadorHorasJugadas = contadorHorasJugadas.plusHours(h.getHorasJugadas().getHour())
								.plusMinutes(h.getHorasJugadas().getMinute())
								.plusSeconds(h.getHorasJugadas().getSecond());
					}
				}
			%>
		</table><br>
		<h3> Horas totales:</h3> <% out.println(contadorHorasJugadas); %> </h3>
		<h3>Progreso de la semana:</h3> <progress align="center" id="horasSemana" 
		max="720"
		value="
		<% 
		out.print(contadorHorasJugadas.getHour()*60 + contadorHorasJugadas.getMinute());
		%>"></progress>
		
		<% 
			DataRobo dr = new DataRobo();
			LinkedList<Integer> por = dr.getPorcentaje(i);
		%>
		<h3>Porcentaje de robos ganados:</h3> <progress align="center" id="robos" 
		max="<%=por.get(0)%>"
		value="
		<%=por.get(1)%>"></progress><br><br>
		<input type = "submit" onclick = "mostrarForm()" value = "Editar datos personales" id="btn1"><br><br>
		
		<form action="editarPerfilS" method="post" id="editarDatos" hidden="">
			Nombre: <input type = "text" name = "nombre" value="<%=i.getNombre()%>"Required><br><br>
			Apellido: <input type = "text" name = "apellido" value="<%=i.getApellido()%>"Required><br><br>
			Discord Id: <input type = "text" name = "discordId" value="<%=i.getDiscordId()%>"Required><br><br>
			Usuario: <input type = "text" name = "usuario" value="<%=i.getUsuario()%>"Required><br><br>
			Contrasenia: <input type = "password" name = "pw" placeholder="Obligatorio" Required><br><br>
			<input type = "submit" value = "Guardar cambios" ><br><br>
		</form>
		
		<script type="text/javascript">
			function mostrarForm()
			{
				document.getElementById('editarDatos').hidden=false;
				document.getElementById('btn1').hidden=true;
			}
		</script>
	</body>
</html>