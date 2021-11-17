<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>[PSG] Registrar Stock Arma</title>
</head>
<body>
	<% 
		 DataArma  da = new  DataArma();
		LinkedList<Arma> armas = da.getAll();
		
	%>

<form action="registrarStockArmaS" method="post">

	Seleccione Arma para modificar stock:
		 <select name="arma" > 
		<%
			for(Arma a : armas) {
		%>
	    <option value="<%=a.getIdArma()%>"> 
			<% out.print(a.getNombreArma()); %>
	    </option>
	    <%
			}
		%>
	</select><br><br>

	Ingrese el nuevo stock: 
	<input type = "number" name = "newStock" Required><br><br>
	
	
	
	
	<input type = "submit" value = "Guardar cambios" Required><br>

</form>
</body>
</html>