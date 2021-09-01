<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Iniciar Sesion</title>
		
		<%
			response.setHeader("cache-control", "no-cache, no-store, must-revalidate"); // borrar cachea y anular algortmios predeterminados para almacenar cache
			response.setHeader("pragma", "no-cache"); // compatibilidad con navegadores viejos
			response.setDateHeader("Expires", 0); // tiempo en el que caduca la fecha de respuesta 
		%>
	</head>
	<body>
		<div class = "cuerpoFormulario" id="cuerpoFormulario">
			<form class = "formularioLogin" id="formularioLogin" method="post" action="LoginS">
				<h1>Inicio Sesion PSG</h1>
				
				<p>Usuario: </p>
				<div class="texto">
					<input type="text" class= "txt" id="txtUser" required="required" name="txtUser">
				</div>
				
				<p>Password: </p>
				<div class="texto">
					<input type="password" class= "txt" id="txtPw" required="required" name="txtPw">
				</div>
				
				<br>
				<input type="submit" value="Iniciar Sesion" class="btn">
				
			</form>
		</div>
	</body>
</html>