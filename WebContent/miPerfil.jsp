<%@page import="data.DataIntegrante"%>
<%@page import="entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
			int id = (int)session.getAttribute("id");
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
		Nombre Usuario:  <%=i.getUsuario() %> <br>
	</body>
</html>