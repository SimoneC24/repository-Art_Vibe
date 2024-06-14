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
	    ResultSet rs = null;

	    String selectSQL = "SELECT * FROM persona WHERE email=? AND password=SHA1(?)";
	    String checkClientSQL = "SELECT cf FROM cliente WHERE cf=?";
	    String checkAdminSQL = "SELECT cf FROM admin WHERE cf=?";

	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setString(1, email);
	        preparedStatement.setString(2, password);

	        rs = preparedStatement.executeQuery();

	        if (rs.next()) {
	            String codiceFiscale = rs.getString("cf");
	            PersonaBean p = new PersonaBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), email, password);

	            if (isCodiceFiscalePresent(connection, checkClientSQL, codiceFiscale)) {
	                p.setRole("client");
	            }
	            else if (isCodiceFiscalePresent(connection, checkAdminSQL, codiceFiscale)) {
	                p.setRole("admin");
	            }

	            return p;
	        } else {
	            return null;
	        }
	    } catch (SQLException e) {
	        throw new RuntimeException(e);
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (preparedStatement != null) preparedStatement.close();
	        } finally {
	            if (connection != null) connection.close();
	        }
	    }
	}

	private static boolean isCodiceFiscalePresent(Connection connection, String sql, String codiceFiscale) throws SQLException {
	    try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
	        preparedStatement.setString(1, codiceFiscale);
	        try (ResultSet rs = preparedStatement.executeQuery()) {
	            return rs.next();
	        }
	    }
	}


	@Override
	public synchronized void doSave(PersonaBean persona) throws SQLException {
	    
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    PreparedStatement preparedStatement2 = null;
	    
	    String insertSQL = "INSERT INTO persona (nome, cognome, cf, indirizzo, email, password) VALUES (?, ?, ?, ?, ?, ?)";
	    String insert2SQL = "INSERT INTO cliente (cf) VALUES (?)";
	    
	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(insertSQL);
	        preparedStatement2 = connection.prepareStatement(insert2SQL);
	        
	        preparedStatement.setString(1, persona.getNome());
	        preparedStatement.setString(2, persona.getCognome());
	        preparedStatement.setString(3, persona.getCf());
	        preparedStatement.setString(4, persona.getIndirizzo());
	        preparedStatement.setString(5, persona.getEmail());
	        preparedStatement.setString(6, persona.getPassword());
	        
	        preparedStatement.executeUpdate();
	        
	        preparedStatement2.setString(1, persona.getCf());
	        preparedStatement2.executeUpdate();
	        
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
