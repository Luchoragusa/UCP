<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>[PSG]Gestion RanSub</title>
	</head>
	<body>
		<% 
			Integrante i = new Integrante();
			i.setIdIntegrante(Integer.parseInt(application.getAttribute("idApp").toString()));
			DataIntegrante di = new DataIntegrante();
			i=di.getByIdIntegrante(i);
			
			int idSub = Integer.parseInt(request.getParameter("sub")); 
		%>
		<form action="guardarSubS?idInte=<%=i.getIdIntegrante()%>&idSub=<%=idSub%>" method="post">
			Rango Sub-division
			
			<h4 >Rango de sub-division actual: 
			<% if(i.getSub() != null) out.print(i.getSub().getRanSub().getFirst().getNombreRangoSub()); else out.print("No pertenece a ninguna subdivision"); %> </h4>
			
       		<select name="ranSub">
				<%
	 				DataRan_Subdivision drs = new DataRan_Subdivision();
	 				LinkedList<Ran_Subdivision> listaRanSub = new LinkedList<Ran_Subdivision>();
	 				Ran_Subdivision rsub = new Ran_Subdivision();
	 				rsub.setIdSub(idSub);
	 				listaRanSub = drs.getByIdSub(rsub);
	 			%>
	       		<option value = ""> 
		        <%out.print("Seleccionar"); %></option>
	 			<%
	 				for(Ran_Subdivision rs :  listaRanSub) {
	 			%>
		        <option value="<%=rs.getIdRanSub()%>">
		        <%=rs.getNombreRangoSub()%></option>
			    <%
					}
				%>
			</select><br><br>
			<input type = "submit" value = "Guardar Subdivision" ><br><br>
		</form>	
</body>
</html>


