package pe.edu.uni.biblioteca.prueba;

import pe.edu.uni.biblioteca.dto.EstudianteDto;
import pe.edu.uni.biblioteca.dto.PrestamoDto;
import pe.edu.uni.biblioteca.service.BiblioService;
import pe.edu.uni.biblioteca.service.ConsultaService;

/**
 * Prueba para registrar prestamo correcto.
 */
public class PruebaConsultaEstudiante {
	
	public static void main(String[] args) {
		
		try {
			// Datos
			String codigo = "20222188K";
			// Proceso
			ConsultaService service = new ConsultaService();
			EstudianteDto bean = service.consultaEmpleado(codigo);
			System.out.println("Proceso ok.");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		
		
	}
	
}
