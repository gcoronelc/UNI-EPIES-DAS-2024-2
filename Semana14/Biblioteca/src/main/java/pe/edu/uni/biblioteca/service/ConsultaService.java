package pe.edu.uni.biblioteca.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.uni.biblioteca.db.AccesoDB;
import pe.edu.uni.biblioteca.dto.EjemplarDto;
import pe.edu.uni.biblioteca.dto.EstudianteDto;
import pe.edu.uni.biblioteca.dto.Reporte01;
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
	
	public List<Reporte01> obtenerReporte01(){
		String sql = """
			select e.DESCRIPCION, count(1) FRECUENCIA 
			from PRESTAMO p
			join ESTADO e on p.IDESTADO = e.IDESTADO
			group by e.DESCRIPCION
      """;
		List<Reporte01> lista = new ArrayList<>();
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		try {
			cn = AccesoDB.getConnection();
			pstm = cn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while(rs.next()){
				Reporte01 bean = new Reporte01();
				bean.setEtiqueta(rs.getString("DESCRIPCION"));
				bean.setFrecuencia(rs.getInt("FRECUENCIA"));
				lista.add(bean);
			}
			rs.close();
			pstm.close();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} catch (Exception e) {
			throw new RuntimeException("Error en la consulta.");
		} finally{
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		return lista;
	}
	
	public EstudianteDto consultaEmpleado(String codigo){
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
	
	public List<EjemplarDto> consultaEjemplares(String titulo){
		List<EjemplarDto> lista = new ArrayList<>();
		Connection cn = null;
		PreparedStatement pstm;
		ResultSet rs;
		String sql = """
			select E.IDEJEMPLAR, E.CODIGO, L.TITULO,
			E.EDITORIAL, E.EDICION, E.ANIO
			from LIBRO L 
			join EJEMPLAR E on L.IDLIBRO = E.IDLIBRO   
          where E.IDSITUACION = 1 and L.TITULO like ?   
      """;
		try {
			// Conexion con la BD
			cn = AccesoDB.getConnection();
			// Preparando el objeto
			pstm = cn.prepareStatement(sql);
			titulo = "%" + titulo + "%";
			pstm.setString(1, titulo);
			// Ejecutar el objeto
			rs = pstm.executeQuery();
			// Verificar resultado
			while(rs.next()){
				EjemplarDto bean = new EjemplarDto();
				bean.setIdejemplar(rs.getLong("IDEJEMPLAR"));
				bean.setCodigo(rs.getString("CODIGO"));
				bean.setTitulo(rs.getString("TITULO"));
				bean.setEditorial(rs.getString("EDITORIAL"));
				bean.setEdicion(rs.getInt("EDICION"));
				bean.setAnio(rs.getInt("ANIO"));
				lista.add(bean);
			}
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
		return lista;
	}

}
