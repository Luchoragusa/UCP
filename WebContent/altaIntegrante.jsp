<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>[PSG]Alta Integrante</title>
	</head>
	<body>
		<%
			if (session.getAttribute("Nombre") == null)
			response.sendRedirect("loginTest.jsp");
		%>
		<form action="altaIntegranteS" method="post">
			Nombre: <input type = "text" name = "nombre" Required><br><br>
			Apellido: <input type="text" name = "apellido" Required><br><br>
			DiscordID: <input type="text" name = "dsId" Required><br><br>
			SteamHex: <input type="text" name = "steamHex" Required><br><br>
			Nombre usuario: <input type="text" name = "nombreUsuario" Required><br><br>
			Contrasenia: <input type="password" name = "pw" Required><br><br>
 			<%
 				DataRango dr = new DataRango();
 				LinkedList<Rango> lista = new LinkedList<Rango>();
 				lista = dr.getAll();
 			%>
			Rango:
       		<select name="rango">
 			<%
 				for(Rango r :  lista) {
 			%>
	        <option value="<%=r.getIdRango()%>"> 
	        <%=r.getNomRango()%></option>
		    <%
				}
			%>
			</select><br><br>
             <%
 				DataRol drol = new DataRol();
 				LinkedList<Rol> listaRol = new LinkedList<Rol>();
 				listaRol = drol.getAll();
 			%>
			Rol:
       		<select name="rol">
 			<%
 				for(Rol rol :  listaRol) {
 			%>
	        <option value="<%=rol.getIdRol()%>"> 
	        <%=rol.getdescRol()%></option>
		    <%
				}
			%>
			</select><br><br>
			<input type = "submit" value = "Agregar"><br>
		</form>
	</body>
</html>