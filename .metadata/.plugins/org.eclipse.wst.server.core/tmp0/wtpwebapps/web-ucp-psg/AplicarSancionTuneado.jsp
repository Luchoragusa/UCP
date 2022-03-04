<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.util.LinkedList"%>
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
    <title>Panel Listado de Robos</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/xtreme-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/favicon.png">
    <!-- Custom CSS -->
    <link href="./dist/css/style.min.css" rel="stylesheet">
    <link href="./dist/css/sanciones.css" rel="stylesheet">
    <style type="text/css">     
	.containerHome {
	    text-align: center;
	    overflow: hidden;
	    width: 80%;
	    margin: 0 auto;
	    display: table;
	    padding: 0 0 8em 0;
	 }   
	.AS {
    text-align: left;
    overflow: hidden;
    width: 80%;
    margin: 0 auto;
	} 
    </style>
</head>

<body>
	<%
		if (session.getAttribute("id") == null)
		response.sendRedirect("LoginTUNEADO.jsp");
		Integrante i = new Integrante();
		DataIntegrante di = new DataIntegrante();
		i=di.getByIdIntegrante(i);
	%>
		
    <h1><span class="blue"></span>[PSG]<span class="blue"></span> <span class="yellow">Sanciones</pan></h1>       
        
        <table class="container">
            <thead>
                <tr>
                    <th><h1>Tipo Sancion</h1></th>
                    <th><h1>Numero Sancion</h1></th>
                    <th><h1>Estado de la sancion</h1></th>
                    <th><h1>Fecha</h1></th>
                    <th><h1>URL</h1></th>
                    <th><h1>Apelada</h1></th>
                    <th><h1>Eliminar</h1></th>
                </tr>
            </thead>
            
            <% 
				DataSancion ds = new DataSancion();
				LinkedList<Sancion> listaS = ds.getById(i).getSancion();
				for(Sancion s :  listaS) {
			%>
            
            <tbody>
                <tr>
                    <td> <%=s.getTipoSancion() %></td>
                    <td><%=s.getNroSancion() %></td>
                    <td>
                    	<%	
							if(s.isEstado())
								out.print("Activa");
							else
								out.print("Apelada");
						%> 
					</td>
                    <td> <%=s.getFecha() %></td>
                    <td> <a href="<%=s.getUrlSancion()%>" target="_blank">Url imagen</a> </td>
                    <td> 
                    	<form action="apelarS?idSA=<%=s.getId()%>" method="post">
							<input type ="submit" value = "Apelar" >
						</form>	
                    </td>
                    <td> 
	                    <form action="eliminarS?idSE=<%=s.getId()%>" method="post">
							<input type ="submit" value = "Eliminar" >
						</form>	
                    </td>
                </tr>
            <%
				}
			%>                
            </tbody>
        </table>
        
            </br></br>
            
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
			
			<div class="AS">
                <input type = "submit" value = "Aplicar Sancion" Required><br>
            </div>
		</form>

		</br></br>
        <div class="containerHome">
            <a button type="button" class="btn btn-outline-secondary" href="GestionInt_2.jsp">Volver atr�s</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a button type="button" class="btn btn-outline-danger" href="HomeTuneada.jsp">Home</a>
        </div>
        
        
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
</body>

</html>