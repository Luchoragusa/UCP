package servlets;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.DataIntegrante;
import data.DataRango;
import data.DataRol;
import entities.Integrante;
import entities.Ran_Integrante;
import entities.Rango;
import entities.Rol;
@WebServlet("/altaIntegranteS")
public class altaIntegranteS extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Integrante i = new Integrante();
		DataIntegrante di = new DataIntegrante();
		i.setNombre(request.getParameter("nombre"));
		i.setApellido(request.getParameter("apellido"));
		i.setDiscordId(request.getParameter("dsId"));
		i.setSteamHex(request.getParameter("steamHex"));
		i.setUsuario(request.getParameter("nombreUsuario"));
		i.setPw(request.getParameter("pw"));
		
		Rol r = new Rol();
		DataRol dr = new DataRol();
		r.setDescripcion(request.getParameter("rol"));
		i.setRol(dr.getByDesc(r));
		
		Ran_Integrante ranI = new Ran_Integrante();
		Rango ran = new Rango();
		DataRango dran = new DataRango();
		
		ranI.setFecha_desde(LocalDate.now());
		ranI.setIdIntegrante(di.add(i).getIdIntegrante());
		
		ran.setNomRango(request.getParameter("rango"));
		ranI.setIdRango(dran.getByNomb(ran).getIdRango());
		
		di.addRangoIntegrante(ranI);
		
		response.sendRedirect("homeTest.jsp");
	}
}
