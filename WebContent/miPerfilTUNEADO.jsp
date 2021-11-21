<%@page import="entities.*"%>
<%@page import="data.*"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalTime"%>
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
    <title>Panel Mi Perfil</title>
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

<style type="text/css">
    .whos-speaking-area .speakers {
    -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    transition: all 0.4s;
    border: 1px solid #dee2e6;
    border-radius: 6px;
}
.whos-speaking-area .speakers:hover {
    -webkit-box-shadow: 0 0 6px 5px #ddd;
    box-shadow: 0 0 6px 5px #ddd;
    border-radius: 6px;
    -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    transition: all 0.4s;
    border: 1px solid #dee2e6;
}
.whos-speaking-area .speakers .spk-img {
    position: relative;
}
.whos-speaking-area .speakers .spk-img:before {
    background: rgba(91, 69, 213, 0.8);
    content: "";
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    -webkit-transform: scale(0);
    -ms-transform: scale(0);
    transform: scale(0);
    -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    transition: all 0.4s;
    z-index: 5;
}
.whos-speaking-area .speakers .spk-img:hover:before {
    -webkit-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1);
}
.whos-speaking-area .speakers .spk-img img {
    width: 100%;
    border-top-left-radius: 6px;
    border-top-right-radius: 6px;
}
.whos-speaking-area .speakers .spk-img ul {
    position: absolute;
    display: inline-block;
    top: 35%;
    left: 40%;
    width: 100px;
    line-height: 3;
    opacity: 0;
    -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    transition: all 0.4s;
}
.whos-speaking-area .speakers .spk-img ul:before {
    position: absolute;
    content: "";
    height: 110px;
    width: 110px;
    background: transparent;
    top: -15%;
    left: -15px;
    border: 1px solid #fff;
    -webkit-transform: rotate(44deg) scale(1.4);
    -ms-transform: rotate(44deg) scale(1.4);
    transform: rotate(44deg) scale(1.4);
    opacity: 0;
    -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    transition: all 0.4s;
}
.whos-speaking-area .speakers .spk-img ul li {
    display: inline-block;
    margin: 0 3px;
    -webkit-transform: perspective(50px) rotatey(80deg);
    transform: perspective(50px) rotatey(80deg);
    -webkit-transition: all 0.5s ease 0.2s;
    -o-transition: all 0.5s ease 0.2s;
    transition: all 0.5s ease 0.2s;
    margin: 0 5px;
}
.whos-speaking-area .speakers .spk-img ul li a i.fa {
    color: rgba(255, 78, 0, 0.8);
    font-size: 18px;
    -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    transition: all 0.4s;
    width: 28px;
    color: #fff;
    height: 28px;
    line-height: 21px;
    text-align: center;
}
.whos-speaking-area .speakers .spk-img ul li a i.fa:hover {
    color: #cf057c;
}
.whos-speaking-area .speakers .spk-img ul li:nth-child(1) {
    -webkit-transform: translate3d(-53px, -50px, 0);
    transform: translate3d(-53px, -50px, 0);
}
.whos-speaking-area .speakers .spk-img ul li:nth-child(2) {
    -webkit-transform: translate3d(53px, -50px, 0);
    transform: translate3d(53px, -50px, 0);
}
.whos-speaking-area .speakers .spk-img ul li:nth-child(3) {
    -webkit-transform: translate3d(-53px, 50px, 0);
    transform: translate3d(-53px, 50px, 0);
}
.whos-speaking-area .speakers .spk-img ul li:nth-child(4) {
    -webkit-transform: translate3d(53px, 50px, 0);
    transform: translate3d(53px, 50px, 0);
}
.whos-speaking-area .speakers .spk-img:hover ul {
    left: 35%;
    opacity: 1;
    z-index: 9;
}
.whos-speaking-area .speakers .spk-img:hover ul:before {
    opacity: 1;
    -webkit-transform: rotate(44deg) scale(1);
    -ms-transform: rotate(44deg) scale(1);
    transform: rotate(44deg) scale(1);
}
.whos-speaking-area .speakers .spk-img:hover ul li:nth-child(1),
.whos-speaking-area .speakers .spk-img:hover ul li:nth-child(2),
.whos-speaking-area .speakers .spk-img:hover ul li:nth-child(3),
.whos-speaking-area .speakers .spk-img:hover ul li:nth-child(4) {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
}
.whos-speaking-area .speakers .spk-info {
    text-align: center;
    padding: 30px 0;
}
.whos-speaking-area .speakers .spk-info h3 {
    color: #252525;
    font-size: 20px;
    line-height: 20px;
    margin-bottom: 5px;
    -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    transition: all 0.4s;
    text-transform: capitalize;
}
.whos-speaking-area .speakers .spk-info h3:hover {
    color: #4125dd;
}
.whos-speaking-area .speakers .spk-info p {
    font-size: 15px;
    margin-bottom: 0;
    color: #656565;
}

.whos-speaking-area-two .title-text h2 {
    color: #fff;
}

.whos-speaking-area-two .speakers {
    position: relative;
    overflow: hidden;
}
.whos-speaking-area-two .speakers:hover img {
    -webkit-transform: translate3d(0px, 0px, 0px);
    transform: translate3d(0px, 0px, 0px);
}
.whos-speaking-area-two .speakers img {
    position: relative;
    -webkit-transform: translate3d(0px, 0px, 0px);
    transform: translate3d(0px, 0px, 0px);
    -webkit-transition: all 0.3s linear 0s;
    -o-transition: all 0.3s linear 0s;
    transition: all 0.3s linear 0s;
}
.whos-speaking-area-two .speakers .img-overlay {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    opacity: 0;
    background: rgba(91, 69, 213, 0.9);
    -webkit-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
}
.whos-speaking-area-two .speakers:hover .img-overlay {
    opacity: 1;
}
.whos-speaking-area-two .speakers .name a {
    position: absolute;
    bottom: -20%;
    left: 10%;
    color: #fff;
    font-size: 20px;
    font-weight: 600;
    text-transform: capitalize;
    -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    transition: all 0.4s;
}
.whos-speaking-area-two .speakers .name a:hover {
    color: #cf057c;
}
.whos-speaking-area-two .speakers:hover .name a {
    bottom: 10%;
}
.whos-speaking-area-two .speakers .social-icons {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    position: absolute;
    bottom: 23%;
    left: 0;
    -webkit-transition: all 0.4s;
    -o-transition: all 0.4s;
    transition: all 0.4s;
}
.whos-speaking-area-two .speakers .social-icons li {
    margin-right: 10px;
}
.whos-speaking-area-two .speakers .social-icons li a {
    color: #fff;
}
.whos-speaking-area-two .speakers .social-icons li a:hover {
    color: #252525;
}
.whos-speaking-area-two .speakers:hover .social-icons {
    left: 27px;
}
ul {
    list-style: outside none none;
    margin: 0;
    padding: 0;
    outline: none;
}
.mb50 {
    margin-bottom: 50px;
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
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="./assets/images/users/lucho.jpg" alt="user" class="rounded-circle" width="31">
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end user-dd animated" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="miPerfilTUNEADO.jsp"><i class="ti-user m-r-5 m-l-5"></i>
                                    Mi perfil</a>
                                <a class="dropdown-item" href="registrarStockArmaTUNEADO.jsp"><i class="ti-wallet m-r-5 m-l-5"></i>
                                    Mi inventario</a>
                            </ul>
                        </li>
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
                                <div class="user-pic"><img src="./assets/images/users/lucho.jpg" alt="users"
                                        class="rounded-circle" width="40" /></div>
                                <div class="user-content hide-menu m-l-10">
                                    <a href="#" class="" id="Userdd" role="button"
                                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <h5 class="m-b-0 user-name font-medium">Luciano Ragusa <i
                                                class="fa fa-angle-down"></i></h5>
                                        <span class="op-5 user-email">DiscordName</span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="Userdd">
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="settings.html"><i
                                                class="ti-settings m-r-5 m-l-5"></i>Configuración</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="usted_esta_seguro.html"><i
                                                class="fa fa-power-off m-r-5 m-l-5"></i>Cerrar sesión</a>
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
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link"
                            href="aplicarSancion.jsp" aria-expanded="false"><i class="mdi mdi-cash-usd" ></i><span
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
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row align-items-center">
                    <div class="col-5">
                        <h4 class="page-title">Perfil</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="HomeTuneada.jsp">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Library</li>
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
                                        <div class="browse-button">
                                            <i class="fa fa-pencil-alt"></i>
                                            <input class="browse-input" type="file" required name="UploadedFile" id="UploadedFile"/>
                                        </div>
                                        <span class="Error"></span>
                                    </div>
                                    <h4 class="card-title m-t-10"><%=i.getNombre() + " " + i.getApellido()%></h4>

                            </div>                          
                            <div>
                                <hr>
                            </div>
                      <div class="card-body">                      
						<h2 align="center">-- Sanciones --</h2>
							<table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
								<tr bgcolor=blue>
									<th>Tipo Sancion</th>
									<th>Numero Sancion</th>
									<th>Estado de la sancion</th>
									<th>Fecha</th>
									<th>URL</th>
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
								</tr>
								<%
									}
								%>
							</table><br>
							
							<h2 align="center">-- Bitacoras --</h2>
							<table  align="center" cellspacing="2" cellpadding="2" border="2" width ="500">	
												<tr bgcolor=grey>
													<th>Hora Inicio</th>
													<th>Fecha Inicio</th>
													<th>horaFin</th>
													<th>Fecha Fin</th>	
													<th>Horas Jugadas</th>		
												</tr>
												<%
													LinkedList<Hora> horas = i.getHora();	
													for(Hora h :  horas) {
												%>
													<tr>
														<th> <%=h.getHoraInicio() %> </th>
														<th> <%=h.getFechaInicio() %> </th>
														<th> <%=h.getHoraFin() %> </th>
														<th> <%=h.getFechaFin() %> </th>
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
                                    	<% out.println(contadorHorasJugadas); %>
                                    </p>
                                    
                                    <label class="col-md-12" style="color: blue">
										<p style = "font-family:themify;font-size:19px;font-style:normal;">Progreso de la semana:</p> 
									</label>
									<progress align="center" id="horasSemana" 
										max="720"
										value="
												<% 
												out.print(contadorHorasJugadas.getHour()*60 + contadorHorasJugadas.getMinute());
												%>">
									</progress>
									
									<% 
										DataRobo dr = new DataRobo();
										LinkedList<Integer> por = dr.getPorcentaje(i);
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
                                        <label class="col-md-12" style="color: blue">
                                        	<p style = "font-family:themify;font-size:19px;font-style:normal;">Nombre completo</p>
                                        </label>
                                        <div class="col-md-12">                                            
                                            <div class="form-control form-control-line">
                                            	<%=i.getNombre() + " " + i.getApellido() %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                     	<label class="col-md-12" style="color: blue">
                                        	<p style = "font-family:themify;font-size:19px;font-style:normal;">Rango</p>
                                        </label>
                                        <div class="col-md-12"> 
                                            <div class="form-control form-control-line">
                                            	<%=i.getRanInt().getRango().getNomRango() %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12" style="color: blue">
                                        	<p style = "font-family:themify;font-size:19px;font-style:normal;">Fecha Ultimo Ascenso</p>
                                        </label>
                                        <div class="col-md-12">
                                            <div class="form-control form-control-line">
                                            	<%=i.getRanInt().getFecha_desde() %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12" style="color: blue">
                                       		<p style = "font-family:themify;font-size:19px;font-style:normal;">Discord ID</p>
                                        </label>
                                        <div class="col-md-12">
                                            <div class="form-control form-control-line">
                                            	<%=i.getDiscordId() %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12" style="color: blue">
                                        	<p style = "font-family:themify;font-size:19px;font-style:normal;">Steam Hex</p>
                                        </label>
                                        <div class="col-md-12">
                                            <div class="form-control form-control-line">
                                            	<%=i.getSteamHex() %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12" style="color: blue">
                                        	<p style = "font-family:themify;font-size:19px;font-style:normal;">Nombre Usuario</p>
                                        </label>
                                        <div class="col-md-12">
                                            <div class="form-control form-control-line">
                                            	<%=i.getUsuario() %>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12" style="color: blue">
                                        	<p style = "font-family:themify;font-size:19px;font-style:normal;">Sub-Division</p>
                                        </label>
                                        <div class="col-md-12">
                                            <div class="form-control form-control-line">
                                            	<% 	
													if(i.getSub() != null)
													{
														out.println("Nombre sub-division: " + i.getSub().getDescripcion());  %> <br> <%
														out.println("Rango sub-division: " + i.getSub().getRanSub().get(0).getNombreRangoSub()); %> <br> <%
														out.println("Fecha ultimo ascenso:" + i.getSub().getRanSub().get(0).getRsi().getFecha_desde()); %> <br> <%
													}  
													else 
														out.println("No tiene subdivision");
												%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12" style="color: blue">
                                        	<p style = "font-family:themify;font-size:19px;font-style:normal;">Bitacoras</p>
                                        </label>
                                        <div class="col-sm-12">
                                            
                                        </div>
                                    </div>

                                    <div class="form-group">                                    
                                        <div class="col-sm-12">   
                                        <input type="submit" onclick = "mostrarForm()"  value="Editar datos personales" id="btn1">                                                                                
                                            <form action="editarPerfilS" method="post" id="editarDatos" hidden="">
												Nombre: <input type = "text" name = "nombre" value="<%=i.getNombre()%>"Required><br><br>
												Apellido: <input type = "text" name = "apellido" value="<%=i.getApellido()%>"Required><br><br>
												Discord Id: <input type = "text" name = "discordId" value="<%=i.getDiscordId()%>"Required><br><br>
												Usuario: <input type = "text" name = "usuario" value="<%=i.getUsuario()%>"Required><br><br>
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