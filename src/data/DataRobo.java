package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.LinkedList;

import entities.Integrante;
import entities.LugarRobo;
import entities.Robo;

public class DataRobo
{
	public LinkedList<Robo> getAllRobosIntegrante(Integrante inte)
	{
		Statement stmt=null;
		ResultSet rs=null;
		Robo r = null;
		LugarRobo lr = null;
		LinkedList<Robo> robos= null;
		try {
			
			stmt=DbConnector.getInstancia().getConn().prepareStatement("select r.nroRobo, r.resultado, lug.lugarRobo, lug.tipoRobo\r\n"
					+ " from robo r\r\n"
					+ " inner join lugarrobo lug on r.idLugarRobo = lug.idLugarRobo\r\n"
					+ " inner join integrante i\r\n"
					+ " on  r.nroRobo = i.idIntegrante\r\n"
					+ " where i.idIntegrante = ?");
			
			stmt.setInt(1, inte.getIdIntegrante());
			
			rs=stmt.executeQuery();
			
			if(rs!=null) 
			{
				robos = new LinkedList<>();
				while(rs.next()) 
				{
					r=new Robo();
					lr = new LugarRobo();
					
					r.setNroRobo(rs.getInt("nroRobo"));
					r.setResultado(rs.getString("resultado"));
					lr.setLugarRobo("lugarRobo");
					lr.setTipoRobo("tipoRobo");
					
					r.setLugar_robo(lr);

					robos.add(r);
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
		return robos;
	}
	
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
					"delete from robo where idIntegrante = ?");
			
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

	public void insertRobo(Robo rob, Integrante inte, LugarRobo lr) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into robo(nroRobo, idIntegrante, resultado,hora_robo,fecha_robo,idLugarRobo) values(?,?,?,?,?,?)"
							);
			stmt.setInt(1, rob.getNroRobo());
			stmt.setInt(2, inte.getIdIntegrante());
			stmt.setString(3,rob.getResultado());
			stmt.setObject(4,rob.getHora_robo());
			stmt.setObject(5,rob.getFecha_robo());
			stmt.setInt(6,lr.getIdLugarRobo());
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
	public Robo getLastIdRobo() 
	{	
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Robo rd = null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement("select max(nroRobo)as nro from robo");
			rs= stmt.executeQuery();
			if(rs!=null && rs.next()) 
			{
					rd = new Robo();
					rd.setNroRobo(rs.getInt("nro")+1);
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
			stmt=DbConnector.getInstancia().getConn().prepareStatement("select count(*) as Suma from robo where idIntegrante = ?");
			stmt.setInt(1, i.getIdIntegrante());
			rs= stmt.executeQuery();
			
			if(rs!=null && rs.next()) 
			{
				numeros = new LinkedList<Integer>();
				numeros.add(rs.getInt("Suma"));
			}
			
			stmt=null;
			rs=null;
			stmt=DbConnector.getInstancia().getConn().prepareStatement("select count(*) as SumaG from robo where idIntegrante = ? and resultado = ?");
			stmt.setInt(1, i.getIdIntegrante());
			stmt.setString(2, "Ganado");
			rs= stmt.executeQuery();
			if(rs!=null && rs.next()) 
			{
				numeros.add(rs.getInt("SumaG"));
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

}
