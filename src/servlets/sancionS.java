package servlets;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.DataSancion;
import entities.Sancion;

@WebServlet("/sancionS")
public class sancionS extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Sancion s = new Sancion();
		s.setIdIntegrante(Integer.parseInt(request.getParameter("idS").toString()));
		s.setTipoSancion(request.getParameter("tipoSancion"));
		s.setNroSancion(Integer.parseInt(request.getParameter("nroSancion")));
		s.setMotivo(request.getParameter("motivo"));
		s.setUrlSancion(request.getParameter("url"));
		s.setFecha(LocalDate.now());
		
		DataSancion ds = new DataSancion();
		ds.add(s);
		
		response.sendRedirect("homeTest.jsp");
	}
}
