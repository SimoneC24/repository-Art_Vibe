package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PersonaDAO implements IBeanDAO<PersonaBean> {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/art_vibe");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	public static PersonaBean doRetriveByEmailPassword(String email, String password) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String selectSQL = "SELECT * FROM persona WHERE email=? AND password=SHA1(?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);

			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				PersonaBean p = new PersonaBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), email, password);
				return p;
			} else
				return null;

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	@Override
	public synchronized void doSave(PersonaBean persona) throws SQLException {
	    
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    
	    String insertSQL = "INSERT INTO persona (nome, cognome, cf, indirizzo, email, password) VALUES (?, ?, ?, ?, ?, ?)";
	    
	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(insertSQL);
	        
	        preparedStatement.setString(1, persona.getNome());
	        preparedStatement.setString(2, persona.getCognome());
	        preparedStatement.setString(3, persona.getCf());
	        preparedStatement.setString(4, persona.getIndirizzo());
	        preparedStatement.setString(5, persona.getEmail());
	        preparedStatement.setString(6, persona.getPassword());
	        
	        preparedStatement.executeUpdate();
	        
	    } catch (SQLException e) {
	        throw new RuntimeException(e);
	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            if (connection != null)
	                connection.close();
	        }
	    }
	}


	@Override
	public boolean doDelete(int code) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PersonaBean doRetrieveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<PersonaBean> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
}
