<%@page import="data.DataIntegrante"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="data.*"%>
<%@page import="entities.*"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.concurrent.LinkedBlockingDeque"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link href="./dist/css/style.min.css" rel="stylesheet">
    <style type="text/css">
        body{
    background:#eee;
}
.card {
    box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: 1rem;
}
.img-thumbnail {
    padding: .25rem;
    background-color: #ecf2f5;
    border: 1px solid #dee2e6;
    border-radius: .25rem;
    max-width: 100%;
    height: auto;
}
.avatar-lg {
    height: 150px;
    width: 150px;
}

input[type=submit] {
    padding:5px 15px; 
    background:#ccc; 
    border:0 none;
    cursor:pointer;
    -webkit-border-radius: 5px;
    border-radius: 5px; 
}

    </style>
</head>

<body style="background-color: #f4f4f4; margin: 0 !important;">
		<%
			if (session.getAttribute("id") == null)
			response.sendRedirect("LoginTUNEADO.jsp");
		%>
    <div class="container">
    <br>
    <div class="row">
        <div class="col-lg-5 col-md-7 mx-auto my-auto">
            <div class="card">
                <div class="card-body px-lg-5 py-lg-5 text-center">
                    <img src="./assets/images/logo-light-icon.png"   class="rounded-circle avatar-lg img-thumbnail mb-4" alt="profile-image">
                    <h2 class="text-info">Panel de Bitácoras UCP-PSG</h2>
                    <p class="mb-4" style = "font-family:themify;font-size:25px;font-style:normal;">¿Qué desea hacer?.</p>
					<form action="bitacoraS" method="post">
						<input type = "submit" style = "font-family:themify;font-size:15px;font-style:normal;" value = "Abrir Bitacora"><br>
					</form>
				
					<form action="cerrarBitacoraS" method="post">
						<input type = "submit" style = "font-family:themify;font-size:15px;font-style:normal;" value = "Cerrar Bitacora"><br>
					</form>
					<a button class="btn btn-secondary" style = "font-family:themify;font-size:15px;font-style:normal;" type="button" href="HomeTuneada.jsp">Volver a la home</a>
					
                </div>
            </div>
        </div>
    </div>
</div>
        
        <div class="page-wrapper">
            <footer class="footer text-center">
                Panel de la faccion de Prosegur en [BA:RP] ||
                    <a href="https://github.com/Luchoragusa">Luciano Ragusa</a> || 
                    <a href="https://github.com/JuaniPucheta">Juan Ignacio Pucheta</a>.|| 
                    <a href="https://github.com/CamiloPereyra">Camilo Pereyra</a>.
            </footer>
        </div>                
    </table>
</body>

</html>