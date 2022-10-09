<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>

<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>[Mi inventario]</title>  
  <link rel="stylesheet" href="./dist/css/armasV.css">
  <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/favicon.png">
  <style type="text/css">
    .btn-mensajes {
      color: #fff;
      background-color: #323C50;
      border-color: #7460ee;
      font-size: 19px;
      padding: 13px;
      text-align: center;
      width: 100px;
      border-radius: 20px;
      position: relative;
      bottom: -100px;
      margin-top: 30px;
    }  
    input[type=submit] {
	  background-color: #323C50;
	  border: none;
	  color: white;
	  padding: 8px 17px;
	  text-decoration: none;
	  margin: 4px 2px;
	  cursor: pointer;
	} 
  </style>
  <link href='https://fonts.googleapis.com/css?family=Rajdhani:600' rel='stylesheet' type='text/css'>
</head>

<body>

    <% 
	    DataArma  da = new  DataArma();
		LinkedList<Arma> ar = da.getAll();
		DataStockarma ds = new DataStockarma();
		LinkedList<Stockarma> listaS = ds.getAll();
	
	%>

  <br/><br/>

  <table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
    <tr bgcolor=#fff>
      <th>Tipo Arma</th>
      <th>Nombre Arma</th>
      <th>Fecha de carga</th>
      <th>Cantidad</th>
    </tr>
    
    <% 
		DataStockarma datastock = new DataStockarma();
		LinkedList<Stockarma> listS = datastock.getAll();
		for(Stockarma s :  listS) {
	%>
		<tr>
		<th bgcolor=#ffffff> <%=s.getArma().getTipoArma() %> </th>
		<th bgcolor=#ffffff> <%=s.getArma().getNombreArma() %> </th>
		<th bgcolor=#ffffff> <%=s.getFecha() %> </th>
		<th bgcolor=#ffffff> <%=s.getCantidad() %> </th>
	<%
		}
	%>    
  </table><br><br>

 <div style="color:#ffffff">
 <form action="registrarStockArmaS" method="post">Seleccione un arma para modificar el Stock: 
		 <select name="arma" > 
		<%
			for(Arma a : ar) {
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
 </div>

  <div class="container">
      <a button class="btn-mensajes" class="btn btn-primary" href="HomeTuneada.jsp">Home</a>
  </div>
  
</body>
</html>