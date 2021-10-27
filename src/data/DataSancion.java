package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Integrante;
import entities.Sancion;

public class DataSancion {


	public LinkedList<Sancion> getAll()
	{
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Sancion> sanciones= new LinkedList<>();
		try {
			stmt= DbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select * from sancion");
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					Sancion s = new Sancion();
					s.setMotivo(rs.getString("motivo"));
					s.setIdIntegrante(rs.getInt("idIntegrante"));
					s.setTipoSancion(rs.getString("tipoSancion"));
					sanciones.add(s);
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
		
		return sanciones;
	}
	
	public Integrante getById(Integrante i)
	{
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Sancion> sanciones= new LinkedList<>();
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			 "select * from sancion where idIntegrante = ?");
			stmt.setInt(1, i.getIdIntegrante());
			rs=stmt.executeQuery();
			
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					Sancion san =new Sancion();
					san.setIdIntegrante(san.getIdIntegrante());
					san.setMotivo(rs.getString("motivo"));		
					san.setTipoSancion(rs.getString("tipoSancion"));
					san.setEstado(rs.getBoolean("estado"));
					san.setNroSancion(rs.getInt("nroSancion"));
					san.setFecha(rs.getDate("fecha").toLocalDate());
					san.setUrlSancion(rs.getString("urlImagen"));
					sanciones.add(san);
				}
			}	
			i.setSancion(sanciones);
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
		return i;
	}
	
	public Sancion getByIdAndMotivo(Sancion sancionToSearch) {
		Sancion s = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select * from sancion where idIntegrante=?, motivo = ?"
					);
			stmt.setInt(1, sancionToSearch.getIdIntegrante());
			stmt.setString(2, sancionToSearch.getMotivo());
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) 
			{
				s=new Sancion();
				s.setIdIntegrante(rs.getInt("idIntegrante"));
				s.setMotivo(rs.getString("motivo"));
				s.setTipoSancion(rs.getString("tipoSancion"));
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
		return s;
	}

	public Sancion getByTipoSancion(Sancion sancionToSearch) {
		Sancion s = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select * from sancion where tipoSancion=?"
					);
			stmt.setInt(1, sancionToSearch.getIdIntegrante());
			stmt.setString(2, sancionToSearch.getMotivo());
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) 
			{
				s = new Sancion();
				s.setIdIntegrante(rs.getInt("idIntegrante"));
				s.setMotivo(rs.getString("motivo"));
				s.setTipoSancion(rs.getString("tipoSancion"));
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
		
		return s;
	}

	public void add(Sancion s) 
	{
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into sancion (tipoSancion, motivo, idIntegrante, estado, nroSancion, fecha, urlImagen) VALUES "+
							"(?,?,?,?,?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS
							);
			stmt.setString(1, s.getTipoSancion());
			stmt.setString(2, s.getMotivo());
			stmt.setInt(3, s.getIdIntegrante());
			stmt.setBoolean(4, true);
			stmt.setInt(5, s.getNroSancion());
			stmt.setObject(6, s.getFecha());
			stmt.setString(7, s.getUrlSancion());
			stmt.executeUpdate();
			
			keyResultSet=stmt.getGeneratedKeys();
            if(keyResultSet!=null && keyResultSet.next())
            {
                s.setIdIntegrante(keyResultSet.getInt(1));
                s.setMotivo(keyResultSet.getString(2));
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

	public void update(Sancion s) {
		PreparedStatement stmt= null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"update sancion set tipoSancion=?");
			stmt.setString(1, s.getTipoSancion());
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

	public void delete(Sancion s) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement("delete from sancion where  idIntegrante = ?, motivo = ?");
			stmt.setInt(1, s.getIdIntegrante());
			stmt.setString(2, s.getMotivo());
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
	
}
