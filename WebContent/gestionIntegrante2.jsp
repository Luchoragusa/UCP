<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>[PSG]Gestion integrante2</title>
	</head>
	<body>
		<% 
			Integrante i = new Integrante();
			i.setIdIntegrante(Integer.parseInt(request.getParameter("id")));
			DataIntegrante di = new DataIntegrante();
			i=di.getByIdIntegrante(i);
		%>
		<form action="editarPerfilS" method="post">
			Nombre: <input type = "text" name = "nombre" value="<%=i.getNombre()%>"Required><br><br>
			Apellido: <input type = "text" name = "apellido" value="<%=i.getApellido()%>"Required><br><br>
			Discord Id: <input type = "text" name = "discordId" value="<%=i.getDiscordId()%>"Required><br><br>
			Usuario: <input type = "text" name = "usuario" value="<%=i.getUsuario()%>"Required><br><br>
			SteamHex: <input type = "text" name = "usuario" value="<%=i.getSteamHex()%>"Required><br><br>
			
			Rol:
       		<select name="rol">
       		<%
				DataRol drol = new DataRol();
				LinkedList<Rol> listaRol = new LinkedList<Rol>();
				listaRol = drol.getAll();
       		%>
       		<option value="<%=i.getRol().getIdRol()%>"> 
	        <%=i.getRol().getdescRol()%></option>
 			<%
 				for(Rol rol :  listaRol) {
 			%>
	        <option value="<%=rol.getIdRol()%>"> 
	        <%=rol.getdescRol()%></option>
		    <%
				}
			%>
			</select><br><br>
			
			Rango:
       		<select name="rango">
			<%
 				DataRango dr = new DataRango();
 				LinkedList<Rango> lista = new LinkedList<Rango>();
 				lista = dr.getAll();
 			%>
       		<option value="<%=i.getRanInt().getRango().getIdRango()%>"> 
	        <%=i.getRanInt().getRango().getNomRango()%></option>
 			<%
 				for(Rango r :  lista) {
 			%>
	        <option value="<%=r.getIdRango()%>"> 
	        <%=r.getNomRango()%></option>
		    <%
				}
			%>
			</select><br><br>
			
			<input type = "submit" onclick = "mostrarForm()" value = "Editar PW" id="btn1"><br><br>
			
			<h4 id="lbl1" hidden="">Contrasenia:</h4><input type = "password" id="txt1" name = "pw" hidden="" placeholder="Obligatorio"><br><br>
			
			<input type = "submit" value = "Guardar cambios" ><br><br>
		</form>	
		
		<script type="text/javascript">
			function mostrarForm()
			{
				document.getElementById('txt1').hidden=false;
				document.getElementById('txt1').required=true;
				document.getElementById('lbl1').hidden=false;
				document.getElementById('btn1').hidden=true;
			}
		</script>
		
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
					LinkedList<Sancion> listaS = i.getSancion();
					String url;
					for(Sancion s :  listaS) {
						url = s.getUrlSancion();
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
						<form action="apelarS?id=<%=s.getId()%>" method="post">
							<input type ="submit" value = "Apelar" >
						</form>	
					</th>
					<th> 
						<form action="eliminarS?id=<%=s.getId()%>" method="post">
							<input type ="submit" value = "Eliminar" >
						</form>	
					</th>
				</tr>
				<%
					}
				%>
			</table><br><br>
	</body>
</html>