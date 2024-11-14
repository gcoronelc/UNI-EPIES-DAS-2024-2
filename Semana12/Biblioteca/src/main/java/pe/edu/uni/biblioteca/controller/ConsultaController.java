package pe.edu.uni.biblioteca.controller;

import pe.edu.uni.biblioteca.dto.EstudianteDto;
import pe.edu.uni.biblioteca.service.ConsultaService;

/**
 *
 * @author Eric Gustavo Coronel Castillo
 * @blog www.desarrollasoftware.com
 * @email gcoronelc@gmail.com
 * @youtube www.youtube.com/DesarrollaSoftware
 * @facebook www.facebook.com/groups/desarrollasoftware/
 * @cursos gcoronelc.github.io
 */
public class ConsultaController {
	
	
	public EstudianteDto consultaPorCodigo(String codigo){
		ConsultaService service = new ConsultaService();
		return service.consultaPorCodigo(codigo);
	}

}
