package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.*;
import data.*;

@SuppressWarnings("serial")
@WebServlet("/deleteIntegranteS")
public class deleteIntegranteS extends HttpServlet  {



	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		DataSancion ds = new DataSancion();
		DataRobo dr = new DataRobo();
		DataHoras dh = new DataHoras();
		//DataMedalla dm = new DataMedalla();
		DataRango dran = new DataRango();
		DataRanSub_Integrante  dransub = new DataRanSub_Integrante();
		DataIntegrante di = new DataIntegrante();
		
		//me traigo el integrante
		Integrante inte = new Integrante();
		inte.setIdIntegrante(Integer.parseInt(request.getParameter("idInte")));
		inte = di.getByIdIntegrante(inte);
		
		
		//delete sanciones
		ds.deleteByIdIntegrante(inte);
		// delete robos
		dr.deleteRobo(inte);
		//delete horas
		dh.deleteHorasByIntegrante(inte);
		//delete medallas
		//dm.deleteByIntegrante(inte);
		//delete rango
		dran.deleteRango(inte);
		//delete ransub
		dransub.deleteByIntegrante(inte);
		//deleteIntegrante
		di.delete(inte);
		
		response.sendRedirect("HomeTuneada.jsp");
	}


}
