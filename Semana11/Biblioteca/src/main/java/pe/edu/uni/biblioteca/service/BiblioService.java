package pe.edu.uni.biblioteca.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pe.edu.uni.biblioteca.db.AccesoDB;
import pe.edu.uni.biblioteca.dto.PrestamoDto;

public class BiblioService {

	public void registrarPrestamo(PrestamoDto dto) {
		Connection cn = null;
		try{
			// La conexion
			cn = AccesoDB.getConnection();
			cn.setAutoCommit(false); // Inicia la Tx
			// Validaciones
			validarEjemplar(cn,dto.getIdEjemplar());
			
			
			// Proceso
			
			
			// Confirmar Tx
			cn.commit();
			
		} catch (SQLException e) {
			try {
				cn.rollback(); // Cancela la Tx
			} catch (Exception e1) {
			}
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			try {
				cn.rollback(); // Cancela la Tx
			} catch (Exception e1) {
			}
			throw new RuntimeException("Error en el proceso, intentalo mas tarde.");
		}
		finally{
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
	
	}

	private void validarEjemplar(Connection cn, Long idEjemplar) throws SQLException {
		String sql = """
			SELECT COUNT(1) CONT FROM EJEMPLAR 
			WHERE IDEJEMPLAR=? AND IDSITUACION=1         
      """;
		PreparedStatement pstm = cn.prepareStatement(sql);
		pstm.setLong(1, idEjemplar);
		ResultSet rs = pstm.executeQuery();
		rs.next();
		int cont = rs.getInt("cont");
		rs.close();
		pstm.close();;
		if(cont != 1){
			throw new SQLException("Ejemplar no existe o no esta disponible.");
		}
	}
	
}
