package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mysql.cj.xdevapi.Statement;

public class OpereAcquistateDAO implements IBeanDAO<OpereAcquistate>{

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
	public void doSave(OpereAcquistate opere) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet generatedKeys = null;

        String insertSQL = "INSERT INTO opere_acquistate (ordine_id, nome_opera, prezzo_opera, immagine_opera, quantita_opera) "
                         + "VALUES (?, ?, ?, ?, ?)";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL);
            
            preparedStatement.setInt(1, opere.getOrdine_id());
            preparedStatement.setString(2, opere.getNome_opera());
            preparedStatement.setDouble(3, opere.getPrezzo_opera());
            preparedStatement.setBytes(4, opere.getImmagine_opera());
            preparedStatement.setInt(5, opere.getQuantita_opera());

            preparedStatement.executeUpdate();
            
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }
	
	public List<OpereAcquistate> doRetrieveAllByOrder(int ordineId) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<OpereAcquistate> opereAcquistateList = new ArrayList<>();

        String selectSQL = "SELECT * FROM opere_acquistate WHERE ordine_id = ?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, ordineId);

            resultSet = preparedStatement.executeQuery();
            
            System.out.println("Qui ci arrivo");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nomeOpera = resultSet.getString("nome_opera");
                double prezzoOpera = resultSet.getDouble("prezzo_opera");
                byte[] immagineOpera = resultSet.getBytes("immagine_opera");
                int quantitaOpera = resultSet.getInt("quantita_opera");

                OpereAcquistate opera = new OpereAcquistate(ordineId, nomeOpera, prezzoOpera, immagineOpera, quantitaOpera);
                opera.setId(id);
                
                System.out.println("Il nome dell'opera: "+nomeOpera);

                opereAcquistateList.add(opera);
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }

        return opereAcquistateList;
    }

	@Override
	public boolean doDelete(int code) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public OpereAcquistate doRetrieveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection doRetrieveAll() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doUpdate(OpereAcquistate opere) throws SQLException {
		// TODO Auto-generated method stub
		
	}
}
