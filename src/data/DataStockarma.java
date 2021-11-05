package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import entities.Arma;
import entities.Stockarma;

public class DataStockarma {
	
	public LinkedList<Stockarma> getByIdArma(Arma a){

		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Stockarma> starmas= new LinkedList<>();
		
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			 "select * from stockarma where idArma = ?");
			stmt.setInt(1, a.getIdArma());
			rs=stmt.executeQuery();
			
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					Stockarma s =new Stockarma();
					s.setArma(a);
					s.setFecha(rs.getDate("fecha").toLocalDate());
					s.setCantidad(rs.getInt("cantidad"));					
					starmas.add(s);
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
		return starmas;
	
	}
	
	public LinkedList<Stockarma> getByFecha(Stockarma st){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Stockarma> starmas= new LinkedList<>();
		
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			 "select idArma, cantidad from stockarma where fecha = ?");
			stmt.setObject(1, st.getFecha());
			rs=stmt.executeQuery();
			
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					Stockarma s =new Stockarma();
					Arma a = new Arma();
					a.setIdArma(rs.getInt("idArma"));
					
					s.setArma(a);
					s.setFecha(st.getFecha());
					s.setCantidad(rs.getInt("cantidad"));					
					starmas.add(s);
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
		return starmas;
	}

	public LinkedList<Stockarma> getByCantidad(Stockarma st){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Stockarma> starmas= new LinkedList<>();
		
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			 "select idArma, fecha from stockarma where cantidad = ?");
			stmt.setInt(1, st.getCantidad());
			rs=stmt.executeQuery();
			
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					Stockarma s =new Stockarma();
					Arma a = new Arma();
					a.setIdArma(rs.getInt("idArma"));
					
					s.setArma(a);
					s.setFecha(rs.getDate("fecha").toLocalDate());
					s.setCantidad(st.getCantidad());					
					starmas.add(s);
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
		return starmas;
	}


	public void add (Stockarma st, Arma a) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into stockarma(idArma,fecha,cantidad) values(?,?,?)"
							);
			stmt.setInt(1, a.getIdArma());
			stmt.setObject(2, st.getFecha());
			stmt.setInt(3, st.getCantidad());
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
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } 
            catch (SQLException e) 
            {
            	e.printStackTrace();
            }
		}

	}
	
	
	public void remove(Stockarma st, Arma a) {

		PreparedStatement stmt= null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from stockarma where idArma=?, fecha=?");
			stmt.setInt(1, a.getIdArma());
			stmt.setObject(2, st.getFecha());
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
