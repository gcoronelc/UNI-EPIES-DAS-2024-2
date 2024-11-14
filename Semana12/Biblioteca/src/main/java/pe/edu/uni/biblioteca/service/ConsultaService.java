package pe.edu.uni.biblioteca.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import pe.edu.uni.biblioteca.db.AccesoDB;
import pe.edu.uni.biblioteca.dto.EstudianteDto;
import pe.edu.uni.biblioteca.dto.UsuarioDto;

/**
 *
 * @author Eric Gustavo Coronel Castillo
 * @blog www.desarrollasoftware.com
 * @email gcoronelc@gmail.com
 * @youtube www.youtube.com/DesarrollaSoftware
 * @facebook www.facebook.com/groups/desarrollasoftware/
 * @cursos gcoronelc.github.io
 */
public class ConsultaService {
	
	public EstudianteDto consultaPorCodigo(String codigo){
		EstudianteDto bean = null;
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		String sql = "select idestudiante, apellido, nombre from ESTUDIANTE where codigo=?";
		try {
			// Conexion con la BD
			cn = AccesoDB.getConnection();
			// Preparando el objeto
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, codigo);
			// Ejecutar el objeto
			rs = pstm.executeQuery();
			// Verificar resultado
			if(!rs.next()){
				return null;
			}
			// Obtener datos del usuario
			bean = new EstudianteDto();
			bean.setIdestudiante(rs.getLong("idestudiante"));
			bean.setApellido(rs.getString("apellido"));
			bean.setNombre(rs.getString("nombre"));
			bean.setCodigo(codigo);
			rs.close();
			pstm.close();		
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en el proceso.");
		} finally{
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		return bean;
	}
	
	

}
