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
      background-color: #7e799b;
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
  </style>
  <link href='https://fonts.googleapis.com/css?family=Rajdhani:600' rel='stylesheet' type='text/css'>
</head>

<body>

    <% 
	    DataArma  da = new  DataArma();
		LinkedList<Arma> ar = da.getAll();
		DataStockarma ds = new DataStockarma();
		LinkedList<Stockarma> listaS = ds.getAll();
		for(Stockarma s :  listaS) {
	%>

  <div class="container">
    <div class="killFeed">
      <div class="killer"><%=s.getArma().getNombreArma() %> </div>
      <%
      	if(s.getArma().getNombreArma().equalsIgnoreCase("Revolver")){
      %>
      	<div class="weapon deagle"></div>
      <%
      	} else if(s.getArma().getNombreArma().equalsIgnoreCase("AK-47")){      		
      %>
      	<div class="weapon ak47"></div>
      <%
      	} else if(s.getArma().getNombreArma().equalsIgnoreCase("ApPistol")){      		
      %>
    	<div class="weapon appistol"></div>
      <%
    	} else if(s.getArma().getNombreArma().equalsIgnoreCase("Mag7")){      		
      %>
		<div class="weapon mag7"></div>
      <%
    	} else if(s.getArma().getNombreArma().equalsIgnoreCase("Francotirador")){      		
      %>
      	<div class="weapon awp"></div>
      <%
    	} else if(s.getArma().getNombreArma().equalsIgnoreCase("Glock")){      		
      %>
      	<div class="weapon glock"></div>
      <%
    	} else if(s.getArma().getNombreArma().equalsIgnoreCase("G3sg1")){ 
      %>
      	<div class="weapon g3sg1"></div>
      <%
    	} else if(s.getArma().getNombreArma().equalsIgnoreCase("M4a1")){ 
      %>
      	<div class="weapon m4a1"></div>
      <%
    	} 
      %>    	
      
      <div class="killed">
        Cantidad: <%=s.getCantidad() %>
      </div>
    </div>
  </div>
  
  	<%
		}
	%>

  <br/><br/>

  <table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
    <tr bgcolor=#71A6FF>
      <th>Tipo Arma</th>
      <th>Nombre Arma</th>
      <th>Fecha de carga</th>
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
	<%
		}
	%>    
  </table><br><br>

 <div style="color:#ffffff">
 <form action="registrarStockArmaS" method="post">Seleccione un arma para modificar el Stock.
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