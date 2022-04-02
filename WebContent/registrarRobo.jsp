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
<title>Insert title here</title>
</head>
<body>


<%		int idLR;
	  	DataIntegrante di = new  DataIntegrante();
    	LinkedList<Integrante> lista = di.getAll();%>
<%
  		out.print("Seleccione participantes Max: NI IDEA COMO TRAER EL MAXIMO DE CADA LUGAR ROBO");
	%><br>
	
	<%
	for(int c=0; c<=2; c++) { // repite el combo box, lo deberia hacer en base a la cantidad integrantes q participaron
	%><br>
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