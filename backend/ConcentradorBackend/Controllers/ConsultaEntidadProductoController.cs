using System.Collections.Generic;
using System.Threading.Tasks;
using ConcentradorBackend.Dtos.Request;
using ConcentradorBackend.Interfaces;
using ConcentradorBackend.Models;
using Microsoft.AspNetCore.Mvc;

namespace ConcentradorBackend.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    public class ConsultaController : Controller
    {

        private readonly IConsultaProductoService _consultaProductoService;

        public ConsultaController(IConsultaProductoService consultaProductoService)
        {
            _consultaProductoService = consultaProductoService;
        }
        
        [HttpPost]
        [Route("producto-financiero/pagina/{page}")]
        public List<ConsultaEntidadProducto> Post([FromBody] ConsultaProductoFinancieroRequest request, int page)
        {
            return _consultaProductoService.consulta(request, page);
        }

        [HttpGet]
        [Route("detalle/{id}")]
        public ConsultaEntidadProducto DetalleProducto(int id)
        {
            return _consultaProductoService.DetalleProducto(id);
        }
    }
}