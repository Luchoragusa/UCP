<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>[PSG] DeleteIntegrante</title>
</head>
<body>


	<% 
	  	DataIntegrante di = new  DataIntegrante();
    	LinkedList<Integrante> lista = di.getAll();
	%>
<form action="deleteIntegranteS" method="post">

		Seleccione Integrante a Eliminar:
		 <select name="integrante"> 
	 
		<%
			for(Integrante i : lista) {
			
		%>
	    <option value="<%=i.getIdIntegrante()%>"> 
			<% out.print(i.getNombre()+" " + i.getApellido()); %>
	    </option>
	    
	    <%
			}
		%>

		</select>
	<input type = "submit" value = "Eliminar" Required><br>
</form>



</body>
</html>