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
    <title>[PSG] Alta Integrante</title>
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
                <li class="breadcrumb-item active" aria-current="page"><a href="miPerfilTUNEADO.jsp">Mi perfil</a></li>
            </ol>
            </nav>
            <!-- /Breadcrumb -->    
            <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
                <div class="card">
                <div class="card-body">
                    <div class="d-flex flex-column align-items-center text-center">

                    <!-- Imagen para subir INICIO-->
                    <img src="./assets/images/users/lucho.jpg" alt="user" class="rounded-circle" width="175">
                    <!-- Imagen para subir FIN-->

                    <div class="mt-3">
                        <h4><%=i.getNombre() + " " + i.getApellido() %></h4>
                        <p class="text-secondary mb-1"><%=i.getRanInt().getRango().getNomRango() %></p>
                        <p class="text-muted font-size-sm">Rosario, ARG</p>
                        <!--<button class="btn btn-primary">Follow</button>
                        <button class="btn btn-outline-primary">Message</button>-->
                        
                    </div>
                    </div>
                </div>
                </div>
                
            </div>
            <form action="altaIntegranteS" method="post">
                <div class="col-md-8">
                	<div class="card mb-3">
                		<div class="card-body">
                    		<div class="row">
                    			<div class="col-sm-3">
                        			<h6 class="mb-0">Nombre</h6>
                    			</div>
                    			<div class="col-sm-9 text-secondary">
                        			<input type = "text" name = "nombre" Required><br><br>
                    			</div>
                    		</div>
                    		
                    <hr>
                    
                    		<div class="row">
                        		<div class="col-sm-3">
                            		<h6 class="mb-0">Apellido</h6>
                        		</div>
                        		<div class="col-sm-9 text-secondary">
                            		<input type="text" name = "apellido" Required><br><br>
                        		</div>
                        	</div>
                        	
                    <hr>
                    
                    		<div class="row">
                        		<div class="col-sm-3">
                            		<h6 class="mb-0">DiscordID</h6>
                        		</div>
                       			<div class="col-sm-9 text-secondary">
                            		<input type="text" name = "dsId" Required><br><br>
                        		</div>
                        	</div>
                        	
                    <hr>
                    
                    		<div class="row">
                        		<div class="col-sm-3">
                            		<h6 class="mb-0">SteamHex</h6>
                        		</div>
                        		<div class="col-sm-9 text-secondary">
                            		<input type="text" name = "steamHex" Required><br><br>
                        		</div>
                        	</div>
                        	
                    <hr>
                    
                    		<div class="row">
                    			<div class="col-sm-3">
                        			<h6 class="mb-0">Nombre Usuario</h6>
                    			</div>
                    			<div class="col-sm-9 text-secondary">
                        			<input type="text" name = "nombreUsuario" Required><br><br>
                    			</div>
                    		</div>
                    		
                    <hr>
                    
                    		<div class="row">
                    			<div class="col-sm-3">
                        			<h6 class="mb-0">Contrase�a</h6>
                    			</div>
                    			<div class="col-sm-9 text-secondary">
                        			<input type="password" name = "pw" Required><br><br>
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
                    
                    <hr>
                    
                    <div class="row">
	                    <div class="col-sm-12">
							<input type = "submit" value = "Agregar"><br>                    
						</div>
                    </div>
                </div>
               </div>
                
            </div>
           </form>

          </div>
         </div>
        </div>
</body>
</html>