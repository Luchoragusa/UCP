package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.*;
import entities.*;
import logic.Login;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginS")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		try
		{		
			Integrante i = new Integrante();
			String usuario = request.getParameter("txtUser");
			String pw = request.getParameter("txtPw");
			
			i.setUsuario(usuario);
			i.setPw(pw);
			
			Login ctrlLogin = new Login();
			i=ctrlLogin.validate(i);
			
			if (i.getUsuario() == usuario && i.getPw() == pw)
			{
				request.getSession().setAttribute("user", i);
				response.sendRedirect("home.jsp");
			}
			else { 
				//response.sendRedirect("home.jsp");
				request.getRequestDispatcher("login.jsp");
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
