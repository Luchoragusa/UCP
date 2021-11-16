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
			
			int idSub = Integer.parseInt(request.getParameter("sub")); // ver como pija pasar este parametro
		%>
		<form action="guardarSubS?idInte=<%=i.getIdIntegrante()%>" method="post">
			Rango Sub-division:
       		<select name="ranSub">
				<%
	 				DataRan_Subdivision drs = new DataRan_Subdivision();
	 				LinkedList<Ran_Subdivision> listaRanSub = new LinkedList<Ran_Subdivision>();
	 				Ran_Subdivision rsub = new Ran_Subdivision();
	 				rsub.setIdSub(idSub);
	 				listaRanSub = drs.getByIdSub(rsub);
	 			%>
	       		<option value="<% if(i.getSub() != null) i.getSub().getIdSub();%>"> 
		        <% if(i.getSub() != null) out.print(i.getSub().getNomSubDivision()); else out.print("No tiene sub"); %></option>
	 			<%
	 				for(Ran_Subdivision rs :  listaRanSub) {
	 			%>
		        <option value="<%=rs.getIdRanSub()%>"> 
		        <%=rs.getNombreRangoSub()%></option>
			    <%
					}
				%>
			</select><br><br>
			
			<%
				request.setAttribute("idSub", idSub);
			%>
			
			<input type = "submit" value = "Guardar Subdivision" ><br><br>
		</form>	
</body>
</html>


