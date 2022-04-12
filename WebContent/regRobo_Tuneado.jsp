<%@page import="java.text.Normalizer.Form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Scanner"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>[PSG] Registrar robo</title>
<link href="./dist/css/regRobo_Tuneado.css" rel="stylesheet">
<link href="./dist/css/RLR_Tuneado.css" rel="stylesheet">
<link rel="icon" type="image/png" sizes="16x16" href="./assets/images/favicon.png">
    <style type="text/css">
        .btn-outline-secondary {
            padding-right: 50px;
            padding-left: 50px;
            text-align: center;
            background-color: #1250ce;
            color: #fff;
            width: 200px;
            position: relative;
            left: 500px;
            bottom: 20px;
            margin-bottom: 30px;
            margin-top: 20px;
        } 
		input[type=submit] {
		  background-color: #04AA6D;
		  text-align: center;
		  border: none;
		  color: white;
		  padding: 6px 14px;
		  text-decoration: none;
		  margin: 4px 2px;
		  cursor: pointer;
		}	
		.containerHome {
	    text-align: center;
	    overflow: hidden;
	    width: 80%;
	    margin: 0 auto;
	    display: table;
	    padding: 0 0 8em 0;
	 	} 
    </style>
</head>
<body>
	<%		
		int idLR = Integer.parseInt(request.getParameter("idLR"));
		int cantidadElejida;
		cantidadElejida = Integer.parseInt(request.getParameter("cant"));
	  	DataIntegrante di = new  DataIntegrante();
    	LinkedList<Integrante> lista = di.getAll();
    	
    	LugarRobo lr = new LugarRobo();
    	DataLugarRobo dlr = new DataLugarRobo();
    	
    	lr.setIdLugarRobo(idLR);
    	lr = dlr.getById(lr);
    	
    %>
   <div class="containerHome">
	<h3 class="card-text" style = "color:#F0F8FF">Seleccione los participantes: </h3>
<form action = "registrarLugarRoboS" method="post">	
	<input type = "hidden" value = "<%=idLR%>" name = "idLR">
		
	<%
		for(int c=1; c<=cantidadElejida; c++) { 		
	%>
	<br>
		 <select name="integrante">  
			<%
		  		for(Integrante i :  lista) {	
			%>
			    <option value="<%=i.getIdIntegrante()%>">
			    	<% out.print(i.getNombre() + "" + i.getApellido()); %>
			    </option>
	    	<%
					}
			%>
		</select><br>
   	<%
		}
	%>
		<br><br><br>
        
	<h3 class="card-text" style = "color:#F0F8FF">Ingrese Resultado: </h3>
		<select name="rto">
			<option value="Ganado">Ganado</option>
			<option value="Perdido">Perdido</option>
			<option value="Empatado">Empatado</option>
		</select>
		<br><br><br>
    
    <div class="containerHome">
        <input type = "submit" value = "Guardar" Required><br>
        <br>
        <a button type="button" class="btn btn-outline-danger" href="HomeTuneada.jsp">Volver a la home</a>
    </div>
    
</form>  
    
    <footer class="footer text-center">
        Panel de la faccion de Prosegur en [BA:RP] || 
            <a href="https://github.com/Luchoragusa">Luciano Ragusa</a> || 
            <a href="https://github.com/JuaniPucheta">Juan Ignacio Pucheta</a>.|| 
            <a href="https://github.com/CamiloPereyra">Camilo Pereyra</a>.
    </footer>
   </div>
</body>
</html>