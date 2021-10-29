<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>[PSG]Aplicar Sancion</title>
	</head>
	<body>
		<form action="sancionS" method="post">
			<% 
		    	DataIntegrante di = new  DataIntegrante();
		    	LinkedList<Integrante> lista = di.getAll();
			%>
			Integrante a sancionar:
			 <select name="integrante">
	 			<%
	 				for(Integrante i :  lista) {
	 			%>
		        <option value="<%=i.getIdIntegrante()%>"> 
		        <% out.print(i.getNombre() + " " + i.getApellido()); %></option>
			    <%
					}
				%>
	         </select><br><br>
			Tipo de sancion:
			<select name="tipoSancion">
		        <option value="Raya"> Raya </option>
				<option value="Strike"> Strike </option>
	        </select><br><br>
	        
	        Numero de Sancion: 
	        <select name="nroSancion">
		        <option value="1"> 1 </option>
				<option value="2"> 2 </option>
				<option value="3"> 3 </option>
	        </select><br><br>
	        
	        Motivo de la sancion: <input type = "text" name = "motivo" Required><br><br>
	        Imagen (opcional): <input type = "text" name = "url" Required><br><br>
			<input type = "submit" value = "Aplicar Sancion" Required><br>
		</form>
	</body>
</html>