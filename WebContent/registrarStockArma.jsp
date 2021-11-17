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

	<h4>Listado actual</h4>
	
	
	<table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
			<tr bgcolor=blue>
				<th>Tipo Arma</th>
				<th>Nombre Arma</th>
				<th>Cantidad</th>
				<th>Fecha de carga</th>
			</tr>
			<% 
				DataStockarma ds = new DataStockarma();
				LinkedList<Stockarma> listaS = ds.getAll();
				for(Stockarma s :  listaS) {
			%>
			<tr>
				<th> <%=s.getArma().getTipoArma() %> </th>
				<th> <%=s.getArma().getNombreArma() %> </th>
				<th> <%=s.getCantidad() %> </th>
				<th> <%=s.getFecha() %> </th>
			<%
				}
			%>
		</table><br><br>

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