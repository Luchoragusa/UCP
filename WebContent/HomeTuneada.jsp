<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.Collection"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.time.*"%>
<%@page import="java.time.format.*"%>
<%@page import="java.util.concurrent.LinkedBlockingDeque"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Xtreme lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Xtreme admin lite design, Xtreme admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
        content="Xtreme Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <title>[PSG] Panel Usuario</title> 
    <link rel="canonical" href="https://www.wrappixel.com/templates/xtreme-admin-lite/" />
    <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/favicon.png">
    <link href="./assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="./dist/css/style.min.css" rel="stylesheet">
<script src="//code.tidio.co/p26dt4g3heql4zxjwvkmcyecxl33ssqy.js" async></script> 
	<style>
		a.nav-item.nav-link.active:hover {color:#000000; background:#ffe635 }
	</style>
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
    <!-- ================== -->
    <!-- 	Preloader 
    <!-- ================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ========================= -->
    <!-- 		Main wrapper 
    <!-- ========================= -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <!-- ==================== -->
        <!-- 	Topbar header
        <!-- ==================== -->
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin5">
                    <!-- =================== -->
                    <!-- 		Logo 
                    <!-- =================== -->
                    <a class="navbar-brand" href="oldIndex.html">
                        <!-- Logo icon -->
                        <b class="logo-icon">
                            <img src="./assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                            <img src="./assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                        </b>
                        <!-- Logo text -->
                        <span class="logo-text">
                            <img src="./assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                            <img src="./assets/images/logo-light-text.png" class="light-logo" alt="homepage" />
                        </span>
                    </a>
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i
                            class="ti-menu ti-close"></i></a>
                </div>
                <!-- ================== -->
                <!-- 	End Logo 
                <!-- ================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <!-- =========================== -->
                    <!-- 	toggle and nav items 
                    <!-- =========================== -->              
                        <div class="container h-100">
                            <div class="d-flex justify-content-center h-100">
                            <div class="searchbar">
                                <input class="search_input" type="text" name="" placeholder="Buscar...">
                                <a href="#" class="search_icon"><i class="fas fa-search"></i></a>
                            </div>
                            </div>
                        </div>
                    <!-- ====================================== -->
                    <!-- 	Lado derecho toggle y nav items 
                    <!-- ====================================== -->
                    <ul class="navbar-nav float-end">
                        <!-- ====================== -->
                        <!--	 Cerrar sesión 
                        <!-- ====================== -->
                        <ul class="navbar-nav ml-auto">
                            <li><a href="LoginTUNEADO.jsp" class="nav-item nav-link active">Cerrar sesión</a></li>
                        </ul>  
                    </ul>
                </div>
            </nav>
        </header>
        <!-- =======================-->
        <!-- 	End Topbar header
        <!-- ======================= -->
        <!-- ============================ -->
        <!-- 	Sidebar a la izquierda
        <!-- ============================ -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <div class="scroll-sidebar">
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li>
                            <!-- Perfil de usuario -->
                            <div class="user-profile d-flex no-block dropdown m-t-20">
                                 <div class="user-pic"><img src="./assets/images/Prosegur.jpg" alt="users"
                                        class="light-logo" width="50" /></div>
                                <div class="user-content hide-menu m-l-10">
                                    <a href="#" class="" id="Userdd" role="button"
                                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <h5 class="m-b-0 user-name font-medium">

                                    		<%=usuarioOnline.getNombre() + " " + usuarioOnline.getApellido()%>

                                        <i class="fa fa-angle-down"></i></h5>
                                        <span class="op-5 user-email">DiscordName</span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="Userdd">
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="configuracion.jsp"><i
                                                class="ti-settings m-r-5 m-l-5"></i>Configuración</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Fin de perfil de usuario -->
                        </li>

                        <!-- Bitacora del servicio-->
                        <li class="p-15 m-t-10"><a href="BitacoraTuneado.jsp"
                                class="btn d-block w-100 create-btn text-white no-block d-flex align-items-center"><i
                                    class="fa fa-plus-square"></i> <span class="hide-menu m-l-5">Panel Bitácora</span> </a>
                        </li>
                        <!-- Fin Bitacora del servicio-->
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="HomeTuneada.jsp" aria-expanded="false"><i class="mdi mdi-home"></i><span
                                    class="hide-menu">Home</span></a>
                        </li>
                        
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="RLR_Tuneado.jsp" aria-expanded="false"><i class="mdi mdi-bank"></i><span
                                class="hide-menu">Robo</span></a>
                        </li>  
                                 
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                                href="miPerfilTUNEADO.jsp" aria-expanded="false">
                                <i class="mdi mdi-account-network"></i>
                                <span class="hide-menu">Mi Perfil</span></a>
                        </li>
                        
                        <!-- Show/Hide opciones en base a rol -->
                        <% if(idRol==1 || idRol==2){ %>
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
            </div>
        </aside>
        <!-- ========================== -->
        <!-- 		Page wrapper  
        <!-- ========================== -->
        <div class="page-wrapper">
                <!-- ======================================= -->
                <!-- Tabla del inicio (psg en servicio) -->
                <!-- ======================================= -->
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <!-- Titulo -->
                                <div class="d-md-flex">
                                    <div>
                                        <h3 class="card-text">[PSG EN SERVICO]</h3>
                                    </div>
                                </div>
                            </div>
                                <!-- Listado -->                           
                            <div class="table-responsive">
                                <table class="table v-middle">
                                        <tr class="bg-light">
                                            <th class="border-top-0">Nombre y Apellido</th>
                                            <th class="border-top-0">Rango</th>
                                            <th class="border-top-0">Fecha y Hora de ingreso</th>
                                            <th class="border-top-0">Tiempo en servicio</th>
                                            <th class="border-top-0">Subdivision</th>
                                        </tr>
                                    <%
										LinkedList<Integrante> uActivos = new LinkedList<>();
										DataIntegrante di = new DataIntegrante();
										uActivos = di.getServicio();
										DateTimeFormatter isoHora = DateTimeFormatter.ISO_LOCAL_TIME;
                                        DateTimeFormatter isoFecha = DateTimeFormatter.ISO_LOCAL_DATE;
										for(Integrante entry :  uActivos) {
                                    		Hora hr = entry.getHora().getFirst();
											Duration diferencia = Duration.between(entry.getHora().getFirst().getInicio(), LocalDateTime.now());
									%>
                                    
                                        <tr>
                                            <td>
                                                <%=entry.getNombre() + " " + entry.getApellido() %>
                                            </td>
                                            <td><%=entry.getRanInt().getRango().getNomRango() %></td>
                                            <td>
                                            	<%=(hr.getInicio().format(isoHora) +" || "+ hr.getInicio().format(isoFecha))%>
											</td>
                                            <td>
                                            	<%=(LocalTime.of(diferencia.toHoursPart(), diferencia.toMinutesPart()))%>
                                            </td>
                                            <td>
                                                <label class="label label-danger">
                                                		<%
															String nSub = entry.getSub().getDescripcion();
															if(nSub != null)
																out.println(nSub);
															else
																out.println("Sin Sub");
														%>
												</label>
                                            </td>
                                            
                                        </tr> 
                                        <%
											}
										%>                          
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container-fluid">
                    <!-- ============================== -->
                    <!-- 	Robos recientes -->
                    <!-- ============================== -->
                    <div class="row">                                        
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Listado de robos de PSG.</h4>
                                    <h5 class="card-subtitle">En esta sección se mostrarían los robos ultimos robos asistidos.</h5>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th scope="col">Nro de robos</th>
                                                <th scope="col">Resultado</th>
                                                <th scope="col">Fecha</th>
                                                <th scope="col">Lugar</th>
                                                <th scope="col">Nivel de robo</th>
                                            </tr>
                                        </thead>
                                   	<%
	                            		DataRobo dr = new DataRobo();
	                            		LinkedList<Robo> robos = dr.getAllRobosIntegrante(usuarioOnline);
                            			LugarRobo lug = new LugarRobo();

	                            		for(Robo r : robos){          
	                      			
	                            			lug = r.getLugar_robo();
									%>
                                            <tr>
                                                <td scope="row">
                                                	<%=r.getNroRobo() %>
                                                </td>
                                                <td>
                                                	<%=r.getResultado() %>
                                                </td>
                                                <td>
                                                	<%=r.getFecha_robo() %>
                                                </td>
                                                <td>
                                                	<%=lug.getLugarRobo() %>
                                                </td>
                                                <td>
                                                	<%=lug.getTipoRobo() %>
                                                </td>
                                            </tr>
                                    <%
											}
									%>  
                                    </table>
                                </div>
                            </div>
                        </div>                                                            
                    </div>
                </div>
            </div>
            <!-- ======================== -->
            <!-- 		footer -->
            <!-- ======================== -->
            <footer class="footer text-center">
                Panel de la faccion de Prosegur en [BA:RP] ||
                    <a href="https://github.com/Luchoragusa">Luciano Ragusa</a> || 
                    <a href="https://github.com/JuaniPucheta">Juan Ignacio Pucheta</a>.|| 
                    <a href="https://github.com/CamiloPereyra">Camilo Pereyra</a>.
            </footer>
        </div>
        <!-- ========================== -->
        <!-- 	End Page wrapper  -->
        <!-- ========================== -->
    <!-- ============================= -->
    <!-- 		End Wrapper -->
    <!-- ============================= -->

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
    <!--chartis chart-->
    <script src="./assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="./assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="./dist/js/pages/dashboards/dashboard1.js"></script>
    
</body>
</html>