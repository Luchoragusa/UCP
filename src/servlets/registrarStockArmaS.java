package servlets;
import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.*;
import data.*;


@SuppressWarnings("serial")
@WebServlet("/registrarStockArmaS")
public class registrarStockArmaS extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Arma arm = new Arma();
		DataArma darm = new DataArma();
		Stockarma sarm = new Stockarma();
		DataStockarma dssarm = new DataStockarma();
		
		//seteo id del arma elegida
		arm.setIdArma(Integer.parseInt(request.getParameter("arma")));
		arm = darm.getById(arm);
		
		// seteo fecha
		sarm.setFecha(LocalDate.now());
		
		//seteo cantidad
		sarm.setCantidad(Integer.parseInt(request.getParameter("newStock")));
		
		//Insert new Stockarma
		dssarm.add(sarm, arm);
		
		response.sendRedirect("registrarStockArma.jsp");
	}

}
