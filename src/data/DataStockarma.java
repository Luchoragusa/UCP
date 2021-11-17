package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import entities.Arma;
import entities.Stockarma;

public class DataStockarma {
	
	public LinkedList<Stockarma> getByIdArma(Arma a)
	{
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

	public LinkedList<Stockarma> getAll()
	{
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Stockarma> lista= null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
				 "select nombreArma, tipoArma, cantidad, fecha\r\n"
				 + "from (select max(fecha) as fechaT, idArma\r\n"
				 + "        from stockarma\r\n"
				 + "        group by idArma) as tabla\r\n"
				 + "inner join arma a on tabla.idArma = a.idArma\r\n"
				 + "inner join stockarma s on tabla.idArma = s.idArma and tabla.fechaT = s.fecha");
			rs=stmt.executeQuery();
			
			if(rs!=null) 
			{
				lista = new LinkedList<Stockarma>();
				while(rs.next()) 
				{
					Stockarma s =new Stockarma();
					Arma a = new Arma();
					
					a.setNombreArma(rs.getString("nombreArma"));
					a.setTipoArma(rs.getString("tipoArma"));
					
					s.setArma(a);
					s.setFecha(rs.getDate("fecha").toLocalDate());
					s.setCantidad(rs.getInt("cantidad"));		
					lista.add(s);
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
		return lista;
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
