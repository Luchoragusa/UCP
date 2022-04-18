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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Xtreme lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Xtreme admin lite design, Xtreme admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
        content="Xtreme Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <title>Panel Listado de Robos</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/xtreme-admin-lite/" />
    <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/favicon.png">
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
	input[type=submit] {
	  background-color: #04AA6D;
	  border: none;
	  color: white;
	  padding: 6px 14px;
	  text-decoration: none;
	  margin: 4px 2px;
	  cursor: pointer;
	}
    </style>
</head>

<body>
		<%
		int userid = 0;
		int idRol = 0;
		String rutaCarpeta="C:/Users/x/Pictures/Saved Pictures/";
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
		
    <h1>
	    <span class="blue"></span>[PSG]<span class="blue"></span> 
	    <span class="yellow">Sanciones</span>

    </h1>       
        <br>
        <table class="container" align="center" cellspacing="2" cellpadding="2" width ="500">
                <tr bgcolor=blue>
                    <th><h1>Tipo Sancion</h1></th> 
                    <th><h1>N� Sancion</h1></th>
                    <th><h1>Motivo</h1></th>
					<th><h1>Fecha</h1></th>
                    <th><h1>Estado</h1></th>
                    <th><h1>URL</h1></th>
                    <th><h1>Apelada</h1></th>
                    <th><h1>Eliminar</h1></th>
                </tr>
            
            <% 
				DataSancion ds = new DataSancion();
				LinkedList<Sancion> listaS = ds.getById(usuarioOnline).getSancion();
				for(Sancion s :  listaS) {
			%>
            
                <tr>
                    <td> <%=s.getTipoSancion() %></td>
                    <td><%=s.getNroSancion() %></td>
                    <td><%=s.getMotivo() %></td>
                    <td> <%=s.getFecha() %></td>
                    <td>
									<%	
										if(s.isEstado()){
									%>
                                        	<p>Activa</p>
									<%}; %>
									
									<%
										if(s.isEstado()==false){
									%>
                                        	<p>Apelada</p>
									<%}; %>
					</td>
                    <td> 
                    
                  	 <img class="" alt="" src="sancionS?idS=<%=s.getId()%>" width="400" height="400"/>
						<a href="mostrarFotoSancion.jsp" name = "imagen" value="<%=s.getUrlSancion()%>">Ver imagen</a>	
					
                    </td>
                    <td> 
                    <%	
						if(s.isEstado()){
					%>
                    	<form action="apelarS?idSA=<%=s.getId()%>" method="post">
							<input type ="submit" value = "Apelar" >
						</form>	
					<%}; %>
					<%
						if(s.isEstado()==false){
					%>
							<p>A la espera...</p>
					<%}; %>	
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
        </table>
                    
        <form action="sancionS?idS=<%=usuarioOnline.getIdIntegrante() %>" method="post" enctype="multipart/form-data">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p style = "font-family:Arial; font-size:18px;">Tipo de sancion:</p>
			<select name="tipoSancion">
		        <option value="Raya"> Raya </option>
				<option value="Strike"> Strike </option>
	        </select><br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p style = "font-family:Arial; font-size:18px;">Numero de Sancion: </p>
	        <select name="nroSancion">
		        <option value="1"> 1 </option>
				<option value="2"> 2 </option>
				<option value="3"> 3 </option>
	        </select><br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p style = "font-family:Arial; font-size:18px;">Motivo de la sancion:</p>
			<input type = "text" name = "motivo" Required><br><br>
			<div align="center">

		   <b>Seleccionar imagen:</b>
		   <input type="file" name="image">

		</div>
			
			<div class="AS">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type = "submit" value = "Aplicar Sancion" Required><br>
            </div>
		</form>

        <div class="containerHome">
            <a button type="button" class="btn btn-outline-danger" href="HomeTuneada.jsp">Volver a la home</a>
        </div>
        
        
            <footer class="footer text-center">
                Panel de la faccion de Prosegur en [BA:RP] || 
                    <a href="https://github.com/Luchoragusa">Luciano Ragusa</a> || 
                    <a href="https://github.com/JuaniPucheta">Juan Ignacio Pucheta</a>.|| 
                    <a href="https://github.com/CamiloPereyra">Camilo Pereyra</a>.
            </footer>

</body>
</html>