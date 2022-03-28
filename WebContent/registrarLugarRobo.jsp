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
<script src = "jquery-3.6.0,js"></script>
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
	    <option value="<%=i.getIdLugarRobo()%>"> <!-- No logro conservar la id fuera del for-->
					<% out.print(i.getLugarRobo()); %>
		</option>
	    
	    <%
			}
		%>
	</select><br><br>
	
  	<%
	out.print("Seleccione participantes Max: NI IDEA COMO TRAER EL MAXIMO DE CADA LUGAR ROBO");	
	%>
	<div class = "container">
		<form class = "MaxMin">
			<p>
				Maximo de integrantes:
									<%
										out.print(lr.getMaxIntegrantes());
									%>
				Minimo de integrantes:
									<%
										out.print(lr.getMinIntegrantes());
									%>
		</form>
		<button id="botonEleccion" onclick="ShowHideElement()">Mostrar Max/Min</button>
	</div>


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
	
	
	
<!--  Scripts -->
	<script type="text/javascript">
	
		$(".myForm").hide();
		
		function ShowHideElement(){
			let text = "";
			
			if($("#MaxMin").text() === "Mostrar Max/Min"){
				$(".myForm").show();
			}else{
				$(".myForm").hide();
				text = "Mostrar Max/Min";
			}
			
			$("#MaxMin").html();
		}
	</script>

</body>
</html>
















