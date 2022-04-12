package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import entities.*;

public class DataLugarRobo 
{
	
	public LinkedList<LugarRobo> getAll()
	{
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<LugarRobo> robos= new LinkedList<>();
		try {
			stmt= DbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select * from lugarrobo");
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					LugarRobo r=new LugarRobo();
					r.setIdLugarRobo(rs.getInt("idLugarRobo"));
					r.setTipoRobo(rs.getString("tipoRobo"));
					r.setLugarRobo(rs.getString("lugarRobo"));
					r.setMaxIntegrantes(rs.getInt("maxIntegrantes"));
					r.setMinIntregantes(rs.getInt("minIntegrantes"));
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
	
	public LugarRobo getById(LugarRobo roboToSearch) 
	{
		LugarRobo r=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement("select * from lugarrobo where idLugarRobo=?"					);
			stmt.setInt(1, roboToSearch.getIdLugarRobo());
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) 
			{
				r=new LugarRobo();
				r.setIdLugarRobo(rs.getInt("idLugarRobo"));
				r.setTipoRobo(rs.getString("tipoRobo"));
				r.setLugarRobo(rs.getString("lugarRobo"));
				r.setMaxIntegrantes(rs.getInt("maxIntegrantes"));
				r.setMinIntregantes(rs.getInt("minIntegrantes"));
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
		return r;
	}
	
	public LugarRobo getByNomb(LugarRobo roboToSearch) 
	{
		LugarRobo r=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement("select * from rol where nomRobo=?");
			stmt.setString(1, roboToSearch.getTipoRobo());
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) 
			{
				r=new LugarRobo();
				r.setIdLugarRobo(rs.getInt("idLugarRobo"));
				r.setTipoRobo(rs.getString("nomRobo"));
				r.setLugarRobo(rs.getString("lugarRobo"));
				r.setMaxIntegrantes(rs.getInt("maxIntegrantes"));
				r.setMinIntregantes(rs.getInt("minIntegrantes"));
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
		return r;
	}
	
	public void add(LugarRobo robo) 
	{
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
							"insert into robo(nomRobo, lugarRobo, maxIntegrantes, minIntegrantes) values(?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, robo.getTipoRobo());
			stmt.setString(2, robo.getLugarRobo());
			stmt.setInt(3, robo.getMaxIntegrantes());
			stmt.setInt(4, robo.getMinIntegrantes());
			stmt.executeUpdate();
			
			keyResultSet=stmt.getGeneratedKeys();
            if(keyResultSet!=null && keyResultSet.next())
            {
                robo.setIdLugarRobo(keyResultSet.getInt(1));
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
	}

	public void update(LugarRobo robo) 
	{
		PreparedStatement stmt= null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement("update robo set nomRobo=?, lugarRobo=?, maxIntegrantes=?, minIntegrantes=? where idLugarRobo=?");
			stmt.setString(1, robo.getTipoRobo());
			stmt.setString(2, robo.getLugarRobo());
			stmt.setInt(3, robo.getMaxIntegrantes());
			stmt.setInt(4, robo.getMinIntegrantes());
			stmt.setInt(5, robo.getIdLugarRobo());
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

	public void remove(LugarRobo robo) 
	{
		PreparedStatement stmt= null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement("delete from robo where idLugarRobo=?");
			stmt.setInt(1, robo.getIdLugarRobo());
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
