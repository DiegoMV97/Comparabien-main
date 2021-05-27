using ConcentradorBackend.Interfaces;
using ConcentradorBackend.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ConcentradorBackend.DataAccess
{
    public class ProspectoDataAccessLayer : IProspectoService
    {
        private readonly ConcentradorDBContext _dbContext;
        readonly IProspectoService _prospectoService;

        public ProspectoDataAccessLayer(ConcentradorDBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public int RegistrarProspecto(Prospecto prospecto)
        {
            int nResult = 0;
            try
            {
                if (!prospecto.FechaRegistro.HasValue)
                {
                    prospecto.FechaRegistro = DateTime.Today;
                }
                prospecto.Activo = true;
                _dbContext.Prospecto.Add(prospecto);
                _dbContext.SaveChanges();
                nResult = prospecto.ProspectoId;

            }
            catch (Exception e)
            {
                nResult = -1;
                throw e;
            }
            return nResult;
        }
    }
}
