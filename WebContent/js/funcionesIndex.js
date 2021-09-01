
function cargarElementoDinamicamente(url, elemento)
{
	var request = new XMLHttpRequest();
	
	request.open("GET", url, false); //decimos que vamos a atraer la url y el false es porque la peticion es asincrona
	request.send(null);
	elemento.innerHTML = request.responseText; // dice que el elemento de la peticion los peguemos en donde diga el HTML
}

function cargarHome()
{
	cargarElementoDinamicamente("home.jsp", document.getElementById("ContenidoDinamico"));
}

function cargarLogin()
{
	cargarElementoDinamicamente("login.jsp", document.getElementById("ContenidoDinamico"));
}