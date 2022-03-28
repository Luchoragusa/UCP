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
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Xtreme lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Xtreme admin lite design, Xtreme admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
        content="Xtreme Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <!-- Este texto de aca es el que aparece arriba en la pestana de google -->
    <title>[PSG] Panel Usuario</title> 
    <link rel="canonical" href="https://www.wrappixel.com/templates/xtreme-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/favicon.png">
    <!-- Custom CSS -->
    <link href="./assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="./dist/css/style.min.css" rel="stylesheet">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="//code.tidio.co/p26dt4g3heql4zxjwvkmcyecxl33ssqy.js" async></script> 
<style>
	a.nav-item.nav-link.active:hover {color:#000000; background:#ffe635 }
</style>
</head>

<body>
		<%
		int idRol = 0;
		int userid = 0;
		Integrante usuarioOnline = new Integrante();
		if (session.getAttribute("id") == null)
			response.sendRedirect("LoginTuneado.jsp");
		else 
		{
			userid = Integer.parseInt(session.getAttribute("id").toString());
			
			usuarioOnline.setIdIntegrante(userid);
			
			DataIntegrante dataint = new DataIntegrante();
			
			usuarioOnline = dataint.getByIdIntegrante(usuarioOnline);
			
			idRol = Integer.parseInt(session.getAttribute("rol").toString());
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
                    <a class="navbar-brand" href="oldIndex.html">
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
                                 <div class="user-pic"><img src="./assets/images/Prosegur.jpg" alt="users"
                                        class="light-logo" width="50" /></div>
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
                                        <a class="dropdown-item" href="configuracion.jsp"><i
                                                class="ti-settings m-r-5 m-l-5"></i>Configuración</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End User Profile-->
                        </li>

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
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="AplicarSancionTuneado.jsp" aria-expanded="false"><i class="mdi mdi-note-text" ></i><span
                                class="hide-menu">Sanciones</span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="RegistrarStockArmaTUNEADO.jsp" aria-expanded="false"><i class="mdi mdi-pistol" ></i><span
                                class="hide-menu">Mis armas</span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="AltaIntegranteTuneado.jsp" aria-expanded="false"><i class="mdi mdi-account-edit"></i><span
                                class="hide-menu">Alta Integrante</span></a>
                        </li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="GestionInt_1.jsp" aria-expanded="false"><i class="mdi mdi-account-check"></i><span
                                class="hide-menu">Gestion Integrante</span></a>
                        </li>                                

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
                <!-- Tabla del inicio (psg en servicio) -->
                <!-- ============================================================== -->
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
                                            <th class="border-top-0">Tiempo en servicio</th>
                                            <th class="border-top-0">Subdivision</th>
                                            <th class="border-top-0">Hora de ingreso</th>
                                            <th class="border-top-0">Subdivision</th>>
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
                                                <div class="d-flex align-items-center">
                                                    <div class="m-r-10">
                                                        <img src="./assets/images/users/lucho.jpg" alt="user" width="50" class="rounded-circle">                                                        
                                                    </div>
                                                    <div class="">
                                                        <h4 class="m-b-0 font-16">
	                                                        <a style="color: rgb(0, 58, 248);">
	                                                        	<td>
	                                                        		<%=entry.getNombre() + " " + entry.getApellido() %>
	                                                        	</td>
	                                                        </a>
                                                        </h4>
                                                    </div>
                                                </div>
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
                <!-- ============================================================== -->
                <!-- Table -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Robos recientes ? -->
                <!-- ============================================================== -->

                <!-- SANCIONES -->
                <div class="container-fluid">
                    <!-- ============================================================== -->
                    <!-- Start Page Content -->
                    <!-- ============================================================== -->
                    <div class="row">                                        
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Listado de robos del equipo PSG</h4>
                                    <h5 class="card-subtitle">En esta sección se mostrarían los robos hechos por equipo</h5>
                                    <!-- <h6 class="card-subtitle">Formato de tabla tipo <code>.table-striped "Striped rows"</code></h6> -->
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th scope="col">Orden de robos</th>
                                                <th scope="col">Lugar</th>
                                                <th scope="col">Dinero recaudado</th>
                                                <th scope="col">Resultado</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>Kiosco</td>
                                                <td>$1500</td>
                                                <td>Exitoso</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">2</th>
                                                <td>Bar</td>
                                                <td>$15.000</td>
                                                <td>Exitoso</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">3</th>
                                                <td>Banco Nación</td>
                                                <td>$0</td>
                                                <td>Fracaso</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>                                                            
                    </div>
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
                <!-- Recent comment and chats -->
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
    <!--This page JavaScript -->
    <!--chartis chart-->
    <script src="./assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="./assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="./dist/js/pages/dashboards/dashboard1.js"></script>
    
</body>

</html>