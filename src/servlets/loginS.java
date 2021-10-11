package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DataIntegrante;
import entities.Integrante;
import logic.Login;

@WebServlet("/loginS")
public class loginS extends HttpServlet 
{	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			Integrante i = new Integrante();
			Login ctrlLogin = new Login();
			
			String user = request.getParameter("user");
			String pw = request.getParameter("pw");
			
			i.setUsuario(user);
			i.setPw(pw);
			
			if (ctrlLogin.validateWeb(i))
			{
				i = ctrlLogin.getIntegrante(i);
				HttpSession session = request.getSession();
				session.setAttribute("Nombre", i.getNombre());
				session.setAttribute("Apellido", i.getApellido());
				session.setAttribute("id", i.getIdIntegrante());
				response.sendRedirect("homeTest.jsp");
			}
			else
				response.sendRedirect("loginTest.jsp");
		}
		catch (Exception e) 
		{
			// TODO: handle exception
		}
	}
}