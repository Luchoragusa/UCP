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
		int idLR; 
		int cantidadElejida;
		idLR = Integer.parseInt(request.getParameter("lugarRobo"));
	  	DataIntegrante di = new  DataIntegrante();
    	LinkedList<Integrante> lista = di.getAll();
    	
    	LugarRobo lr = new LugarRobo();
    	DataLugarRobo dlr = new DataLugarRobo();
    	lr.setIdLugarRobo(idLR);
    	lr = dlr.getById(lr);
    %>
    
	<h3 class="card-text">Seleccione los participantes: </h3>
	<h4 class="card-text">Elija cantidad: M�nimo <%=lr.getMinIntegrantes() %>, m�ximo <%=lr.getMaxIntegrantes() %> </h4>
	
	<input type = "text" name = "cantidad"><br><br>

	
	<%
		for(int c=1; c<= Integer.parseInt(request.getParameter("cantidad")); c++) { 
	%>
	<br>
		 <select name="lugarRobo<%=c%>>">  
			<%
		  		for(Integrante i :  lista) {	
			%>
			    <option value="<% i.getIdIntegrante(); %>">
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

</body>
</html>