
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>[PSG]Aplicar Sancion</title>
	</head>
	<body> 
		<%
			int userid = 0;
			Integrante i = new Integrante();
			if (session.getAttribute("id") == null)
			response.sendRedirect("LoginTUNEADO.jsp");
		
			else 
			{
				userid = Integer.parseInt(session.getAttribute("id").toString());		
				i.setIdIntegrante(userid);
			
				DataIntegrante dataint = new DataIntegrante();	
				i = dataint.getByIdIntegrante(i);
			}
		%>
	
	<h2 align="center">-- Sanciones --</h2> <br>
		<table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
			<tr bgcolor=blue>
				<th>Tipo Sancion</th>
				<th>Numero Sancion</th>
				<th>Estado de la sancion</th>
				<th>Fecha</th>
				<th>URL</th>
				<th>Apelada</th>
				<th>Elminar</th>
			</tr>
			<% 
				DataSancion ds = new DataSancion();
				LinkedList<Sancion> listaS = ds.getById(i).getSancion();
				for(Sancion s :  listaS) {
			%>
			<tr>
				<th> <%=s.getTipoSancion() %> </th>
				<th> <%=s.getNroSancion() %> </th>
				<th> 
				<%	
					if(s.isEstado())
						out.print("Activa");
					else
						out.print("Apelada");
				%> 
				</th>
				<th> <%=s.getFecha() %> </th>
				<th> 
					<a href="<%=s.getUrlSancion()%>" target="_blank">Url imagen</a> 
				</th>
				<th> 
					<form action="apelarS?idSA=<%=s.getId()%>" method="post">
						<input type ="submit" value = "Apelar" >
					</form>	
				</th>
				<th> 
					<form action="eliminarS?idSE=<%=s.getId()%>" method="post">
						<input type ="submit" value = "Eliminar" >
					</form>	
				</th>
			</tr>
			<%
				}
			%>
		</table><br><br>
	
		<form action="sancionS?idS=<%=i.getIdIntegrante() %>" method="post">
			Tipo de sancion:
			<select name="tipoSancion">
		        <option value="Raya"> Raya </option>
				<option value="Strike"> Strike </option>
	        </select><br><br>
	        Numero de Sancion: 
	        <select name="nroSancion">
		        <option value="1"> 1 </option>
				<option value="2"> 2 </option>
				<option value="3"> 3 </option>
	        </select><br><br>
	        Motivo de la sancion: <input type = "text" name = "motivo" Required><br><br>
	        Imagen (opcional): <input type = "text" name = "url" Required><br><br>
			<input type = "submit" value = "Aplicar Sancion" Required><br>
		</form>
	</body>
</html>