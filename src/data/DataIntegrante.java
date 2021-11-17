package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalTime;
import java.util.*;
import entities.Hora;
import entities.Integrante;
import entities.Ran_Integrante;
import entities.Ran_Subdivision;
import entities.Rango;
import entities.Ransub_integrante;
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
					"select idIntegrante,nombre,apellido,discordId,steamHex, i.idRol, r.descRol\r\n"
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
				rolcito.setdescRol(rs.getString("descripcion"));
			
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

	public Integrante getByIdIntegrante(Integrante i) 
	{
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Rango r = null;
		Subdivision s = null;
		Ran_Subdivision r_s = null;
		Rol rol = null;
		Ran_Integrante ri = null;
		Ransub_integrante rsi = null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					        /* "select max(fechaDesde) into @fecha\r\n"     // Misma query pero con variable, es mas optima
							+ "from ransub_integrante\r\n"
							+ "where idIntegrante = ?;\r\n"
							+ "\r\n"
							+ "select nombre, apellido, discordId, steamHex, usuario, i.idRol, r.descRol, rs.nombreRangoSub, rs.idRanSub, r2.nombRango ,ri.fechaDesde, ri.idRango,s.descripcion, s.idSub, @fecha as fechaDesdesub\r\n"
							+ "from (select max(ri.fechaDesde) fecha\r\n"
							+ "    from ran_integrante ri\r\n"
							+ "    where idIntegrante = ?\r\n"
							+ "    group by ri.idIntegrante) as tabla\r\n"
							+ "\r\n"
							+ "inner join ran_integrante ri on ri.fechaDesde=tabla.fecha\r\n"
							+ "inner join rango r2 on ri.idRango = r2.idRango\r\n"
							+ "inner join integrante i on i.idIntegrante=ri.idIntegrante\r\n"
							+ "inner join rol r on i.idRol = r.idRol\r\n"
							+ "\r\n"
							+ "left join  ransub_integrante ri2 on i.idIntegrante = ri2.idIntegrante and ri2.fechaDesde = @fecha\r\n"
							+ "left join  subdivision s on ri2.idSub = s.idSub\r\n"
							+ "left join  ran_subdivision rs on s.idSub = rs.idSub and ri2.idRanSub = rs.idRanSub"
							+"group by ri.idIntegrante\r\n"
							+"having ri.idIntegrante = ?");; */
					
							  "select nombre, apellido, discordId, steamHex, usuario, i.idRol, r.descRol, rs.nombreRangoSub, rs.idRanSub, r2.nombRango ,ri.fechaDesde, ri.idRango,s.descripcion, s.idSub, max(ri2.fechaDesde) as fechaDesdesub\r\n"
							  + "from (select max(ri.fechaDesde) fecha\r\n"
							  + "    from ran_integrante ri\r\n"
							  + "    where idIntegrante = ?\r\n"
							  + "    group by ri.idIntegrante) as tabla\r\n"
							  + "inner join ran_integrante ri on ri.fechaDesde=tabla.fecha\r\n"
							  + "inner join rango r2 on ri.idRango = r2.idRango\r\n"
							  + "inner join integrante i on i.idIntegrante=ri.idIntegrante\r\n"
							  + "inner join rol r on i.idRol = r.idRol\r\n"
							  + "left join  ransub_integrante ri2 on i.idIntegrante = ri2.idIntegrante and ri2.fechaDesde = (select max(ransub_integrante.fechaDesde)\r\n"
							  + "                                                                                            from ransub_integrante\r\n"
							  + "                                                                                            where idIntegrante = ?)\r\n"
							  + "left join  subdivision s on ri2.idSub = s.idSub\r\n"
							  + "left join  ran_subdivision rs on s.idSub = rs.idSub and ri2.idRanSub = rs.idRanSub\r\n"
							  + "group by ri.idIntegrante\r\n"
							  + "having ri.idIntegrante = ?;");
					
			stmt.setInt(1, i.getIdIntegrante());
			stmt.setInt(2, i.getIdIntegrante());
			stmt.setInt(3, i.getIdIntegrante());
			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) 
			{
					r = new Rango();
					r_s = new Ran_Subdivision();
					rol = new Rol();
					ri = new Ran_Integrante();
					
					i.setNombre(rs.getString("nombre"));
					i.setApellido(rs.getString("apellido"));
					i.setDiscordId(rs.getString("discordId"));
					i.setSteamHex(rs.getString("steamHex"));
					i.setUsuario(rs.getString("usuario"));
					
					rol.setIdRol(rs.getInt("idRol"));
					rol.setdescRol(rs.getString("descRol"));
					
					r_s.setNombreRangoSub(rs.getString("nombreRangoSub"));
					
					if (r_s.getNombreRangoSub() != null)
					{
						s = new Subdivision();
						rsi = new Ransub_integrante();
						
						r_s.setIdRanSub(rs.getInt("idRanSub"));
						rsi.setFecha_desde((rs.getDate("fechaDesdesub")).toLocalDate());
						r_s.setRsi(rsi);
						
						LinkedList<Ran_Subdivision> lrs = new LinkedList<Ran_Subdivision>();
						lrs.add(r_s);
						
						s.setDescripcion(rs.getString("descripcion"));
						s.setIdSub(rs.getInt("idSub"));
						s.setRanSub(lrs);
						
						i.setSub(s);
					}
					
					r.setNomRango(rs.getString("nombRango"));
					r.setIdRango(rs.getInt("idRango"));
					
					ri.setFecha_desde((rs.getDate("fechaDesde")).toLocalDate());
					
					i.setRol(rol);
					ri.setRango(r);
					i.setRanInt(ri);
			}
			DataSancion ds = new DataSancion();
			i = ds.getById(i); // carga las sanciones del mismo
			DataHoras dh = new DataHoras();
			i = dh.getHorasSemana(i); // cambiar para q traiga todas las de la semana
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
			rs= stmt.executeQuery("select nombre,apellido,steamHex,ri.fechaDesde,discordId,r2.nombRango,s.descripcion,i.idIntegrante\r\n"
					+ "from (select max(ri.fechaDesde) fecha\r\n"
					+ "    from ran_integrante ri\r\n"
					+ "    group by ri.idIntegrante) as tabla\r\n"
					+ "inner join ran_integrante ri on ri.fechaDesde=tabla.fecha\r\n"
					+ "inner join rango r2 on ri.idRango = r2.idRango\r\n"
					+ "inner join integrante i on i.idIntegrante=ri.idIntegrante\r\n"
					+ "inner join rol r on i.idRol = r.idRol\r\n"
					+ "left join  ransub_integrante ri2 on i.idIntegrante = ri2.idIntegrante\r\n"
					+ "left join  subdivision s on ri2.idSub = s.idSub\r\n"
					+ "group by ri.idIntegrante;");
		
			if(rs!=null) 
			{
				integrantes = new LinkedList<>();
				while(rs.next()) 
				{
					i = new Integrante();
					r = new Rango();
					s = new Subdivision();
					ri = new Ran_Integrante();
				
					i.setNombre(rs.getString("nombre"));
					i.setApellido(rs.getString("apellido"));
					i.setDiscordId(rs.getString("discordId"));
					i.setIdIntegrante(rs.getInt("idIntegrante"));
					i.setSteamHex(rs.getString("steamHex"));
					
					r.setNomRango(rs.getString("nombRango"));
					s.setDescripcion(rs.getString("descripcion"));
					ri.setFecha_desde(rs.getDate("fechaDesde").toLocalDate());
					ri.setRango(r);
					i.setRanInt(ri);
					i.setSub(s);
					
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
		int c =1;
		try 
		{
			if(i.getPw() != null)
			{
				stmt=DbConnector.getInstancia().getConn().
						prepareStatement(
								"update integrante set  pw=AES_ENCRYPT(?,?),nombre=?, apellido=?, usuario=?, discordId=? where idIntegrante = ?");
				stmt.setString(c, i.getPw());c+=1;
				stmt.setString(c, LlaveMaestra.getLlave());c+=1;
			}
			else
			{
				stmt=DbConnector.getInstancia().getConn().
						prepareStatement(
								"update integrante set nombre=?, apellido=?, usuario=?, discordId=? where idIntegrante = ?");
			}
			
			
			stmt.setString(c, i.getNombre());c+=1;
			stmt.setString(c, i.getApellido());c+=1;
			stmt.setString(c, i.getUsuario());c+=1;
			stmt.setString(c, i.getDiscordId());c+=1;
			stmt.setInt(c, i.getIdIntegrante());
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
					+ "from (select max(ri.fechaDesde) fecha, ri.idIntegrante\r\n"
					+ "         from ran_integrante ri\r\n"
					+ "         where idIntegrante = idIntegrante\r\n"
					+ "         group by ri.idIntegrante) as tabla\r\n"
					+ "inner join ran_integrante ri on ri.fechaDesde=tabla.fecha and ri.idIntegrante = tabla.idIntegrante\r\n"
					+ "inner join integrante i on i.idIntegrante = ri.idIntegrante\r\n"
					+ "inner join rol r on i.idRol = r.idRol\r\n"
					+ "inner join rango r2 on ri.idRango = r2.idRango\r\n"
					+ "left join hora h on i.idIntegrante = h.idIntegrante\r\n"
					+ "left join  ransub_integrante ri2 on i.idIntegrante = ri2.idIntegrante and ri2.fechaDesde = (select max(ransub_integrante.fechaDesde)\r\n"
					+ "                                                                                            from ransub_integrante\r\n"
					+ "                                                                                            where idIntegrante = i.idIntegrante)\r\n"
					+ "left join subdivision s on ri2.idSub = s.idSub\r\n"
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
