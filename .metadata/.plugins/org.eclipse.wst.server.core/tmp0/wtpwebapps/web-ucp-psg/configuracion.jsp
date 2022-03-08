<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>[PSG] Configuraci�n</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="//code.tidio.co/p26dt4g3heql4zxjwvkmcyecxl33ssqy.js" async></script>
</head>
<body>
		<%
		int idRol = 0;
		if (session.getAttribute("id") == null)
			response.sendRedirect("HomeTuneada.jsp");
		else 
		{
			idRol = Integer.parseInt(session.getAttribute("rol").toString());
		}
		%>
<div class="container">
<div class="row justify-content-center">
    <div class="col-12 col-lg-10 col-xl-8 mx-auto">
        <div class="my-4">
            <h5 class="mb-0 mt-5">Notificaciones de ajustes</h5>
            <p>Selecciona la notificaci�n que quieres recibir</p>
            <hr class="my-4" />
            <strong class="mb-0">Seguridad</strong>
            <p>Alerta de control de seguridad que recibir�.</p>
            <div class="list-group mb-5 shadow">
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col">
                            <strong class="mb-0">Notificaciones de actividades inusuales</strong>
                            <p class="text-muted mb-0">Donec in quam sed urna bibendum tincidunt quis mollis mauris.</p>
                        </div>
                        <div class="col-auto">
                            <div class="custom-control custom-switch">
                                <input type="checkbox" class="custom-control-input" id="alert1" checked="" />
                                <span class="custom-control-label"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col">
                            <strong class="mb-0">Actividad financiera no autorizada</strong>
                            <p class="text-muted mb-0">Fusce lacinia elementum eros, sed vulputate urna eleifend nec.</p>
                        </div>
                        <div class="col-auto">
                            <div class="custom-control custom-switch">
                                <input type="checkbox" class="custom-control-input" id="alert2" />
                                <span class="custom-control-label"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="my-4" />
            <strong class="mb-0">Sistema</strong>
            <p>Por favor, habilite la alerta del sistema que recibir�.</p>
            <div class="list-group mb-5 shadow">
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col">
                            <strong class="mb-0">Notif�queme sobre nuevas funciones y actualizaciones</strong>
                            <p class="text-muted mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                        <div class="col-auto">
                            <div class="custom-control custom-switch">
                                <input type="checkbox" class="custom-control-input" id="alert3" checked="" />
                                <span class="custom-control-label"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col">
                            <strong class="mb-0">Notif�queme por correo electr�nico para las �ltimas noticias</strong>
                            <p class="text-muted mb-0">Nulla et tincidunt sapien. Sed eleifend volutpat elementum.</p>
                        </div>
                        <div class="col-auto">
                            <div class="custom-control custom-switch">
                                <input type="checkbox" class="custom-control-input" id="alert4" checked="" />
                                <span class="custom-control-label"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col">
                            <strong class="mb-0">Notificarme sobre consejos sobre el uso de la cuenta</strong>
                            <p class="text-muted mb-0">Donec in quam sed urna bibendum tincidunt quis mollis mauris.</p>
                        </div>
                        <div class="col-auto">
                            <div class="custom-control custom-switch">
                                <input type="checkbox" class="custom-control-input" id="alert5" />
                                <span class="custom-control-label"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<a button type="button" class="btn btn-outline-secondary" href="HomeTuneada.jsp">Home</a>

<footer class="footer text-center">
    Panel de la faccion de Prosegur en [BA:RP] ||
        <a href="https://github.com/Luchoragusa">Luciano Ragusa</a> || 
        <a href="https://github.com/JuaniPucheta">Juan Ignacio Pucheta</a>.|| 
        <a href="https://github.com/CamiloPereyra">Camilo Pereyra</a>.
</footer>
</div>

<style type="text/css">
body{
    color: #8e9194;
    background-color: #f4f6f9;
}
.list-group {
    display: flex;
    flex-direction: column;
    padding-left: 0;
    margin-bottom: 0;
    border-radius: 0.25rem;
}

.list-group-item-action {
    width: 100%;
    color: #4d5154;
    text-align: inherit;
}
.list-group-item-action:hover,
.list-group-item-action:focus {
    z-index: 1;
    color: #4d5154;
    text-decoration: none;
    background-color: #f4f6f9;
}
.list-group-item-action:active {
    color: #8e9194;
    background-color: #eef0f3;
}

.list-group-item {
    position: relative;
    display: block;
    padding: 0.75rem 1.25rem;
    background-color: #ffffff;
    border: 1px solid #eef0f3;
}
.list-group-item:first-child {
    border-top-left-radius: inherit;
    border-top-right-radius: inherit;
}
.list-group-item:last-child {
    border-bottom-right-radius: inherit;
    border-bottom-left-radius: inherit;
}
.list-group-item.disabled,
.list-group-item:disabled {
    color: #6d7174;
    pointer-events: none;
    background-color: #ffffff;
}
.list-group-item.active {
    z-index: 2;
    color: #ffffff;
    background-color: #1b68ff;
    border-color: #1b68ff;
}
.list-group-item + .list-group-item {
    border-top-width: 0;
}
.list-group-item + .list-group-item.active {
    margin-top: -1px;
    border-top-width: 1px;
}

.list-group-horizontal {
    flex-direction: row;
}
.list-group-horizontal > .list-group-item:first-child {
    border-bottom-left-radius: 0.25rem;
    border-top-right-radius: 0;
}
.list-group-horizontal > .list-group-item:last-child {
    border-top-right-radius: 0.25rem;
    border-bottom-left-radius: 0;
}
.list-group-horizontal > .list-group-item.active {
    margin-top: 0;
}
.list-group-horizontal > .list-group-item + .list-group-item {
    border-top-width: 1px;
    border-left-width: 0;
}
.list-group-horizontal > .list-group-item + .list-group-item.active {
    margin-left: -1px;
    border-left-width: 1px;
}

@media (min-width: 576px) {
    .list-group-horizontal-sm {
        flex-direction: row;
    }
    .list-group-horizontal-sm > .list-group-item:first-child {
        border-bottom-left-radius: 0.25rem;
        border-top-right-radius: 0;
    }
    .list-group-horizontal-sm > .list-group-item:last-child {
        border-top-right-radius: 0.25rem;
        border-bottom-left-radius: 0;
    }
    .list-group-horizontal-sm > .list-group-item.active {
        margin-top: 0;
    }
    .list-group-horizontal-sm > .list-group-item + .list-group-item {
        border-top-width: 1px;
        border-left-width: 0;
    }
    .list-group-horizontal-sm > .list-group-item + .list-group-item.active {
        margin-left: -1px;
        border-left-width: 1px;
    }
}

@media (min-width: 768px) {
    .list-group-horizontal-md {
        flex-direction: row;
    }
    .list-group-horizontal-md > .list-group-item:first-child {
        border-bottom-left-radius: 0.25rem;
        border-top-right-radius: 0;
    }
    .list-group-horizontal-md > .list-group-item:last-child {
        border-top-right-radius: 0.25rem;
        border-bottom-left-radius: 0;
    }
    .list-group-horizontal-md > .list-group-item.active {
        margin-top: 0;
    }
    .list-group-horizontal-md > .list-group-item + .list-group-item {
        border-top-width: 1px;
        border-left-width: 0;
    }
    .list-group-horizontal-md > .list-group-item + .list-group-item.active {
        margin-left: -1px;
        border-left-width: 1px;
    }
}

@media (min-width: 992px) {
    .list-group-horizontal-lg {
        flex-direction: row;
    }
    .list-group-horizontal-lg > .list-group-item:first-child {
        border-bottom-left-radius: 0.25rem;
        border-top-right-radius: 0;
    }
    .list-group-horizontal-lg > .list-group-item:last-child {
        border-top-right-radius: 0.25rem;
        border-bottom-left-radius: 0;
    }
    .list-group-horizontal-lg > .list-group-item.active {
        margin-top: 0;
    }
    .list-group-horizontal-lg > .list-group-item + .list-group-item {
        border-top-width: 1px;
        border-left-width: 0;
    }
    .list-group-horizontal-lg > .list-group-item + .list-group-item.active {
        margin-left: -1px;
        border-left-width: 1px;
    }
}

@media (min-width: 1200px) {
    .list-group-horizontal-xl {
        flex-direction: row;
    }
    .list-group-horizontal-xl > .list-group-item:first-child {
        border-bottom-left-radius: 0.25rem;
        border-top-right-radius: 0;
    }
    .list-group-horizontal-xl > .list-group-item:last-child {
        border-top-right-radius: 0.25rem;
        border-bottom-left-radius: 0;
    }
    .list-group-horizontal-xl > .list-group-item.active {
        margin-top: 0;
    }
    .list-group-horizontal-xl > .list-group-item + .list-group-item {
        border-top-width: 1px;
        border-left-width: 0;
    }
    .list-group-horizontal-xl > .list-group-item + .list-group-item.active {
        margin-left: -1px;
        border-left-width: 1px;
    }
}

.list-group-flush {
    border-radius: 0;
}
.list-group-flush > .list-group-item {
    border-width: 0 0 1px;
}
.list-group-flush > .list-group-item:last-child {
    border-bottom-width: 0;
}

.list-group-item-primary {
    color: #0e3685;
    background-color: #bfd5ff;
}
.list-group-item-primary.list-group-item-action:hover,
.list-group-item-primary.list-group-item-action:focus {
    color: #0e3685;
    background-color: #a6c4ff;
}
.list-group-item-primary.list-group-item-action.active {
    color: #ffffff;
    background-color: #0e3685;
    border-color: #0e3685;
}

.list-group-item-secondary {
    color: #0a395d;
    background-color: #bdd6ea;
}
.list-group-item-secondary.list-group-item-action:hover,
.list-group-item-secondary.list-group-item-action:focus {
    color: #0a395d;
    background-color: #aacae4;
}
.list-group-item-secondary.list-group-item-action.active {
    color: #ffffff;
    background-color: #0a395d;
    border-color: #0a395d;
}

.list-group-item-success {
    color: #107259;
    background-color: #c0f5e8;
}
.list-group-item-success.list-group-item-action:hover,
.list-group-item-success.list-group-item-action:focus {
    color: #107259;
    background-color: #aaf2e0;
}
.list-group-item-success.list-group-item-action.active {
    color: #ffffff;
    background-color: #107259;
    border-color: #107259;
}

.list-group-item-info {
    color: #005d83;
    background-color: #b8eafe;
}
.list-group-item-info.list-group-item-action:hover,
.list-group-item-info.list-group-item-action:focus {
    color: #005d83;
    background-color: #9fe3fe;
}
.list-group-item-info.list-group-item-action.active {
    color: #ffffff;
    background-color: #005d83;
    border-color: #005d83;
}

.list-group-item-warning {
    color: #855701;
    background-color: #ffe7b8;
}
.list-group-item-warning.list-group-item-action:hover,
.list-group-item-warning.list-group-item-action:focus {
    color: #855701;
    background-color: #ffde9f;
}
.list-group-item-warning.list-group-item-action.active {
    color: #ffffff;
    background-color: #855701;
    border-color: #855701;
}

.list-group-item-danger {
    color: #721c24;
    background-color: #f5c6cb;
}
.list-group-item-danger.list-group-item-action:hover,
.list-group-item-danger.list-group-item-action:focus {
    color: #721c24;
    background-color: #f1b0b7;
}
.list-group-item-danger.list-group-item-action.active {
    color: #ffffff;
    background-color: #721c24;
    border-color: #721c24;
}

.list-group-item-light {
    color: #7f8081;
    background-color: #fcfcfd;
}
.list-group-item-light.list-group-item-action:hover,
.list-group-item-light.list-group-item-action:focus {
    color: #7f8081;
    background-color: #ededf3;
}
.list-group-item-light.list-group-item-action.active {
    color: #ffffff;
    background-color: #7f8081;
    border-color: #7f8081;
}

.list-group-item-dark {
    color: #17191c;
    background-color: #c4c5c6;
}
.list-group-item-dark.list-group-item-action:hover,
.list-group-item-dark.list-group-item-action:focus {
    color: #17191c;
    background-color: #b7b8b9;
}
.list-group-item-dark.list-group-item-action.active {
    color: #ffffff;
    background-color: #17191c;
    border-color: #17191c;
}



.btn-outline-secondary {
    padding-right: 50px;
    padding-left: 50px;
    text-align: center;
    background-color: #1250ce;
    color: #fff;
    width: 200px;
    position: relative;
    left: 500px;
    bottom: 20px;
    margin-bottom: 30px;
    margin-top: 20px;
}



</style>

<script type="text/javascript">

</script>
</body>
</html>