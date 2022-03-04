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
			application.setAttribute("idApp", i.getIdIntegrante());
			DataIntegrante di = new DataIntegrante();
			i=di.getByIdIntegrante(i);
		%>
		<form action="editarPerfilS?idInte=<%=i.getIdIntegrante()%>" method="post">
		
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
		
		<input type = "submit" onclick = "mostrarFormSub()" value = "Editar Sub-division" id="btn2"><br><br>
		
		<script type="text/javascript">
			function mostrarFormSub()
			{
				document.getElementById('frmSub').hidden=false;
				document.getElementById('btn2').hidden=true;
			}
		</script>
		
		<%int idSub = 0; %>
		
		<form id="frmSub" hidden="" id="subId" onchange ="selectRanSub()" action="gestionRanSub.jsp?idSub="<%=idSub%>>
			
			<h4 >Sub-division</h4>
			
			<h4 >Sub-division actual: 
			<% if(i.getSub() != null) out.print(i.getSub().getDescripcion()); else out.print("No pertenece a ninguna subdivision"); %> </h4>
		
       		<select name="sub">
				<%
	 				DataSubdivision ds = new DataSubdivision();
	 				LinkedList<Subdivision> listaSub = new LinkedList<Subdivision>();
	 				listaSub = ds.getAll();
	 			%>
	       		<option value = ""> 
		        <%out.print("Seleccionar"); %></option>
	 			<%
	 				for(Subdivision s :  listaSub) {
	 			%>
		        <option value="<%=s.getIdSub()%>"> 
		        <%=s.getDescripcion()%></option>
			    <%
					}
				%>
				
			</select><br><br>
			
			<% session.setAttribute("idSub", idSub);%>
			
			<input type = "submit" value = "Asignar Rango Sub division"><br><br>
		</form>


		<form action="aplicarSancion.jsp">
			<input type = "submit" value = "Aplicar Sancion"><br><br>
		</form>
			
		<form action="deleteIntegranteS?idInte=<%=i.getIdIntegrante()%>" method="post">
			<input type = "submit" value = "Eliminar" ><br>
		</form>
		
	</body>
</html>