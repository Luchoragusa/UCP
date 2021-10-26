package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalTime;
import java.util.*;



import entities.Hora;
import entities.Integrante;
import entities.Ran_Subdivision;
import entities.Rango;
import entities.Rol;
import entities.Subdivision;

	public class DataIntegrante 
	{
	Scanner s = null;
	public Integrante getByUser(Integrante inte) {
		
		
		Integrante i=null;
		Rol rolcito = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select idIntegrante,nombre,apellido,discordId,steamHex, i.idRol, r.descripcion\r\n"
					+ " from integrante i\r\n"
					+ " inner join rol r\r\n"
					+ "	on i.idRol = r.idRol\r\n"
					+ " where usuario=? and pw=?"
					);
			stmt.setString(1, inte.getUsuario());
			stmt.setString(2, inte.getPw());
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				i=new Integrante();
				rolcito = new Rol();
				i.setIdIntegrante(rs.getInt("idIntegrante"));
				i.setNombre(rs.getString("nombre"));
				i.setApellido(rs.getString("apellido"));
				i.setSteamHex(rs.getString("steamHex"));
				i.setDiscordId(rs.getString("discordId"));
				//
				rolcito.setIdRol(rs.getInt("idRol"));
				rolcito.setDescripcion(rs.getString("descripcion"));
				
				i.setRol(rolcito);
			
			}
		} catch (SQLException e) 
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
		return i;
	}
	
	public Boolean getLogin(Integrante inte) 
	{
		boolean status = false;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select idIntegrante,nombre,apellido,discordId,steamHex from integrante where usuario=? and pw=?"
					);
			stmt.setString(1, inte.getUsuario());
			stmt.setString(2, inte.getPw());
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

	public Integrante getByIdIntegrante(Integrante inte) {


		DataRol dr=new DataRol();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		Integrante i=null;
		
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			 "select nombre,apellido, discordId,steamHex,usuario from integrante where idIntegrante = ?");
			stmt.setInt(1, inte.getIdIntegrante());
			rs=stmt.executeQuery();
			
			if(rs!=null && rs.next()) 
			{
					i=new Integrante();					
					i.setNombre(rs.getString("nombre"));
					i.setApellido(rs.getString("apellido"));
					i.setIdIntegrante(inte.getIdIntegrante());
					i.setDiscordId(rs.getString("discordId"));
					i.setSteamHex(rs.getString("steamHex"));
					i.setUsuario(rs.getString("usuario"));
					
					dr.setRoles(i);
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
		return i;
	}
	
	public LinkedList<Integrante> getAll() 
	{
		DataRol dr=new DataRol();
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Integrante> inte= new LinkedList<>();		
		try {
			stmt= DbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select idIntegrante,nombre,apellido,discordId,steamHex from integrante");
		
			if(rs!=null) {
				while(rs.next()) {
					Integrante i=new Integrante();
					
					i.setIdIntegrante(rs.getInt("idIntegrante"));
					i.setNombre(rs.getString("nombre"));
					i.setApellido(rs.getString("apellido"));
					i.setDiscordId(rs.getString("discordId"));
					i.setSteamHex(rs.getString("steamHex"));
					dr.setRoles(i);
					
					inte.add(i);
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
		return inte;
	}
	
	public LinkedList<Integrante> getByApellido(Integrante inte) {

		DataRol dr=new DataRol();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Integrante> integ= new LinkedList<>();
		//rfrfr
		try 
		{
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
			 "select idIntegrante,nombre,discordId,steamHex,usuario from integrante where apellido = ?");
			stmt.setString(1, inte.getApellido());
			rs=stmt.executeQuery();
			
			if(rs!=null) 
			{
				while(rs.next()) 
				{
					Integrante i=new Integrante();
					i.setIdIntegrante(rs.getInt("idIntegrante"));
					i.setNombre(rs.getString("nombre"));
					i.setApellido(inte.getApellido());
					i.setDiscordId(rs.getString("discordId"));
					i.setSteamHex(rs.getString("steamHex"));
					i.setUsuario(rs.getString("usuario"));
					
					dr.setRoles(i);
					
					integ.add(i);
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
		return integ;
	
	}

	public void add(Integrante i) {
		s = new Scanner(System.in);
		Rol r = new Rol();
		DataRol dr = new DataRol();
		Boolean otroRol = true;
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into integrante(nombre, apellido, discordId, steamHex, usuario, pw) values(?,?,?,?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS
							);
			stmt.setString(1, i.getNombre());
			stmt.setString(2, i.getApellido());
			stmt.setString(3, i.getDiscordId());
			stmt.setString(4, i.getSteamHex());
			stmt.setString(5, i.getUsuario());
			stmt.setString(6, i.getPw());
			stmt.executeUpdate();
			
			keyResultSet=stmt.getGeneratedKeys();
			
			if(keyResultSet!=null && keyResultSet.next()){
                i.setIdIntegrante(keyResultSet.getInt(1));
            }
            
			while(otroRol) {
				r = this.executeRol();
				if (i.hasRol(r)) System.out.println("\n Esta persona ya tiene ese rol asignado ");
				else {
					dr.setRoles(i);
					dr.saveRoles(i,r);
					System.out.print("\n rol asinado correctamente ");
				}
				System.out.print("\n Desea agregar otro rol? \n (1 = SI / 2 = NO): ");
				if(s.nextInt() == 1) {
					otroRol = true;
				}else otroRol =false;
			}
			
			
			
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
	}

	
	public Rol executeRol() {
		s = new Scanner(System.in);
		DataRol dr = new DataRol();
		Rol r = new Rol();
		int idRol = 0;
		Boolean band = true;
		
		System.out.println("Lista de Roles: ");
		System.out.println(dr.getAll());
		while(band) {
			System.out.print("Ingrese ID del rol elegido: ");
			idRol = s.nextInt();
			r.setIdRol(idRol);
			r = dr.getById(r);
			if(r.getDescripcion() != null) {
				band=false;
			}
			else System.out.print("\n ID de Rol invalido intente nuevamente.");
		}
		
		return r;
	}
	
	public void update(Integrante i) {

		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try 
		{
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"update integrante set nombre=?, apellido=?, usuario=?, pw=?, discordId=?, steamHex=? where idIntegrante = ?");
			
			stmt.setString(1, i.getNombre());
			stmt.setString(2, i.getApellido());
			stmt.setString(3, i.getUsuario());
			stmt.setString(4, i.getPw());
			stmt.setString(5, i.getDiscordId());
			stmt.setString(6, i.getSteamHex());	
			stmt.setInt(7, i.getIdIntegrante());	
			stmt.executeUpdate();
			this.updateRoles(i);
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

	public void delete(Integrante i) {

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

	private void updateRoles(Integrante i) {
		 s = new Scanner(System.in);
		DataRol dr = new DataRol();
		Rol r = new Rol();
		Boolean tieneRol = false;
		Boolean band = true;
		int b1 = 1;
		for(int p=1;p<=dr.getAll().size();p++) {
			 r.setIdRol(p);
			 if(i.hasRol(r)) tieneRol=true ; 
		}
		
		if(tieneRol) {
			System.out.println("\n Esta persona ya tiene roles asignados: ");
			System.out.println("\n" + i);	
			System.out.print("\n Desea a�adir otro rol? (S/N): ");
			if(s.nextLine().trim().equalsIgnoreCase("S")) {
				r = this.executeRol();
				dr.setRoles(i);
				i.addRol(r);
				dr.saveRoles(i, r);
				System.out.print("\n rol asinado correctamente ");
			}
			System.out.print("\n Desea eliminar algun rol? (S/N): ");
			if(s.nextLine().trim().equalsIgnoreCase("S")) {
				while(band) {
					r = this.executeRol();
					if(i.hasRol(r)) {
						dr.setRoles(i);
						i.removeRol(r);
						dr.undoneRol(i, r);
						System.out.print("\n rol eliminado correctamente"
								+"\n Desea eliminar otro? (S/N): ");
						if(s.nextLine().trim().equalsIgnoreCase("S")) band = true; else band=false;
					}else {
						System.out.println("Esta persona no contiene ese rol"
								+ "\n intente nuevamente");
					}
				}
			}
		}else {
			System.out.println("\n Esta persona NO tiene roles asignados ");
			System.out.println("\n A continuacion se asignaran roles: ");
			while(b1 == 1) {
				r = this.executeRol();
				dr.setRoles(i);
				i.addRol(r);
				dr.saveRoles(i, r);
				
				System.out.print("\n rol asignado correctamente ");
				System.out.println("\n Desea a�adir otro rol? \n 1 = SI / 2 = NO: ");
				if(s.nextInt() != 1) {
					b1 = 2;
				}
				
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
		Ran_Subdivision rans = null;
		
		try {
			stmt= DbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select nombre, apellido, fechaInicio ,r.nombRango, s.descripcion, horaInicio \r\n"
					+ "from hora\r\n"
					+ "\r\n"
					+ "inner join integrante i on hora.idIntegrante = i.idIntegrante\r\n"
					+ "inner join ran_integrante ri on i.idIntegrante = ri.idIntegrante\r\n"
					+ "inner join rango r on ri.idRango = r.idRango\r\n"
					+ "\r\n"
					+ "inner join ransub_integrante ri2 on i.idIntegrante = ri2.idIntegrante\r\n"
					+ "inner join ran_subdivision rs on ri2.idRanSub = rs.idRanSub\r\n"
					+ "inner join  subdivision s on rs.idSub = s.idSub\r\n"
					+ "\r\n"
					+ "where horaInicio is not null and horaFin is null;");
		
			if(rs!=null) 
			{
				uActivos = new LinkedList<>();
				while(rs.next()) 
				{
					i = new Integrante();
					r = new Rango();
					h = new Hora();
					s = new Subdivision();
				
				
					i.setNombre(rs.getString("nombre"));
					i.setApellido(rs.getString("apellido"));
					
					r.setNomRango(rs.getString("nombRango"));
					h.setHoraInicio(rs.getObject("horaInicio", LocalTime.class));
					s.setDescripcion(rs.getString("descripcion"));
					h.setFechaInicio(rs.getDate("fechaInicio").toLocalDate());
					
					i.setHora(h);
					i.setRango(r);
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
