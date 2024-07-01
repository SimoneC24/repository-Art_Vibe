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

public class OrdineDAO implements IBeanDAO<OrdineBean> {
	
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
	public void doSave(OrdineBean ordine) throws SQLException {}
	
	public int doSaveInt(OrdineBean ordine) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet generatedKeys = null;

        String insertSQL = "INSERT INTO ordine (totale, data_ordine, numero_carta, cvv_carta, data_scadenza_carta, id_utente) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        int generatedId = -1; // Valore di default nel caso non venga generato l'ID

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setDouble(1, ordine.getTotale());
            preparedStatement.setDate(2, ordine.getData_ordine());
            preparedStatement.setString(3, ordine.getNumero_carta());
            preparedStatement.setInt(4, ordine.getCvv_carta());
            preparedStatement.setDate(5, ordine.getData_scadenza_carta());
            preparedStatement.setString(6, ordine.getId_utente());

            preparedStatement.executeUpdate();
            
            generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                generatedId = generatedKeys.getInt(1); // Ottieni l'ID generato
                System.out.println("Generated key=" + generatedId); // Stampa l'ID generato
            } else {
                throw new SQLException("Errore durante il recupero dell'ID dell'ordine.");
            }
        } finally {
            if (generatedKeys != null) {
                generatedKeys.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }

        return generatedId; // Restituisci l'ID generato
    }

	@Override
	public boolean doDelete(int code) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public OrdineBean doRetrieveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<OrdineBean> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doUpdate(OrdineBean bean) throws SQLException {
		// TODO Auto-generated method stub
		
	}
}
