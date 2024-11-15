package pe.edu.uni.biblioteca.prueba;

import java.util.List;
import pe.edu.uni.biblioteca.dto.EjemplarDto;
import pe.edu.uni.biblioteca.service.ConsultaService;

/**
 * Prueba para registrar prestamo correcto.
 */
public class PruebaConsultaEjemplares {
	
	public static void main(String[] args) {
		
		try {
			// Datos
			String titulo = "años";
			// Proceso
			ConsultaService service = new ConsultaService();
			List<EjemplarDto> lista = service.consultaEjemplares(titulo);
			for(EjemplarDto dto: lista){
				System.out.println(dto);
			}
			System.out.println("Proceso ok.");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		
		
	}
	
}
