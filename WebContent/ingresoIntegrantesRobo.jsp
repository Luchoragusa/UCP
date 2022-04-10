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
	
<form action="registrarRobo.jsp" method="post">
	
	<input type = "hidden" name = "idLR" value = "<%=idLR%>">
		
	Seleccione cantidad de integrantes:
	 <select name="cant" >  
		<%
			for(int c=lr.getMinIntegrantes(); c<=lr.getMaxIntegrantes(); c++) { 
		%>
		    <option name="cantRobo" value="<%=c%>"> 
		    	<% out.print(c); %>
		    </option>
		   	    	
	    <%
			}
		
		%>
	</select><br><br>		
  	<input type = "submit" value = "Continuar" Required><br>
  	
</form>

</body>
</html>