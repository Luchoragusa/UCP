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
<title>[PSG] Registrar lugar Robo</title>

</head>
<body>
	<% 
		DataLugarRobo dlr = new  DataLugarRobo();
		LinkedList<LugarRobo> lugares = dlr.getAll();
		LugarRobo lr =  new LugarRobo();
		int idLR;
	  	DataIntegrante di = new  DataIntegrante();
    	LinkedList<Integrante> lista = di.getAll();
	%>
		
<form action="registrarLugarRoboS?sizeLista=<%=lista.size()%>" method="post">
	
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
	
		
	  	<%
	  		out.print("Seleccione participantes Max: NI IDEA COMO TRAER EL MAXIMO DE CADA LUGAR ROBO");
		%>
		
		<br><br>
		<%
	  		for(Integrante i :  lista) {	
		%>
		<input type="checkbox"  name="integrante" value="<%=i.getIdIntegrante()%>">
		<%
		out.print(i.getNombre()+" "+i.getApellido());
		%>
		
		<br>
		
    	<%
				}
		%>
		<br>
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
















