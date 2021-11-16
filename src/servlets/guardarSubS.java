package servlets;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.DataRan_Subdivision;
import entities.Integrante;
import entities.Ran_Subdivision;
import entities.Ransub_integrante;

@WebServlet("/guardarSubS")
public class guardarSubS extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Ran_Subdivision rs = new Ran_Subdivision();
		Ransub_integrante rsi = new Ransub_integrante();
		rsi.setIdIntegrante(Integer.parseInt(request.getParameter("idInte").toString()));
		rsi.setFecha_desde(LocalDate.now());
		rsi.setIdRangoSub(0);
		
		rs.setRsi(rsi);
		rs.setIdSub(Integer.parseInt((String) request.getSession().getAttribute("idSub"))); // esto NO anda
		
		DataRan_Subdivision drs = new DataRan_Subdivision();
		drs.add(rs);
		response.sendRedirect("homeTest.jsp");
	}
}
