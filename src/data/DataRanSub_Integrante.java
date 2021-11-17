package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entities.Integrante;
import entities.Ran_Subdivision;
import entities.Ransub_integrante;

public class DataRanSub_Integrante {
	
	public void add(Ran_Subdivision rs) 									
	{
		Ransub_integrante rsi = rs.getRsi();
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement("insert into ransub_integrante(idIntegrante, fechaDesde, idRanSub, idSub) values(?,?,?,?)");
			stmt.setInt(1, rsi.getIdIntegrante());
			stmt.setObject(2, rsi.getFecha_desde());
			stmt.setInt(3, rsi.getIdRangoSub());
			stmt.setInt(4, rs.getIdSub());
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

	public void deleteByIntegrante(Integrante i) {

		PreparedStatement stmt= null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from ransub_integrante where idIntegrante=?");
			stmt.setInt(1, i.getIdIntegrante());
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
