package pe.edu.uni.biblioteca.prueba;

import pe.edu.uni.biblioteca.dto.PrestamoDto;
import pe.edu.uni.biblioteca.service.BiblioService;

/**
 * Prueba para registrar prestamo correcto.
 */
public class PruebaPrestamo04 {
	
	public static void main(String[] args) {
		
		try {
			// Datos
			PrestamoDto dto = new PrestamoDto();
			dto.setIdEjemplar(1L);
			dto.setIdEstudiante(3L);
			// Proceso
			BiblioService service = new BiblioService();
			service.registrarPrestamo(dto);
			System.out.println("Proceso ok.");
			System.out.println(dto);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		
		
	}
	
}
