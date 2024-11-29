package pe.edu.uni.biblioteca.controller;

import java.util.List;
import pe.edu.uni.biblioteca.dto.EjemplarDto;
import pe.edu.uni.biblioteca.dto.EstudianteDto;
import pe.edu.uni.biblioteca.dto.Reporte01;
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
	
	public List<Reporte01> obtenerReporte01(){
		ConsultaService service = new ConsultaService();
		return service.obtenerReporte01();
	}
	
	
	public EstudianteDto consultaEmpleado(String codigo){
		ConsultaService service = new ConsultaService();
		return service.consultaEmpleado(codigo);
	}

	public List<EjemplarDto> consultaEjemplares(String titulo){
		ConsultaService service = new ConsultaService();
		return service.consultaEjemplares(titulo);
	}

}
