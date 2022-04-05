<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.*"%>
<%@page import="java.time.format.*"%>


<!DOCTYPE html>
<html dir="ltr" lang="en">
    
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/favicon.png">
    <link href="./dist/css/style.min.css" rel="stylesheet">
    <link href="./dist/css/entrarsalir.css" rel="stylesheet">
    <title>[PSG] Editar Perfil</title>
</head>

<body>
		<%
		int userid = 0;
		int idRol = 0;
		Rol rol = new Rol();
		Integrante usuarioOnline = new Integrante();
		if (session.getAttribute("id") == null)
			response.sendRedirect("LoginTuneado.jsp");
		else 
		{
			userid = Integer.parseInt(session.getAttribute("id").toString());
			usuarioOnline.setIdIntegrante(userid);
			DataIntegrante dataint = new DataIntegrante();
			usuarioOnline = dataint.getByIdIntegrante(usuarioOnline);
			
			idRol = usuarioOnline.getRol().getIdRol();
		}
		%>
    <div class="container">
        <div class="main-body">
            <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="HomeTuneada.jsp">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page"><a href="miPerfilTUNEADO.jsp">Mi perfil</a></li>
            </ol>
            </nav>
            <div class="row gutters-sm">
              <div class="col-md-4 mb-3">
                <div class="card">
                <div class="card-body">
                    <div class="d-flex flex-column align-items-center text-center">

                    <img src="./assets/images/logo-light-icon.png" alt="Preview Image" width="200" height="200"/>

                    <div class="mt-3">
                        <h4>EDITAR PERFIL</h4>
                        <p class="text-secondary mb-1">Ingrese los datos requeridos para editar el perfil en el sistema.</p>                       
                        <p class="text-muted font-size-sm">[UCP-PSG] </p>                
                    </div>
                    </div>
                </div>
                </div>
               </div>
                <div class="col-md-6">
                	<div class="card mb-3">
                		<div class="card-body">
                		<form action="altaIntegranteS" method="post">
                		
                    		<div class="row">
                    			<div class="col-sm-3">
                        			<h6 class="mb-0">Nombre</h6>
                    			</div>
                    			<div class="col-sm-5 text-secondary">
                        			<input type = "text" name = "nombre" value="<%=usuarioOnline.getNombre()%>"Required><br><br>
                    			</div>
                    		</div>
                    		
                    <hr>
                    
                    		<div class="row">
                        		<div class="col-sm-3">
                            		<h6 class="mb-0">Apellido</h6>
                        		</div>
                        		<div class="col-sm-5 text-secondary">
                            		<input type="text" name = "apellido" value="<%=usuarioOnline.getApellido()%>"Required><br><br>
                        		</div>
                        	</div>
                        	
                    <hr>
                    
                    		<div class="row">
                        		<div class="col-sm-3">
                            		<h6 class="mb-0">DiscordID</h6>
                        		</div>
                       			<div class="col-sm-5 text-secondary">
                            		<input type="text" name = "dsId" value="<%=usuarioOnline.getDiscordId()%>"Required><br><br>
                        		</div>
                        	</div>
                        	
                    <hr>
                    
                    		<div class="row">
                        		<div class="col-sm-3">
                            		<h6 class="mb-0">SteamHex</h6>
                        		</div>
                        		<div class="col-sm-5 text-secondary">
                            		<input type="text" name = "steamHex" value="<%=usuarioOnline.getSteamHex()%>"Required><br><br>
                        		</div>
                        	</div>
                        	
                    <hr>
                    
                    		<div class="row">
                    			<div class="col-sm-3">
                        			<h6 class="mb-0">Nombre Usuario</h6>
                    			</div>
                    			<div class="col-sm-5 text-secondary">
                        			<input type="text" name = "nombreUsuario" value="<%=usuarioOnline.getUsuario()%>"Required><br><br>
                    			</div>
                    		</div>
                    		
                    <hr>
                    
                    		<div class="row">
                    			<div class="col-sm-3">
                        			<h6 class="mb-0">Contraseña</h6>
                    			</div>
                    			<div class="col-sm-5 text-secondary">
                        			<input type="password" name = "pw"Required><br><br>
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
                    			<div class="col-sm-5 text-secondary">
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
                    			<div class="col-sm-5 text-secondary">
                        			<select name="rol">
							 			<%
							 				for(Rol r :  listaRol) {
							 			%>
								        <option value="<%=rol.getIdRol()%>"> 
								        	<%=r.getdescRol()%>
								        </option>
									    <%
											}
										%>
									</select><br><br>
                    			</div>
                    		</div>
                    
                    <hr>
                    
                    <div class="row">
	                    <div class="col-sm-12" align="center">
							<input type = "submit" class="btn btn-primary" value = "Guardar Cambios"><br>                    
						</div>
                    </div>
                    </form>
                </div>
               </div>
                
            </div>

          </div>
         </div>
        </div>
        
        
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full" data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        	 <footer class="footer text-center">
                Panel de la faccion de Prosegur en [BA:RP] ||
                    <a href="https://github.com/Luchoragusa">Luciano Ragusa</a> || 
                    <a href="https://github.com/JuaniPucheta">Juan Ignacio Pucheta</a>|| 
                    <a href="https://github.com/CamiloPereyra">Camilo Pereyra</a>
            </footer>
        </div>
</body>
</html>