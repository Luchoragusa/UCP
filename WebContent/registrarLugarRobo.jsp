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

<form action="registrarLugarRoboS" method="post">
	<% 
		DataLugarRobo dlr = new  DataLugarRobo();
		LinkedList<LugarRobo> lugares = dlr.getAll();
		LugarRobo lr =  new LugarRobo();
		int idLR;
	%>
	Seleccione Lugar de robo:
	 <select name="lugarRobo"> 
	 
		<%
			for(int i=1;i<=lugares.size();i++) {
				lr.setIdLugarRobo(i);
				lr=dlr.getById(lr);
		%>
	    <option value="<%=lr.getIdLugarRobo()%>" > 
			<% out.print(lr.getLugarRobo()); %>
	    </option>
	    
	    <%
			}
		%>
		
	</select><br><br>
	
		<%
	  	DataIntegrante di = new  DataIntegrante();
    	LinkedList<Integrante> lista = di.getAll();
    	
		%>
		
	  	<%
	  		out.print("Seleccione participantes Max: NI IDEA COMO TRAER EL MAXIMO DE CADA LUGAR ROBO");
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