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
<link rel="icon" type="image/png" sizes="16x16" href="./assets/images/favicon.png">
</head>
<body>
	<% 
		DataLugarRobo dlr = new  DataLugarRobo();
		LinkedList<LugarRobo> lugares = dlr.getAll();
		LugarRobo lr =  new LugarRobo();
		
	%>
		
<form action="registrarRobo.jsp" method="post">
	
	Seleccione Lugar de robo:
	 <select name="lugarRobo" > 
	 
		<%
			for(LugarRobo i : lugares) {
		%>
		    <option name="idLugarRobo" value="<%=i.getIdLugarRobo()%>"> 
		    	<% out.print(i.getLugarRobo()); %>
		    </option>
		   	    	
	    <%
			}
		
		%>
	</select><br><br>
	
  	<input type = "submit" value = "Continuar" Required><br>
	</form>
	


</body>
</html>













