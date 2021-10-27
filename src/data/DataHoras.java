package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLType;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.LinkedList;

import com.mysql.cj.MysqlType;

import entities.Hora;
import entities.Integrante;


public class DataHoras {
	
public Hora getHorasDelIntegrante(int id) {
		
	PreparedStatement stmt=null;
	ResultSet rs=null;
	Hora h = null;
	
	try 
	{
		stmt = DbConnector.getInstancia().getConn().prepareStatement(
		 "select * FROM hora WHERE idIntegrante = ? ORDER BY fechaInicio desc, horaInicio desc limit 1");
		stmt.setInt(1, id);
		rs=stmt.executeQuery();
		
		if(rs!=null) 
		{
			while(rs.next()) 
			{
				h = new Hora();
				h.setIdIntegrante(id);
				h.setFechaInicio(rs.getDate("fechaInicio").toLocalDate());
				h.setHoraInicio(rs.getObject("horaInicio", LocalTime.class));
				h.setHoraFin(rs.getObject("horaFin", LocalTime.class));	
			}
		}	
	} catch (SQLException e) {
		e.printStackTrace();
		
	} 
	finally 
	{
		try 
		{
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
			DbConnector.getInstancia().releaseConn();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	return h;
	}
	
public Integrante get5HorasDelIntegrante(Integrante i) 
{	
	PreparedStatement stmt=null;
	ResultSet rs=null;
	LinkedList<Hora> lista = null;
	try 
	{
		stmt = DbConnector.getInstancia().getConn().prepareStatement(
		 "select * FROM hora WHERE idIntegrante = ? ORDER BY fechaInicio desc, horaInicio desc limit 5");
		stmt.setInt(1, i.getIdIntegrante());
		rs=stmt.executeQuery();
		
		if(rs!=null) 
		{
			lista = new LinkedList<Hora>();
			while(rs.next()) 
			{
				Hora h = null;
				h = new Hora();
				h.setIdIntegrante(i.getIdIntegrante());
				h.setFechaInicio(rs.getDate("fechaInicio").toLocalDate());
				h.setHoraInicio(rs.getObject("horaInicio", LocalTime.class));
				if (rs.getObject("horaFin", LocalTime.class) != null)
				{
					h.setHoraFin(rs.getObject("horaFin", LocalTime.class));
					h.setFechaFin(rs.getDate("fechaFin").toLocalDate());
					h.setHorasJugadas(rs.getObject("horasJugadas", LocalTime.class));
				}
				lista.add(h);
			}
		}
		i.setHora(lista);
	} 
	catch (SQLException e) {
		e.printStackTrace();
	} 
	finally {
		try {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
			DbConnector.getInstancia().releaseConn();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return i;
}

	public LinkedList<Hora> getById(Hora hr){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Hora> hras= new LinkedList<>();
		
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			 "select horaInicio,horaFin,fecha from horas where idIntegrante = ?");
			stmt.setInt(1, hr.getIdIntegrante());
			rs=stmt.executeQuery();
			
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					Hora h=new Hora();
					h.setIdIntegrante(hr.getIdIntegrante());
					//h.setFecha(rs.getDate("fecha").toLocalDate());
					h.setHoraInicio(rs.getObject("horaInicio", LocalTime.class));
					h.setHoraFin(rs.getTime("horaFin").toLocalTime());	
					hras.add(h);
				}
			}	
		} catch (SQLException e) {
			e.printStackTrace();
			
		} 
		finally 
		{
			try 
			{
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		return hras;
	}
	
	public LinkedList<Hora> getByFecha(Hora hr){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Hora> hras= new LinkedList<>();
		
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			 "select idIntegrante, horaInicio, horaFin from horas where fecha = ?");
			stmt.setInt(1, hr.getIdIntegrante());
			rs=stmt.executeQuery();
			
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					Hora h=new Hora();
					h.setIdIntegrante(rs.getInt("idIntegrante"));
					//h.setFecha(hr.getFecha());
					h.setHoraInicio(rs.getObject("horaInicio", LocalTime.class));
					h.setHoraFin(rs.getTime("horaFin").toLocalTime());	
					hras.add(h);
				}
			}	
		} catch (SQLException e) {
			e.printStackTrace();
			
		} 
		finally 
		{
			try 
			{
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		return hras;
	}
	
	public void add (Hora hr) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into hora(idIntegrante, horaInicio,fechaInicio) values(?,?,?)");
			stmt.setInt(1, hr.getIdIntegrante());
			stmt.setObject (2, hr.getHoraInicio()); 
			stmt.setObject(3, hr.getFechaInicio());
			stmt.executeUpdate();
		} 
		catch (SQLException e) 
		{
            e.printStackTrace();
		} 
		finally 
		{
            try 
            {
                if(keyResultSet!=null)keyResultSet.close();
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } 
            catch (SQLException e) 
            {
            	e.printStackTrace();
            }
		}

	}
	
	public void update(Hora hr)
	{
		PreparedStatement stmt= null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"update hora set horaFin = ?, fechaFin = ?, horasJugadas = ? where idIntegrante=? and fechaInicio = ? and horaInicio = ?");
			stmt.setObject(1, hr.getHoraFin());		
			stmt.setObject(2, hr.getFechaFin());
			stmt.setObject(3, hr.getHorasJugadas());	
			stmt.setInt(4, hr.getIdIntegrante());
			stmt.setObject(5, hr.getFechaFin());
			stmt.setObject(6, hr.getHoraInicio());
			
			stmt.executeUpdate();
		} 
		catch (SQLException e) 
		{
            e.printStackTrace();
		} 
		finally 
		{
            try 
            {
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } 
            catch (SQLException e) 
            {
            	e.printStackTrace();
            }
		}
	}

	public void remove(Hora hr) {

		PreparedStatement stmt= null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from horas where idIntegrante = ? and horaFin is null");
			stmt.setInt(1, hr.getIdIntegrante());
			stmt.executeUpdate();
		} 
		catch (SQLException e) 
		{
            e.printStackTrace();
		} 
		finally 
		{
            try 
            {
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } 
            catch (SQLException e) 
            {
            	e.printStackTrace();
            }
		}
	
	}

	public LinkedList<Hora> getTuplasIntegrante(int id, LocalDate fecha, LocalDate fechaFin) 
	{
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Hora> h = new LinkedList<>();
		
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			 "select horasJugadas FROM horas WHERE idIntegrante = ? and fecha BETWEEN ? and ? and horaFin is not null ");
			
			stmt.setInt(1, id);
			stmt.setObject(2, fecha);
			stmt.setObject(3, fechaFin);
			
			rs=stmt.executeQuery();
			
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					Hora h1 = new Hora();

					h1.setHorasJugadas(rs.getObject("horasJugadas", LocalTime.class));
					
					h.add(h1);
				}
			}	
		} catch (SQLException e) {
			e.printStackTrace();
			
		} 
		finally 
		{
			try 
			{
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		return h;
		
	}

	public LinkedList<Hora> getHorasAllIntegrantes(LocalDate fecha, LocalDate fechaFin) 
	{
        PreparedStatement stmt=null;
        ResultSet rs=null;
        LinkedList<Hora> h = new LinkedList<>();

        try 
        {
            stmt=DbConnector.getInstancia().getConn().prepareStatement(
             "SELECT idIntegrante, time_format(sum(horasJugadas), \"%H:%i:%S\") as horasJugadas  from horas \n"
             + " WHERE fecha BETWEEN ? and ? and horaFin is not null group by idIntegrante");

            stmt.setObject(1, fecha);
            stmt.setObject(2, fechaFin);
            rs=stmt.executeQuery();

            if(rs!=null) 
            {
                while(rs.next()) 
                {
                    Hora h1 = new Hora();

                    h1.setHorasJugadas(rs.getObject("horasJugadas", LocalTime.class));
                    h1.setIdIntegrante(rs.getInt("idIntegrante"));

                    h.add(h1);
                }
            }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        } 
        finally 
        {
            try 
            {
                if(rs!=null) {rs.close();}
                if(stmt!=null) {stmt.close();}
                DbConnector.getInstancia().releaseConn();
            } 
            catch (SQLException e) 
            {
                e.printStackTrace();
            }
        }
        return h;
    }
	
	public void diferenciaHoras(Hora h) 
	{
		PreparedStatement stmt= null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement("update horas set horasJugadas = timediff(horaFin, horaInicio) where idIntegrante = ? and horaInicio = ? and horaFin = ?");
			stmt.setInt(1, h.getIdIntegrante());
			stmt.setObject(2, h.getHoraInicio());	
			stmt.setObject(3, h.getHoraFin());	
			
			stmt.executeUpdate();
		} 
		catch (SQLException e) 
		{
            e.printStackTrace();
		} 
		finally 
		{
            try 
            {
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } 
            catch (SQLException e) 
            {
            	e.printStackTrace();
            }
		}
	}
}
