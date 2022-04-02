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
	    <option value="<%=i.getIdLugarRobo()%>"> 
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













