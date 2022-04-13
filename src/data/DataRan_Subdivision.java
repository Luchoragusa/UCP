package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import entities.Ran_Subdivision;
import entities.Rango;

public class DataRan_Subdivision {
	
	public LinkedList<Ran_Subdivision> getByIdSub(Ran_Subdivision rsub) 
	{
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Ran_Subdivision> rsubs= new LinkedList<>();
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement("select * from ran_subdivision where idSub = ?");
			stmt.setInt(1, rsub.getIdSub());
			rs=stmt.executeQuery();
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					Ran_Subdivision s =new Ran_Subdivision();
					s.setIdSub(rsub.getIdSub());
					s.setIdRanSub(rs.getInt("idRanSub"));
					s.setNombreRangoSub(rs.getString("nombreRangoSub"));			
					rsubs.add(s);
				}
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
		return rsubs;
	}
	
	public void add(Ran_Subdivision rsub) 									
	{
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
							"insert into ran_subdivision(idSub, nombreRangoSub, idRanSub) values(?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, rsub.getIdSub());
			stmt.setString(2, rsub.getNombreRangoSub());			
			stmt.setInt(3, rsub.getIdRanSub());
			stmt.executeUpdate();		
			keyResultSet=stmt.getGeneratedKeys();
            if(keyResultSet!=null && keyResultSet.next())
            {
                rsub.setIdRanSub(keyResultSet.getInt(1)); 
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

	public void update(Rango rango) 
	{
		PreparedStatement stmt= null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement("update rango set nombRango=? where idRango=?");
			stmt.setString(1, rango.getNomRango());
			stmt.setInt(2, rango.getIdRango());
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

	public void remove(Ran_Subdivision rango) 
	{
		PreparedStatement stmt= null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement("delete from ran_subdivision where idRanSub=?");
			stmt.setInt(1, rango.getIdRanSub());
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
