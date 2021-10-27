<%@page import="entities.*"%>
<%@page import="data.*"%>
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
		Id:  <%=i.getIdIntegrante() %> <br>
		Nombre:  <%=i.getNombre() %> <br>
		Apellido:  <%=i.getApellido() %> <br>
		Dicord Id:  <%=i.getDiscordId() %> <br>
		Steam Hex:  <%=i.getSteamHex() %> <br>
		Nombre Usuario:  <%=i.getUsuario() %> <br><br>
		
		<h2 align="center">-- Sanciones --</h2> <br>
		<table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
		<tr bgcolor=blue>
			<th>Tipo Sancion</th>
			<th>Numero Sancion</th>
			<th>Estado de la sancion</th>
			<th>Fecha</th>
			<th>URL</th>
		</tr>
		<% 
			DataSancion ds = new DataSancion();
			i=new Integrante();
			i.setIdIntegrante((int)session.getAttribute("id"));
			i = ds.getById(i);
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
	</body>
</html>