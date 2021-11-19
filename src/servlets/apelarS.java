package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.DataSancion;
import entities.Sancion;

@WebServlet("/apelarS")
public class apelarS extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Sancion s = new Sancion();
		DataSancion ds = new DataSancion();
		s.setId(Integer.parseInt(request.getParameter("idSA").toString()));
		
		ds.apelar(s);
		
		response.sendRedirect("HomeTuneada.jsp");
	}
}
