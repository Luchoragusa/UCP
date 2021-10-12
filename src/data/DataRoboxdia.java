package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.HashMap;

import entities.Integrante;
import entities.LugarRobo;
import entities.Roboxdia;

public class DataRoboxdia {
	
	public void saveRobo(Integrante intg, LugarRobo rob, Roboxdia rd) {

		PreparedStatement stmt=null;
		ResultSet rs=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement( 
					"insert into roboxdia (idLugarRobo, idIntegrante, fecha_robo, hora_robo,resultado, idRobo) values(?,?,?,?,?,?)");
			
			stmt.setInt(1, rd.getIdLugarRobo());
			stmt.setInt(2, intg.getIdIntegrante());
			stmt.setObject(3, rd.getFecha_robo());
			stmt.setObject(4, rd.getHora_robo());
			stmt.setString(5, rd.getResultado());
			stmt.setInt(6, rd.getIdRobo());
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
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
	
	}
	
	public void deleteRobo(Integrante intg) {

		PreparedStatement stmt=null;
		ResultSet rs=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement( 
					"delete from roboxdia where idIntegrante = ?");
			
			stmt.setInt(1, intg.getIdIntegrante());
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
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
	
	}

	public void setRobos(Integrante intg) 
	{	
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					  "select robo.* "
					+ "from robo "
					+ "inner join roboxdia "
					+ "on robo.idLugarRobo = roboxdia.idLugarRobo "
					+ "where idIntegrante=?"
					);
			stmt.setInt(1, intg.getIdIntegrante());
			rs= stmt.executeQuery();
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					LugarRobo r=new LugarRobo();
					r.setIdLugarRobo(rs.getInt("idLugarRobo"));
					r.setNomRobo(rs.getString("nomRobo"));
					r.setLugarRobo(rs.getString("lugarRobo"));
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
	}
	
	public Roboxdia getLastIdRobo() 
	{	
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Roboxdia rd = null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement("select max(idRobo) from roboxdia");
			rs= stmt.executeQuery();
			if(rs!=null && rs.next()) 
			{
					rd = new Roboxdia();
					rd.setIdRobo(rs.getInt("max(idRobo)"));
					rd.setIdRobo(rd.getIdRobo()+1);
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
		return rd;
	}
	
	public HashMap<HashMap<Integrante, Roboxdia>, LugarRobo> getUltimos5robos() // hacer el Hash para las 3 entidades
	{	
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Integrante i = null;
		LugarRobo r = null;
		Roboxdia rxd = null;
		
		HashMap<Integrante,Roboxdia> irxd = null;
	
		HashMap<HashMap<Integrante,Roboxdia>, LugarRobo> inteRxdR = null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement("select i.nombre, i.apellido, r.nomRobo, roboxdia.resultado, roboxdia.hora_robo, roboxdia.idRobo \r\n"
					+ "					from integrante i\r\n"
					+ "                    inner join roboxdia  on roboxdia.idIntegrante = i.idIntegrante \r\n"
					+ "                    inner join robo r on r.idLugarRobo = roboxdia.idLugarRobo\r\n"
					+ "					where roboxdia.idRobo between ((select max(roboxdia.idRobo)-5 from roboxdia)) and (select max(roboxdia.idRobo) from roboxdia) \r\n"
					+ "					order by roboxdia.idRobo asc");
			rs= stmt.executeQuery();
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					irxd = new HashMap<>();
					inteRxdR = new HashMap<>();
					r=new LugarRobo();
					r.setNomRobo(rs.getString("nomRobo"));
					
					rxd=new Roboxdia();
					rxd.setResultado(rs.getString("resultado"));
					rxd.setIdRobo(rs.getInt("idRobo"));
					rxd.setHora_robo(rs.getObject("hora_robo", LocalTime.class));
					
					i=new Integrante();
					i.setNombre(rs.getString("nombre"));
					i.setApellido(rs.getString("apellido"));
					irxd.put(i,rxd);
					inteRxdR.put(irxd,r);
					
					
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
		return inteRxdR;
	}	


}
