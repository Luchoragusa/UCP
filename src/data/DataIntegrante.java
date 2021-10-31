package data;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;



import entities.Hora;
import entities.Integrante;
import entities.Ran_Integrante;
import entities.Ran_Subdivision;
import entities.Rango;
import entities.Rol;
import entities.Subdivision;
import logic.LlaveMaestra;

	public class DataIntegrante 
	{
	Scanner s = null;
	public Integrante getByUser(Integrante inte) 
	{	
		Integrante i=null;
		Rol rolcito = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select idIntegrante,nombre,apellido,discordId,steamHex, i.idRol, r.descripcion\r\n"
					+ " from integrante i\r\n"
					+ " inner join rol r\r\n"
					+ "	on i.idRol = r.idRol\r\n"
					+ " where usuario=? and pw = AES_ENCRYPT(?,?)"
					);
			stmt.setString(1, inte.getUsuario());
			stmt.setString(2, inte.getPw());
			stmt.setString(3, LlaveMaestra.getLlave());
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				i=new Integrante();
				rolcito = new Rol();
				i.setIdIntegrante(rs.getInt("idIntegrante"));
				i.setNombre(rs.getString("nombre"));
				i.setApellido(rs.getString("apellido"));
				i.setSteamHex(rs.getString("steamHex"));
				i.setDiscordId(rs.getString("discordId"));

				rolcito.setIdRol(rs.getInt("idRol"));
				rolcito.setDescripcion(rs.getString("descripcion"));
			
				i.setRol(rolcito);
			}
		} catch (SQLException e) 
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
		return i;
	}
	
	public Boolean getLogin(Integrante inte) 
	{
		boolean status = false;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select idIntegrante,nombre,apellido,discordId,steamHex from integrante where usuario=? and pw = AES_ENCRYPT(?,?)"
					);
			stmt.setString(1, inte.getUsuario());
			stmt.setString(2, inte.getPw());
			stmt.setString(3, LlaveMaestra.getLlave());
			rs=stmt.executeQuery();
			status = rs.next();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally 
		{
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		return status;
	}

	public Integrante getByIdIntegrante(Integrante inte) 
	{
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Integrante i=null;
		Rango r = null;
		Subdivision s = null;
		Ran_Subdivision r_s = null;
		Rol rol = null;
		Ran_Integrante ri = null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					          "select nombre, apellido, discordId, steamHex, usuario, i.idRol, r.descripcion, rs.nombreRangoSub, rs.idRanSub, r2.nombRango ,ri.fechaDesde, ri.idRango,s.descripcion, s.idSub\r\n"
					          + "from (select max(ri.fechaDesde) fecha\r\n"
					          + "    from ran_integrante ri\r\n"
					          + "    where idIntegrante = ?\r\n"
					          + "    group by ri.idIntegrante) as tabla\r\n"
					          + "inner join ran_integrante ri on ri.fechaDesde=tabla.fecha\r\n"
					          + "inner join rango r2 on ri.idRango = r2.idRango\r\n"
					          + "inner join integrante i on i.idIntegrante=ri.idIntegrante\r\n"
					          + "inner join rol r on i.idRol = r.idRol\r\n"
					          + "left join  ransub_integrante ri2 on i.idIntegrante = ri2.idIntegrante\r\n"
					          + "left join  subdivision s on ri2.idSub = s.idSub\r\n"
					          + "left join ran_subdivision rs on s.idSub = rs.idSub\r\n"
					          + "group by ri.idIntegrante;");
			stmt.setInt(1, inte.getIdIntegrante());
			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) 
			{
					i = new Integrante();
					r = new Rango();
					s = new Subdivision();
					r_s = new Ran_Subdivision();
					rol = new Rol();
					ri = new Ran_Integrante();
					
					i.setNombre(rs.getString("nombre"));
					i.setApellido(rs.getString("apellido"));
					i.setIdIntegrante(inte.getIdIntegrante());
					i.setDiscordId(rs.getString("discordId"));
					i.setSteamHex(rs.getString("steamHex"));
					i.setUsuario(rs.getString("usuario"));
					
					rol.setIdRol(rs.getInt("idRol"));
					rol.setDescripcion(rs.getString("descripcion"));
					
					r_s.setNombreRangoSub(rs.getString("nombreRangoSub"));
					r_s.setIdRanSub(rs.getInt("idRanSub"));
					
					LinkedList<Ran_Subdivision> lrs = new LinkedList<Ran_Subdivision>();
					lrs.add(r_s);
					s.setRanSub(lrs);
					
					r.setNomRango(rs.getString("nombRango"));
					r.setIdRango(rs.getInt("idRango"));
					
					ri.setFecha_desde((rs.getDate("fechaDesde")).toLocalDate());
					
					s.setDescripcion(rs.getString("descripcion"));
					s.setIdSub(rs.getInt("idSub"));
					
					i.setRol(rol);
					ri.setRango(r);
					i.setRanInt(ri);
					i.setSub(s);
			}
			DataSancion ds = new DataSancion();
			i = ds.getById(i); // carga las sanciones del mismo
			DataHoras dh = new DataHoras();
			i = dh.get5HorasDelIntegrante(i); // cambiar para q traiga todas las de la semana
		} 
		catch (SQLException e) {
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
		return i;
	}
	
	public LinkedList<Integrante> getAll() 
	{
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Integrante> integrantes = null;
		Integrante i=null;
		Rango r = null;
		Subdivision s = null;
		Ran_Integrante ri = null;
		try {
			stmt= DbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select nombre, apellido, steamHex,discordId, r.nombRango,r.idRango, i.idIntegrante \r\n"
					+ "from integrante i\r\n"
					+ "inner join ran_integrante ri \r\n"
					+ "	on i.idIntegrante = ri.idIntegrante\r\n"
					+ "inner join rango r\r\n"
					+ "	on ri.idRango = r.idRango\r\n"
					+ "left join ransub_integrante ri2 \r\n"
					+ "	on i.idIntegrante = ri2.idIntegrante\r\n"
					+ "left join ran_subdivision rs \r\n"
					+ "	on ri2.idRanSub = rs.idRanSub\r\n"
					+ "group by i.idIntegrante;");
		
			if(rs!=null) 
			{
				integrantes = new LinkedList<>();
				while(rs.next()) 
				{
					i = new Integrante();
					r = new Rango();
					//s = new Subdivision();
					ri = new Ran_Integrante();
				
				
					i.setNombre(rs.getString("nombre"));
					i.setApellido(rs.getString("apellido"));
					i.setDiscordId(rs.getString("discordId"));
					i.setIdIntegrante(rs.getInt("idIntegrante"));
					i.setSteamHex(rs.getString("steamHex"));
					
					r.setNomRango(rs.getString("nombRango"));
					r.setIdRango(rs.getInt("idRango"));
					//s.setDescripcion(rs.getString("descripcion"));
					
					ri.setRango(r);
					ri.setIdIntegrante(rs.getInt("idIntegrante"));
					ri.setFecha_desde(LocalDate.now());
					i.setRanInt(ri);
					//i.setSub(s);
					
					integrantes.add(i);
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
		return integrantes;
	}

	public Integrante add(Integrante i) 
	{
		Rol r = i.getRol();
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into integrante(nombre, apellido, discordId, steamHex, usuario, pw, idRol) values(?,?,?,?,?,AES_ENCRYPT(?,?),?)",
							PreparedStatement.RETURN_GENERATED_KEYS
							);
			stmt.setString(1, i.getNombre());
			stmt.setString(2, i.getApellido());
			stmt.setString(3, i.getDiscordId());
			stmt.setString(4, i.getSteamHex());
			stmt.setString(5, i.getUsuario());
			stmt.setString(6, i.getPw());
			stmt.setString(7, LlaveMaestra.getLlave());
			stmt.setInt(8, r.getIdRol());
			stmt.executeUpdate();
			
			keyResultSet=stmt.getGeneratedKeys();
			
			if(keyResultSet!=null && keyResultSet.next())
			{
                i.setIdIntegrante(keyResultSet.getInt(1));
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
                if(keyResultSet!=null)keyResultSet.close();
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } 
            catch (SQLException e) 
            {
            	e.printStackTrace();
            }
		}
		return i;
	}
	
	public void addRangoIntegrante(Ran_Integrante ri) 
	{
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into ran_integrante(idIntegrante, idRango, fechaDesde) values(?,?,?)");
			stmt.setInt(1, ri.getIdIntegrante());
			stmt.setInt(2, ri.getIdRango());
			stmt.setObject(3, ri.getFecha_desde());
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
	
	public void update(Integrante i) {

		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"update integrante set nombre=?, apellido=?, usuario=?, pw=AES_ENCRYPT(?,?), discordId=? where idIntegrante = ?");
			
			stmt.setString(1, i.getNombre());
			stmt.setString(2, i.getApellido());
			stmt.setString(3, i.getUsuario());
			stmt.setString(4, i.getPw());
			stmt.setString(5, LlaveMaestra.getLlave());
			stmt.setString(6, i.getDiscordId());
			stmt.setInt(7, i.getIdIntegrante());	
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

	public void delete(Integrante i) 
	{
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement("delete from integrante where idIntegrante = ?");
			stmt.setInt(1, i.getIdIntegrante());	
			stmt.execute();
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
	
	public LinkedList<Integrante> getServicio() 
	{
		Statement stmt=null;
		ResultSet rs=null;
		
		LinkedList<Integrante> uActivos = null;
		Integrante i=null;
		Rango r = null;
		Hora h = null;
		Subdivision s = null;
		Ran_Integrante ri = null;
		try {
			stmt= DbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select i.idIntegrante, nombre, apellido, s.descripcion, horaInicio, fechaInicio, nombRango\r\n"
					+ "from (select max(ri.fechaDesde) fecha\r\n"
					+ "    from ran_integrante ri\r\n"
					+ "    group by ri.idIntegrante) as tabla\r\n"
					+ "inner join ran_integrante ri on ri.fechaDesde=tabla.fecha\r\n"
					+ "inner join integrante i on i.idIntegrante=ri.idIntegrante\r\n"
					+ "inner join rol r on i.idRol = r.idRol\r\n"
					+ "inner join rango r2 on ri.idRango = r2.idRango\r\n"
					+ "left join hora h on i.idIntegrante = h.idIntegrante\r\n"
					+ "left join  ransub_integrante ri2 on i.idIntegrante = ri2.idIntegrante\r\n"
					+ "left join  subdivision s on ri2.idSub = s.idSub\r\n"
					+ "where horaInicio is not null and horaFin is null\r\n"
					+ "group by ri.idIntegrante;");
		
			if(rs!=null) 
			{
				uActivos = new LinkedList<>();
				while(rs.next()) 
				{
					i = new Integrante();
					r = new Rango();
					h = new Hora();
					s = new Subdivision();
					ri = new Ran_Integrante();
				
					i.setNombre(rs.getString("nombre"));
					i.setApellido(rs.getString("apellido"));
					
					r.setNomRango(rs.getString("nombRango"));
					h.setHoraInicio(rs.getObject("horaInicio", LocalTime.class));
					s.setDescripcion(rs.getString("descripcion"));
					h.setFechaInicio(rs.getDate("fechaInicio").toLocalDate());
					
					LinkedList<Hora> horas = new LinkedList<Hora>();
					horas.add(h);
					i.setHora(horas);
					ri.setRango(r);
					i.setRanInt(ri);
					i.setSub(s);
					
					uActivos.add(i);
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
		return uActivos;
	}

}
