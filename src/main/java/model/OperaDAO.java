package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OperaDAO implements IBeanDAO<OperaBean>
{
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

	@Override
	public void doSave(OperaBean bean) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    String insertSQL = "INSERT INTO opera (Nome, Prezzo, Stile, Artista, data_creazione, Descrizione, Immagine) " +
	                       "VALUES (?, ?, ?, ?, ?, ?, ?)";

	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(insertSQL);

	        preparedStatement.setString(1, bean.getNome());
	        preparedStatement.setDouble(2, bean.getPrezzo());
	        preparedStatement.setString(3, bean.getStile());
	        preparedStatement.setString(4, bean.getArtista());
	        preparedStatement.setDate(5, bean.getDataCreazione());
	        preparedStatement.setString(6, bean.getDescrizione());
	        preparedStatement.setBytes(7, bean.getImmagine()); // Set immagine as BLOB

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
	public OperaBean doRetrieveByKey(int code) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    String selectSQL = "SELECT * FROM opera WHERE ID_Opera = ?";

	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setInt(1, code);

	        ResultSet rs = preparedStatement.executeQuery();

	        if (rs.next()) {
	            OperaBean opera = new OperaBean(
	                rs.getInt("ID_Opera"),
	                rs.getString("Nome"),
	                rs.getDouble("Prezzo"),
	                rs.getString("Stile"),
	                rs.getString("Artista"),
	                rs.getDate("data_creazione"),
	                rs.getBytes("Immagine"), // Retrieve immagine as BLOB
	                rs.getString("Descrizione")
	            );
	            return opera;
	        }

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
	public Collection<OperaBean> doRetrieveAll(String order) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    Collection<OperaBean> opere = new ArrayList<>();

	    String selectSQL = "SELECT * FROM opera";

	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);

	        ResultSet rs = preparedStatement.executeQuery();

	        while (rs.next()) {
	            OperaBean opera = new OperaBean(
	                rs.getInt("ID_Opera"),
	                rs.getString("Nome"),
	                rs.getDouble("Prezzo"),
	                rs.getString("Stile"),
	                rs.getString("Artista"),
	                rs.getDate("data_creazione"),
	                rs.getBytes("Immagine"), // Retrieve immagine as BLOB
	                rs.getString("Descrizione")
	            );
	            opere.add(opera);
	        }

	        return opere;

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
}