using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ConcentradorBackend.Models
{
    [Table("vw_consulta_entidad_producto")]
    public partial class ConsultaEntidadProducto
    {
         [Key]
         public int ConsultaEntidadProductoId { get; set; }
         public int ProductoFinancieroId { get; set; }
         public int TipoProductoId { get; set; }
         public int TipoInstitucionId { get; set; }
         public string Producto { get; set; }
         public string PathImagen { get; set; }
         public int MonedaId { get; set; }
         public string Moneda { get; set; }
        [Column(TypeName = "decimal (18,2)")]
         public decimal PorcentajeTea { get; set; }
        [Column(TypeName = "decimal (18,2)")]
        public decimal? MontoMinimoDeposito { get; set; }
        [Column(TypeName = "decimal (18,2)")]
         public decimal? MontoMaximoDeposito { get; set; }
        [Column(TypeName = "decimal (18,2)")]
         public decimal? MontoMinimoPrestamo { get; set; }
        [Column(TypeName = "decimal (18,2)")]
         public decimal? MontoMaximoPrestamo { get; set; }
         public int? IngresoPermitido { get; set; }
        [Column(TypeName = "decimal (18,2)")]
         public decimal PorcentajeComision { get; set; }
        [Column(TypeName = "decimal (18,2)")]
         public decimal PorcentajeSeguro { get; set; }
         public short? PlazoMinimoDia { get; set; }
         public short? PlazoMaximoDia { get; set; }
         public short? PlazoMinimoMes { get; set; }
         public short? PlazoMaximoMes { get; set; }
         public int DepartamentoId { get; set; }
         public string Ubicacion { get; set; }
         public string Nombre { get; set; }
         public string Descripcion { get; set; }
         public string Observacion { get; set; }

    }
}