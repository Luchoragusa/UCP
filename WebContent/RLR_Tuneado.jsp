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
    <link href="./dist/css/RLR_Tuneado.css" rel="stylesheet">
<style type="text/css">     
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
<body class="align">
	<% 
		DataLugarRobo dlr = new  DataLugarRobo();
		LinkedList<LugarRobo> lugares = dlr.getAll();
		LugarRobo lr =  new LugarRobo();
		
	%>
  
  <div class="grid">
    <form action="regRobo_Tuneado.jsp" method="post" class="form login">
      <div class="form__field">
	      <label for="login__username">
	      	Seleccione Lugar de robo:</label>
	   
		 <select name="lugarRobo" > 
		 
			<%
				for(LugarRobo i : lugares) {
			%>
		    <option value="<%=i.getIdLugarRobo()%>"> <% out.print(i.getLugarRobo()); %></option>
		    
		    <%
				}
			%>
		</select><br><br>
	</div>
	  <div class="form__field">
	  	<input type = "submit" value = "Continuar" Required><br> 
      </div>  		
	</form>
	</div>
	
	    <div class="containerHome">
            <a button type="button" class="btn btn-outline-danger" href="HomeTuneada.jsp">Volver a la home</a>
        </div>
        
        
            <footer class="footer text-center">
                Panel de la faccion de Prosegur en [BA:RP] || 
                    <a href="https://github.com/Luchoragusa">Luciano Ragusa</a> || 
                    <a href="https://github.com/JuaniPucheta">Juan Ignacio Pucheta</a>.|| 
                    <a href="https://github.com/CamiloPereyra">Camilo Pereyra</a>.
            </footer>
</body>
</html>













