<%@page import="java.text.Normalizer.Form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/png" sizes="16x16" href="./assets/images/favicon.png">
<title>[PSG Registrar Robo]</title>
<style>
	input[type=submit] {
	  background-color: #04AA6D;
	  border: none;
	  color: white;
	  padding: 6px 14px;
	  text-decoration: none;
	  margin: 4px 2px;
	  cursor: pointer;
	}
</style>
</head>
<body>

	
	<%		
		int idLR = Integer.parseInt(request.getParameter("idLR"));
		int cantidadElejida;
		cantidadElejida = Integer.parseInt(request.getParameter("cant"));
	  	DataIntegrante di = new  DataIntegrante();
    	LinkedList<Integrante> lista = di.getAll();
    	
    	LugarRobo lr = new LugarRobo();
    	DataLugarRobo dlr = new DataLugarRobo();
    	
    	lr.setIdLugarRobo(idLR);
    	lr = dlr.getById(lr);
    	
    %>
    
	<h3 class="card-text">Seleccione los participantes: </h3>
	
<form action = "registrarLugarRoboS" method="post">	

	<input type = "hidden" value = "<%=idLR%>" name = "idLR">

	<%
		for(int c = 1; c<=cantidadElejida; c++) { 
	%>
	<br>
		 <select name="integrante">  
			<%
		  		for(Integrante i :  lista) {	
			%>
			    <option value="<%=i.getIdIntegrante()%>">
			    	<% out.print(i.getNombre() + "" + i.getApellido()); %>
			    </option>
	    	<%
					}
			%>
		</select><br>
   	<%
		}
	%>
	
		<br>
	<h3 class="card-text">Ingrese Resultado: </h3>
		Ingrese Resultado:
		<select name="rto">
			<option value="Ganado">Ganado</option>
			<option value="Perdido">Perdido</option>
			<option value="Empatado">Empatado</option>
		</select>
		<br>
		
		<input type = "submit" value = "Guardar" Required><br>
</form>
</body>
</html>