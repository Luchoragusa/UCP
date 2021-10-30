<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>[PSG]Gestion integrante</title>
	</head>
	<body>
	
		<table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
			<tr bgcolor=grey>
				<th>Nombre y apellido</th>
				<th>Rango</th>
				<th>SubDivision</th>	
				<th>Discord Id</th>	
			</tr>
			<%
				LinkedList<Integrante> integrantes = new LinkedList<>();
				DataIntegrante di = new DataIntegrante();
				integrantes = di.getAll();
				for(Integrante i :  integrantes) {
			%>
				<tr>
					<th> <a href='gestionIntegrante2.jsp?id=<%=i.getIdIntegrante()%>'><%=i.getNombre() + " " +  i.getApellido()%></a> </th>
					<th> <%=i.getRango().getNomRango() %> </th>
					<th> <%
							String nSub = i.getSub().getDescripcion();
							if(nSub != null)
								out.println(nSub);
							else
								out.println("Sin Sub");
					%> </th>
					<th> <%=i.getDiscordId() %> </th>
				</tr>
			<%
				}
			%>
		</table><br>
	</body>
</html>