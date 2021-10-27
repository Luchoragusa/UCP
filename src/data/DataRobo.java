package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.LinkedList;

import entities.Integrante;
import entities.LugarRobo;
import entities.Robo;

public class DataRobo
{
	public void saveRobo(Integrante intg, LugarRobo rob, Robo rd) 
	{
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement( 
					"insert into roboxdia (idLugarRobo, idIntegrante, fecha_robo, hora_robo,resultado, idRobo) values(?,?,?,?,?,?)");
			
			//stmt.setInt(1, rd.getIdLugarRobo());
			stmt.setInt(2, intg.getIdIntegrante());
			stmt.setObject(3, rd.getFecha_robo());
			stmt.setObject(4, rd.getHora_robo());
			stmt.setString(5, rd.getResultado());
			//stmt.setInt(6, rd.getIdRobo());
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
	
	public void deleteRobo(Integrante intg) 
	{
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

	public Robo getLastIdRobo() 
	{	
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Robo rd = null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement("select max(idRobo) from roboxdia");
			rs= stmt.executeQuery();
			if(rs!=null && rs.next()) 
			{
					rd = new Robo();
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
	
	public LinkedList<Integer> getPorcentaje(Integrante i) 
	{	
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Integer> numeros = null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement("select count(*) into @total from robo where idIntegrante = ?; select @total 'Total'");
			stmt.setInt(1, i.getIdIntegrante());
			//stmt.setInt(2, i.getIdIntegrante());
			//stmt.setString(3, "Ganado");
			//stmt.setInt(4, i.getIdIntegrante());
			//stmt.setString(5, "Empate");
			rs= stmt.executeQuery();
			
			if(rs!=null && rs.next()) 
			{
				numeros = new LinkedList<Integer>();
				numeros.add(rs.getInt("Total"));
				//numeros.add(rs.getInt("@total"));
				//numeros.add(rs.getInt("@empatado"));
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
		return numeros;
	}
	
	public HashMap<HashMap<Integrante, Robo>, LugarRobo> getUltimos5robos() // hacer el Hash para las 3 entidades
	{	
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Integrante i = null;
		LugarRobo r = null;
		Robo rxd = null;
		
		HashMap<Integrante,Robo> irxd = null;
	
		HashMap<HashMap<Integrante,Robo>, LugarRobo> inteRxdR = null;
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
					r.setTipoRobo(rs.getString("nomRobo"));
					
					rxd=new Robo();
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
