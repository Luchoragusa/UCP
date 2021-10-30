<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>[PSG]Gestion integrante2</title>
	</head>
	<body>
		<% 
			Integrante i = new Integrante();
			i.setIdIntegrante(Integer.parseInt(request.getParameter("id")));
		%>
		<form action="editarPerfilS" method="post" id="editarDatos" hidden="">
			Nombre: <input type = "text" name = "nombre" value="<%=i.getNombre()%>"Required><br><br>
			Apellido: <input type = "text" name = "apellido" value="<%=i.getApellido()%>"Required><br><br>
			Discord Id: <input type = "text" name = "discordId" value="<%=i.getDiscordId()%>"Required><br><br>
			Usuario: <input type = "text" name = "usuario" value="<%=i.getUsuario()%>"Required><br><br>
			Contrasenia: <input type = "password" name = "pw" placeholder="Obligatorio" Required><br><br>
			<input type = "submit" value = "Guardar cambios" ><br><br>
		</form>
	</body>
</html>