using System.Collections.Generic;
using System.Threading.Tasks;
using ConcentradorBackend.Interfaces;
using ConcentradorBackend.Models;
using Microsoft.AspNetCore.Mvc;

namespace ConcentradorBackend.Controllers
{
    [Route("api/[controller]")]
    public class ProspectoController : Controller
    {
        private readonly IProspectoService _prospectoService;

        public ProspectoController(IProspectoService prospectoService)
        {
            _prospectoService = prospectoService;
        }

        [HttpPost]
        public async Task<int> Post([FromBody] Prospecto prospecto)
        {
            prospecto.ProspectoId = _prospectoService.RegistrarProspecto(prospecto);
            return await Task.FromResult(prospecto.ProspectoId);
        }
    }
}
