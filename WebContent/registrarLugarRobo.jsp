<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>[PSG] Registrar lugar Robo</title>
</head>
<body>

<form action="registrarLugarRoboS" method="post">
	<% 
		DataLugarRobo dlr = new  DataLugarRobo();
		LinkedList<LugarRobo> lugares = dlr.getAll();
		LugarRobo lr =  new LugarRobo();
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
	</select>
	
	
	<input type = "submit" value = "Siguiente"><br><br>

	</form>
	


</body>
</html>