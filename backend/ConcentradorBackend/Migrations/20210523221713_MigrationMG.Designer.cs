// <auto-generated />
using System;
using ConcentradorBackend.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace ConcentradorBackend.Migrations
{
    [DbContext(typeof(ConcentradorDBContext))]
    [Migration("20210523221713_MigrationMG")]
    partial class MigrationMG
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.5")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("ConcentradorBackend.Models.ConsultaEntidadProducto", b =>
                {
                    b.Property<int>("ConsultaEntidadProductoId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("DepartamentoId")
                        .HasColumnType("int");

                    b.Property<string>("Descripcion")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("IngresoPermitido")
                        .HasColumnType("int");

                    b.Property<string>("Moneda")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("MonedaId")
                        .HasColumnType("int");

                    b.Property<decimal?>("MontoMaximoDeposito")
                        .HasColumnType("decimal (18,2)");

                    b.Property<decimal?>("MontoMaximoPrestamo")
                        .HasColumnType("decimal (18,2)");

                    b.Property<decimal?>("MontoMinimoDeposito")
                        .HasColumnType("decimal (18,2)");

                    b.Property<decimal?>("MontoMinimoPrestamo")
                        .HasColumnType("decimal (18,2)");

                    b.Property<string>("Nombre")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Observacion")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PathImagen")
                        .HasColumnType("nvarchar(max)");

                    b.Property<short?>("PlazoMaximoDia")
                        .HasColumnType("smallint");

                    b.Property<short?>("PlazoMaximoMes")
                        .HasColumnType("smallint");

                    b.Property<short?>("PlazoMinimoDia")
                        .HasColumnType("smallint");

                    b.Property<short?>("PlazoMinimoMes")
                        .HasColumnType("smallint");

                    b.Property<decimal>("PorcentajeComision")
                        .HasColumnType("decimal (18,2)");

                    b.Property<decimal>("PorcentajeSeguro")
                        .HasColumnType("decimal (18,2)");

                    b.Property<decimal>("PorcentajeTea")
                        .HasColumnType("decimal (18,2)");

                    b.Property<string>("Producto")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("ProductoFinancieroId")
                        .HasColumnType("int");

                    b.Property<int>("TipoInstitucionId")
                        .HasColumnType("int");

                    b.Property<int>("TipoProductoId")
                        .HasColumnType("int");

                    b.Property<string>("Ubicacion")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("ConsultaEntidadProductoId");

                    b.ToTable("vw_consulta_entidad_producto");
                });

            modelBuilder.Entity("ConcentradorBackend.Models.Departamento", b =>
                {
                    b.Property<int>("DepartamentoId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<bool>("Estado")
                        .HasColumnType("bit");

                    b.Property<string>("Nombre")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("DepartamentoId");

                    b.ToTable("Departamento");
                });

            modelBuilder.Entity("ConcentradorBackend.Models.Opcion", b =>
                {
                    b.Property<int>("OpcionId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Descripcion")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("Estado")
                        .HasColumnType("bit");

                    b.Property<string>("Icono")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Nombre")
                        .HasColumnType("nvarchar(max)");

                    b.Property<short>("Orden")
                        .HasColumnType("smallint");

                    b.Property<string>("PathUrl")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("OpcionId");

                    b.ToTable("Opcion");
                });
#pragma warning restore 612, 618
        }
    }
}
