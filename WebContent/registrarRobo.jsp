<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>[PSG] Registrar Robos</title>
</head>
<body>
	<form action="registrarLugarRoboS" method="post">
	    
	
		<%
	  	DataIntegrante di = new  DataIntegrante();
    	LinkedList<Integrante> lista = di.getAll();
    	int contador=1;
		%>
		
	  	<%
	  		out.print("Seleccione participantes. MAXIMO: "+request.getAttribute("maxInte")+"\n");
		%>
		<br><br>
		<%
	  		for(Integrante i :  lista) {
	  			
		%>
		<input type="checkbox"  name="integrante[<%=i%>]" value="<%=i.getIdIntegrante()%>" onClick="limitarSelección(this,this.form)">
		<%
		out.print(i.getNombre()+" "+i.getApellido());
		%>
		<br>
    	<%
		}
		%>
		<br><br>
		Ingrese Resultado: <input type = "text" name = "rto"><br><br>
		
		<input type = "submit" value = "Guardar" Required><br>
	</form>
	
		
</body>
</html>