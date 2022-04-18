package servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import data.DataSancion;
import entities.Sancion;
@MultipartConfig
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
		//s.setUrlSancion(request.getParameter("url"));
		
		// Pego el codigo del otro JSP
		
		Part file=request.getPart("image");
		String imageFileName=file.getSubmittedFileName();  // se le pide al archivo file, el nombre, que resulta ser el nombre de la imagen
		String uploadPath="C:/Users/x/Pictures/Saved Pictures/"+imageFileName;  // genera la ruta de donde esta se deberia guardar la iomagen
		// Uploading our selected image into the images folder
		try
		{
			FileOutputStream fos=new FileOutputStream(uploadPath);
			InputStream is=file.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		s.setUrlSancion(imageFileName);
		s.setFecha(LocalDate.now());
		
		DataSancion ds = new DataSancion();
		ds.add(s);
		int id = Integer.parseInt(request.getParameter("idS"));
		ds.listarImagen(id, response);
		response.sendRedirect("AplicarSancionTuneado.jsp");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		DataSancion ds = new DataSancion();
		int id = Integer.parseInt(request.getParameter("idS"));
		ds.listarImagen(id, response);
	}
	
}
