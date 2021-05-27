using Microsoft.EntityFrameworkCore.Migrations;

namespace ConcentradorBackend.Migrations
{
    public partial class MigrationMG : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Departamento",
                columns: table => new
                {
                    DepartamentoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Estado = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Departamento", x => x.DepartamentoId);
                });

            migrationBuilder.CreateTable(
                name: "Opcion",
                columns: table => new
                {
                    OpcionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Descripcion = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PathUrl = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Icono = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Estado = table.Column<bool>(type: "bit", nullable: false),
                    Orden = table.Column<short>(type: "smallint", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Opcion", x => x.OpcionId);
                });

            migrationBuilder.CreateTable(
                name: "vw_consulta_entidad_producto",
                columns: table => new
                {
                    ConsultaEntidadProductoId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProductoFinancieroId = table.Column<int>(type: "int", nullable: false),
                    TipoProductoId = table.Column<int>(type: "int", nullable: false),
                    TipoInstitucionId = table.Column<int>(type: "int", nullable: false),
                    Producto = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PathImagen = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    MonedaId = table.Column<int>(type: "int", nullable: false),
                    Moneda = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PorcentajeTea = table.Column<decimal>(type: "decimal (18,2)", nullable: false),
                    MontoMinimoDeposito = table.Column<decimal>(type: "decimal (18,2)", nullable: true),
                    MontoMaximoDeposito = table.Column<decimal>(type: "decimal (18,2)", nullable: true),
                    MontoMinimoPrestamo = table.Column<decimal>(type: "decimal (18,2)", nullable: true),
                    MontoMaximoPrestamo = table.Column<decimal>(type: "decimal (18,2)", nullable: true),
                    IngresoPermitido = table.Column<int>(type: "int", nullable: true),
                    PorcentajeComision = table.Column<decimal>(type: "decimal (18,2)", nullable: false),
                    PorcentajeSeguro = table.Column<decimal>(type: "decimal (18,2)", nullable: false),
                    PlazoMinimoDia = table.Column<short>(type: "smallint", nullable: true),
                    PlazoMaximoDia = table.Column<short>(type: "smallint", nullable: true),
                    PlazoMinimoMes = table.Column<short>(type: "smallint", nullable: true),
                    PlazoMaximoMes = table.Column<short>(type: "smallint", nullable: true),
                    DepartamentoId = table.Column<int>(type: "int", nullable: false),
                    Ubicacion = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Nombre = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Descripcion = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Observacion = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_vw_consulta_entidad_producto", x => x.ConsultaEntidadProductoId);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Departamento");

            migrationBuilder.DropTable(
                name: "Opcion");

            migrationBuilder.DropTable(
                name: "vw_consulta_entidad_producto");
        }
    }
}
