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
	<form action="registrarRoboS" method="post">
	<% 
		DataLugarRobo dlr = new  DataLugarRobo();
		LinkedList<LugarRobo> lugares = dlr.getAll();
		
	%>
	Seleccione Lugar de robo:
	 <select name="lugarRobo"> 
	 
		<%
			for(LugarRobo i :  lugares) {
		%>
	    <option value="<%=i.getIdLugarRobo()%>"> 
			<% out.print(i.getLugarRobo()); %>
	    </option>
	    <%
			}
		%>
	</select><br><br>
	<h3>MaxIntegrantes: ${maxInte}</h3>
	
	  Cantidad de Integrantes: <input type = "number" name = "cantInte"><br><br>
	  Resultado: <input type = "text" name = "rto"><br><br>

	</form>

</body>
</html>