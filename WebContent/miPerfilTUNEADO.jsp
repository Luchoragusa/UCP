<%@page import="entities.*"%>
<%@page import="data.*"%>
<%@page import="java.time.*"%>
<%@page import="java.time.format.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.LinkedList"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Xtreme lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Xtreme admin lite design, Xtreme admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
        content="Xtreme Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <title>[PSG]Panel Mi Perfil</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/xtreme-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/favicon.png">
    <!-- Custom CSS -->
    <link href="./dist/css/style.min.css" rel="stylesheet">
    <link href="./dist/css/entrarsalir.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="//code.tidio.co/p26dt4g3heql4zxjwvkmcyecxl33ssqy.js" async></script>

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
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin5">
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <a class="navbar-brand" href="HomeTuneada.jsp">
                        <!-- Logo icon -->
                        <b class="logo-icon">
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="./assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                            <!-- Light Logo icon -->
                            <img src="./assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text -->
                        <span class="logo-text">
                            <!-- dark Logo text -->
                            <img src="./assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                            <!-- Light Logo text -->
                            <img src="./assets/images/logo-light-text.png" class="light-logo" alt="homepage" />
                        </span>
                    </a>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i
                            class="ti-menu ti-close"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <div class="container h-100">
                        <div class="d-flex justify-content-center h-100">
                        <div class="searchbar">
                            <input class="search_input" type="text" name="" placeholder="Buscar...">
                            <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
                        </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-end">
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <ul class="navbar-nav ml-auto">
                            <li><a href="LoginTUNEADO.jsp" class="nav-item nav-link active">Cerrar sesión</a></li>
                        </ul> 
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <!-- User Profile-->
                        <li>
                            <!-- User Profile-->
                            <div class="user-profile d-flex no-block dropdown m-t-20">
                                <div class="user-pic"><img src="./assets/images/Prosegur.jpg" alt="users" class="light-logo" width="50" /></div>
                                <div class="user-content hide-menu m-l-10">
                                    <a href="#" class="" id="Userdd" role="button"
                                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <h5 class="m-b-0 user-name font-medium">

                                    		<%=usuarioOnline.getNombre() + " " + usuarioOnline.getApellido() %>

                                        <i class="fa fa-angle-down"></i></h5>
                                        <span class="op-5 user-email">DiscordName</span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="Userdd">
                                        <div class="dropdown-divider"></div>
                                        	<a class="dropdown-item" href="configuracion.jsp"><i class="ti-settings m-r-5 m-l-5"></i>Configuración</a>
                                    </div>
                                </div>
                            </div>
                            
                        <!-- Bitacora del servicio-->
                        <li class="p-15 m-t-10"><a href="BitacoraTuneado.jsp"
                                class="btn d-block w-100 create-btn text-white no-block d-flex align-items-center"><i
                                    class="fa fa-plus-square"></i> <span class="hide-menu m-l-5">Panel Bitácora</span> </a>
                        </li>
                        <!-- Son todas las opciones del costado a la izq-->

                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="HomeTuneada.jsp" aria-expanded="false"><i class="mdi mdi-home"></i><span
                                    class="hide-menu">Home</span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="registrarLugarRobo.jsp" aria-expanded="false"><i class="mdi mdi-bank"></i><span
                                class="hide-menu">Robo</span></a>
                        </li>           
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="miPerfilTUNEADO.jsp" aria-expanded="false">
                                <i class="mdi mdi-account-network"></i>
                                <span class="hide-menu">Mi Perfil</span></a>
                        </li>
                        <% if(idRol==1){ %>
                       	<li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="AplicarSancionTuneado.jsp" aria-expanded="false">
                            <i class="mdi mdi-note-text" ></i>
	                        <span class="hide-menu">Sanciones</span></a>
                        </li>
	                    <%} %> 
	                                              
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="RegistrarStockArmaTUNEADO.jsp" aria-expanded="false"><i class="mdi mdi-pistol" ></i><span
                                class="hide-menu">Mis armas</span></a>
                        </li>
                        
                        <% if(idRol==1){ %>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="AltaIntegranteTuneado.jsp" aria-expanded="false"><i class="mdi mdi-account-edit"></i><span
                                class="hide-menu">Alta Integrante</span></a>
                        </li>

                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="GestionInt_1.jsp" aria-expanded="false"><i class="mdi mdi-account-check"></i><span
                                class="hide-menu">Gestion Integrante</span></a>
                        </li>                                
	                    <%} %>   
                    </ul>

                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row align-items-center">
                    <div class="col-2">
                        <h4 class="page-title">Perfil</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="HomeTuneada.jsp">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Mi perfil</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <div class="row">
                    <!-- Column -->
                    <div class="col-lg-4 col-xlg-3 col-md-5">
                        <div class="card">
                            <div class="card-body">

                                    <div class="preview text-center">
                                        <img class="preview-img" src="http://simpleicon.com/wp-content/uploads/account.png" alt="Preview Image" width="200" height="200"/>
                                        <span class="Error"></span>
                                    </div>
                                    <h4 class="card-title m-t-10"><%=usuarioOnline.getNombre() + " " + usuarioOnline.getApellido()%></h4>

                            </div>                          
                            <div>
                                <hr>
                            </div>
                            <div class="card-body">
                                <h2 align="center">Sanciones</h2>
							<table  cellspacing="2" cellpadding="10" border="2">	
								<tr bgcolor=#FA8369>
									<th>Tipo Sancion</th>
									<th>Numero Sancion</th>
									<th>Estado de la sancion</th>
									<th>Fecha</th>
									<th>URL</th>
								</tr>
								<% 
									LinkedList<Sancion> listaS = usuarioOnline.getSancion();
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
								</tr>
								<%
									}
								%>
							</table><br>
							
                            <h2 align="center">Bitacoras</h2>
                                <table cellspacing="2" cellpadding="10" border="2">	
                                    <tr bgcolor=#FFDF4F>
													<th>Inicio</th>
													<th>Fin</th>
													<th>Horas Jugadas</th>		
												</tr>
												<%
	                                                DateTimeFormatter isoHora = DateTimeFormatter.ISO_LOCAL_TIME;
	                                                DateTimeFormatter isoFecha = DateTimeFormatter.ISO_LOCAL_DATE;
													LinkedList<Hora> horas = usuarioOnline.getHora();	
													for(Hora h :  horas) {
												%>
													<tr>
														<th> <%=(h.getInicio().format(isoHora) +" || "+ h.getInicio().format(isoFecha))%> </th>
														<th> <%=(h.getInicio().format(isoHora) +" || "+ h.getInicio().format(isoFecha))%> </th>
														<th> <%=h.getHorasJugadas() %> </th>
												   </tr>
												<%
													}
												%>
												<%	
													LocalTime contadorHorasJugadas = LocalTime.of(0, 0);
													for(Hora h :  horas) 
													{
														if (h.getHorasJugadas() != null)
														{
															contadorHorasJugadas = contadorHorasJugadas.plusHours(h.getHorasJugadas().getHour())
																	.plusMinutes(h.getHorasJugadas().getMinute())
																	.plusSeconds(h.getHorasJugadas().getSecond());
														}
													}
												%>
											</table><br>
									<label class="col-md-12" style="color: blue">
                                    	<p style = "font-family:themify;font-size:19px;font-style:normal;"> Horas totales:</p> 
                                    </label>
                                    <p style = "font-family:themify;font-size:19px;font-style:normal;">
                                    	<%=contadorHorasJugadas%>
                                    </p>
                                    
                                    <label class="col-md-12" style="color: blue">
										<p style = "font-family:themify;font-size:19px;font-style:normal;">Progreso de la semana:</p> 
									</label>
									<progress align="center" id="horasSemana" 
										max="720"
										value="
												<%=(contadorHorasJugadas.getHour()*60 + contadorHorasJugadas.getMinute())%>">
									</progress>
									
									<% 
										DataRobo dr = new DataRobo();
										LinkedList<Integer> por = dr.getPorcentaje(usuarioOnline);
									%>
									<label class="col-md-12" style="color: blue">
										<p style = "font-family:themify;font-size:19px;font-style:normal;">Porcentaje de robos ganados:</p>
									</label>
									
									<progress align="center" id="robos" 
										max="<%=por.get(0)%>"
										value="<%=por.get(1)%>">
									</progress><br><br>
                                <div class="map-box">
                                    <iframe
                                        src="https://www.google.com/maps?q=Rosario%2C%20Provincia%20de%20Santa%20Fe%2C%20Argentina&z=8&t=&ie=UTF8&output=embed"
                                        width="100%" height="150" frameborder="0" style="border:0"
                                        allowfullscreen></iframe>
                                </div>                                 
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                    <!-- Column -->
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">
                            <div class="card-body">
                                <form class="form-horizontal form-material mx-2">
                                    <div class="form-group">
                                        <label class="col-md-12" style="color: #FF8F00">
                                        	<p style = "font-family:Arial; font-size:22px; font-style:oblique;">Nombre completo</p>
                                        </label>
                                        <div class="col-md-12">                                            
                                            <div class="form-control form-control-line">
                                            	<%=usuarioOnline.getNombre() + " " + usuarioOnline.getApellido() %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                     	<label class="col-md-12" style="color: #FF8F00">
                                        	<p style = "font-family:Arial; font-size:22px; font-style:oblique;">Rango</p>
                                        </label>
                                        <div class="col-md-12"> 
                                            <div class="form-control form-control-line">
                                            	<%=usuarioOnline.getRanInt().getRango().getNomRango() %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12" style="color: #FF8F00">
                                        	<p style = "font-family:Arial; font-size:22px; font-style:oblique;">Fecha Ultimo Ascenso</p>
                                        </label>
                                        <div class="col-md-12">
                                            <div class="form-control form-control-line">
                                            	<%=usuarioOnline.getRanInt().getFecha_desde() %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12" style="color: #FF8F00">
                                       		<p style = "font-family:Arial; font-size:22px; font-style:oblique;">Discord ID</p>
                                        </label>
                                        <div class="col-md-12">
                                            <div class="form-control form-control-line">
                                            	<%=usuarioOnline.getDiscordId() %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12" style="color: #FF8F00">
                                        	<p style = "font-family:Arial; font-size:22px; font-style:oblique;">Steam Hex</p>
                                        </label>
                                        <div class="col-md-12">
                                            <div class="form-control form-control-line">
                                            	<%=usuarioOnline.getSteamHex() %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12" style="color: #FF8F00">
                                        	<p style = "font-family:Arial; font-size:22px; font-style:oblique;">Nombre Usuario</p>
                                        </label>
                                        <div class="col-md-12">
                                            <div class="form-control form-control-line">
                                            	<%=usuarioOnline.getUsuario() %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12" style="color: #FF8F00 ">
                                        	<p style = "font-family:Arial; font-size:22px; font-style:oblique;">Sub-Division</p>
                                        </label>
                                        <div class="col-md-12">
                                            <div class="form-control form-control-line">
                                            	<% 	
													if(usuarioOnline.getSub() != null)
													{
														out.println("Nombre sub-division: " + usuarioOnline.getSub().getDescripcion());  %> <br> <%
														out.println("Rango sub-division: " + usuarioOnline.getSub().getRanSub().get(0).getNombreRangoSub()); %> <br> <%
														out.println("Fecha ultimo ascenso:" + usuarioOnline.getSub().getRanSub().get(0).getRsi().getFecha_desde()); %> <br> <%
													}  
													else 
														out.println("No tiene subdivision");
												%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12" style="color: #FF8F00 ">
                                        	<p style = "font-family:Arial; font-size:22px; font-style:oblique;">Bitacoras</p>
                                        </label>
                                        <div class="col-sm-12">
                                            
                                        </div>
                                    </div>

                                    <div class="form-group">                                    
                                        <div class="col-sm-12">   
                                        <input type="submit" onclick = "mostrarForm()"  value="Editar datos personales" id="btn1">   
                                                                                                                     
                                            <form action="editarPerfilS" method="post" id="editarDatos" hidden="">
												Nombre: <input type = "text" name = "nombre" value="<%=usuarioOnline.getNombre()%>"Required><br><br>
												Apellido: <input type = "text" name = "apellido" value="<%=usuarioOnline.getApellido()%>"Required><br><br>
												Discord Id: <input type = "text" name = "discordId" value="<%=usuarioOnline.getDiscordId()%>"Required><br><br>
												Usuario: <input type = "text" name = "usuario" value="<%=usuarioOnline.getUsuario()%>"Required><br><br>
												Contrasenia: <input type = "password" name = "pw" placeholder="Obligatorio" Required><br><br>
												<input type = "submit" value = "Guardar cambios" ><br><br>
											</form>											                                     
                                        </div>                                        
                                    </div>                                    
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                Panel de la faccion de Prosegur en [BA:RP] ||
                    <a href="https://github.com/Luchoragusa">Luciano Ragusa</a> || 
                    <a href="https://github.com/JuaniPucheta">Juan Ignacio Pucheta</a>.|| 
                    <a href="https://github.com/CamiloPereyra">Camilo Pereyra</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
	<script type="text/javascript">
		function mostrarForm()
		{
			document.getElementById('editarDatos').hidden=false;
			document.getElementById('btn1').hidden=true;
		}
	</script>  
    <script src="./assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="./assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./dist/js/app-style-switcher.js"></script>
    <!--Wave Effects -->
    <script src="./dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="./dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="./dist/js/custom.js"></script>
</body>

</html>