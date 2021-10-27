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
	
		<% 
	    	DataIntegrante di = new  DataIntegrante();
	    	LinkedList<Integrante> lista = di.getAll();
		%>
		Seleccione el Integrante a sancionar:
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
	
	</body>
</html>