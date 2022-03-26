package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLType;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Calendar;
import java.util.LinkedList;

import com.mysql.cj.MysqlType;

import entities.Hora;
import entities.Integrante;


public class DataHoras {
	
public Hora getHorasDelIntegrante(Integrante i) {
		
	PreparedStatement stmt=null;
	ResultSet rs=null;
	Hora h = new Hora();
	try 
	{
		stmt = DbConnector.getInstancia().getConn().prepareStatement(
		 "select * FROM hora WHERE idIntegrante = ? ORDER BY inicio desc limit 1");
		stmt.setInt(1, i.getIdIntegrante());
		rs=stmt.executeQuery();
		
		if(rs!=null) 
		{
			while(rs.next()) 
			{
				h.setIdIntegrante(i.getIdIntegrante());
				h.setInicio(rs.getObject("inicio", LocalDateTime.class));
				h.setFin(rs.getObject("fin", LocalDateTime.class));
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
	
public Integrante getHorasSemana(Integrante i) 
{	
	PreparedStatement stmt=null;
	ResultSet rs=null;
	LinkedList<Hora> lista = null;
	
	Calendar calendar=Calendar.getInstance();
	calendar.set(Calendar.WEEK_OF_YEAR, calendar.get(Calendar.WEEK_OF_YEAR)-1);
	calendar.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);	
	LocalDateTime semanaI = LocalDateTime.of(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH), 0, 0, 0, 0);
	Calendar calendar1=Calendar.getInstance();
	calendar.set(Calendar.WEEK_OF_YEAR, calendar.get(Calendar.WEEK_OF_YEAR));
	calendar.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);
	LocalDateTime semanaF = LocalDateTime.of(calendar1.get(Calendar.YEAR), calendar1.get(Calendar.MONTH)+1, calendar1.get(Calendar.DAY_OF_MONTH), 23, 59, 59, 59);
	
	try 
	{
		stmt = DbConnector.getInstancia().getConn().prepareStatement(
		 "select * FROM hora WHERE idIntegrante = ? and inicio between ? and ? and fin between ? and ? ORDER BY inicio desc");
		stmt.setInt(1, i.getIdIntegrante());
		
		stmt.setObject(2, semanaI);
		stmt.setObject(3, semanaF);
		
		stmt.setObject(4, semanaI);
		stmt.setObject(5, semanaF);
		rs=stmt.executeQuery();
		
		if(rs!=null) 
		{
			lista = new LinkedList<Hora>();
			while(rs.next()) 
			{
				Hora h = new Hora();
				h.setIdIntegrante(i.getIdIntegrante());
				h.setInicio(rs.getObject("inicio", LocalDateTime.class));
				if (rs.getObject("fin", LocalDateTime.class) != null)
				{
					h.setFin(rs.getObject("fin", LocalDateTime.class));
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
			 "select inicio, fin, from horas where idIntegrante = ?");
			stmt.setInt(1, hr.getIdIntegrante());
			rs=stmt.executeQuery();
			
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					Hora h=new Hora();
					h.setIdIntegrante(hr.getIdIntegrante());
					h.setInicio(rs.getObject("inicio", LocalDateTime.class));
					h.setFin(rs.getObject("fin", LocalDateTime.class));
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
	
	/*public LinkedList<Hora> getByFecha(Hora hr){
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
	}*/
	
	public void add (Hora hr) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into hora(idIntegrante, inicio) values(?,?)");
			stmt.setInt(1, hr.getIdIntegrante());
			stmt.setObject(2, hr.getInicio());
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
							"update hora set fin = ?, horasJugadas = ? where idIntegrante=? and inicio=?");
			stmt.setObject(1, hr.getFin());	
			stmt.setObject(2, hr.getHorasJugadas());	
			stmt.setInt(3, hr.getIdIntegrante());
			stmt.setObject(4, hr.getInicio());
			
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
							"delete from hora where idIntegrante = ? and inicio = ? and fin is null");
			stmt.setInt(1, hr.getIdIntegrante());	
			stmt.setObject(2, hr.getInicio());
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

	public void deleteHorasByIntegrante(Integrante i) {


		PreparedStatement stmt= null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from hora where idIntegrante = ?");
			stmt.setInt(1, i.getIdIntegrante());
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
	
	/*public void diferenciaHoras(Hora h) 
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
	}*/
	
}
