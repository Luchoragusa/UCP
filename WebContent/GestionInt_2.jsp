<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalTime"%>

<!DOCTYPE html>
<html dir="ltr" lang="en">
    
<head>
    <meta charset="UTF-8">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/favicon.png">
    <!-- Custom CSS -->
    <link href="./dist/css/style.min.css" rel="stylesheet">
    <link href="./dist/css/entrarsalir.css" rel="stylesheet">
    <title>[PSG] Gestion Integrante</title>
    <style type="text/css">
    
    .input[type=submit] {
    padding:5px 15px; 
    background:#ccc; 
    border:0 none;
    cursor:pointer;
    -webkit-border-radius: 5px;
    border-radius: 5px; 
    text-align:center;
}
    </style>
</head>

<body>
		<%
			if (session.getAttribute("id") == null)
				response.sendRedirect("LoginTUNEADO.jsp");
		%>
		
		<% 
			DataIntegrante di = new DataIntegrante();
			Integrante i = new Integrante();
			i.setIdIntegrante((int)session.getAttribute("id"));
			i = di.getByIdIntegrante(i);
		%>
    <div class="container">
        <div class="main-body">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="HomeTuneada.jsp">Home</a></li>
            </ol>
            </nav>
            <!-- /Breadcrumb -->    
            <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
                <div class="card">
                <div class="card-body">
                    <div class="d-flex flex-column align-items-center text-center">

                    <!-- Imagen para subir INICIO-->
                    <img src="./assets/images/logo-light-icon.png" alt="Preview Image" width="200" height="200"/>
                    <!-- Imagen para subir FIN-->

                    <div class="mt-3">
                        <h4>ALTA INTEGRANTE</h4>
                        <p class="text-secondary mb-1">Menu de Gestion de integrante.</p>
                        <p class="text-muted font-size-sm">[UCP-PSG] </p>
                        <!--<button class="btn btn-primary">Follow</button>
                        <button class="btn btn-outline-primary">Message</button>-->
                        
                    </div>
                    </div>
                </div>
                </div>
                
            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                <div class="card-body">
                    <div class="row">
                    <div class="col-sm-3">
                        <h6 class="mb-0">Nombre</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        <input type = "text" name = "nombre" value="<%=i.getNombre()%>"Required><br><br>
                    </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3">
                            <h6 class="mb-0">Apellido</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                            <input type = "text" name = "apellido" value="<%=i.getApellido()%>"Required><br><br>
                        </div>
                        </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3">
                            <h6 class="mb-0">DiscordID</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                            <input type = "text" name = "discordId" value="<%=i.getDiscordId()%>"Required><br><br>
                        </div>
                        </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3">
                            <h6 class="mb-0">SteamHex</h6>
                        </div>
                        <div class="col-sm-9 text-secondary">
                            <input type = "text" name = "usuario" value="<%=i.getUsuario()%>"Required><br><br>
                        </div>
                        </div>
                    <hr>
                    <div class="row">
                    <div class="col-sm-3">
                        <h6 class="mb-0">Nombre Usuario</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        <input type = "text" name = "usuario" value="<%=i.getSteamHex()%>"Required><br><br>
                    </div>
                    </div>
                    <hr>
                    <div class="row">
                    <div class="col-sm-3">
                        <h6 class="mb-0">Contraseņa</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        <input type = "submit" onclick = "mostrarForm()" value = "Editar PW" id="btn1"><br><br>
                        <h4 id="lbl1" hidden="">Contrasenia:</h4><input type = "password" id="txt1" name = "pw" hidden="" placeholder="Obligatorio"><br><br>
                    </div>
                    </div>
                    <hr>
                    
                    <%
 						DataRango dr = new DataRango();
 						LinkedList<Rango> lista = new LinkedList<Rango>();
 						lista = dr.getAll();
 					%>
                    <div class="row">
                    <div class="col-sm-3">
                        <h6 class="mb-0">Rango</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        <select name="rango">
				 			<%
				 				for(Rango r :  lista) {
				 			%>
					        <option value="<%=r.getIdRango()%>">
					        	<%=r.getNomRango()%>
					        </option>
						    <%
								}
							%>
						</select><br><br>
                    </div>
                    </div>
                    <hr>
                    
                    <%
		 				DataRol drol = new DataRol();
		 				LinkedList<Rol> listaRol = new LinkedList<Rol>();
		 				listaRol = drol.getAll();
		 			%>
                    <div class="row">
                    <div class="col-sm-3">
                        <h6 class="mb-0">Rol</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        <select name="rol">
				 			<%
				 				for(Rol rol :  listaRol) {
				 			%>
					        <option value="<%=rol.getIdRol()%>"> 
					        	<%=rol.getdescRol()%>
					        </option>
						    <%
								}
							%>
						</select><br><br>
                    </div>
                    </div>                    																	
					
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
						
						<h3 class="card-title" style= "color:red">Sanciones</h3>
						
						<h4 class="card-title" style="color:rgb(246, 117, 117)">Sanciones 
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
					
					</br>
					<input type = "submit" value = "Guardar cambios" ><br><br>

                </div>
                </div>
                
            </div>
            </div>
            </div>
        </div>

</body>
</html>