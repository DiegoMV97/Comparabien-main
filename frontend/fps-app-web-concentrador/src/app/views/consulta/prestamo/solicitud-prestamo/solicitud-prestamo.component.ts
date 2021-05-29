import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { SelectItem } from 'primeng/api';
import { Prospecto } from '../../../../models/prospecto';
import { ProspectoService } from '../../../../services/prospecto.service';
import Swal from 'sweetalert2';
import { DepartamentoService } from 'src/app/services/departamento.service';
import { Validators } from '@angular/forms';

@Component({
  selector: 'app-solicitud-prestamo',
  templateUrl: './solicitud-prestamo.component.html',
  styleUrls: ['./solicitud-prestamo.component.css']
})
export class SolicitudPrestamoComponent implements OnInit {

  form: FormGroup;
  id: number;

  constructor(private readonly prospectoService: ProspectoService,
              private readonly departamentoService: DepartamentoService,
              private readonly fb: FormBuilder,
              private readonly router: Router) { }

  //departamento: SelectItem[];
  departamentos: SelectItem[];
  tipoDocumento: SelectItem[];

  ngOnInit(): void {
    this.createForm();
    this.loadDepartamento();
    this.loadDocumento();
  }

  createForm() {
    this.form = this.fb.group({
      nombre: ['', Validators.required],
      apellido: ['', Validators.required],
      idTipoDocumento: [null, Validators.required],
      numeroDocumento: ['', [Validators.required, Validators.minLength(8), Validators.maxLength(20)]],
      email: ['', [Validators.required, Validators.email]],
      celular: ['', [Validators.required,  Validators.minLength(7), Validators.maxLength(20)]],
      idDepartamento: [null, Validators.required]
    });
  }

  get nombre() {
    return this.form.get('nombre');
  }
  get apellido() {
    return this.form.get('apellido');
  }
  get idTipoDocumento() {
    return this.form.get('idTipoDocumento');
  }
  get numeroDocumento() {
    return this.form.get('numeroDocumento');
  }
  get email() {
    return this.form.get('email');
  }
  get celular() {
    return this.form.get('celular');
  }
  get idDepartamento() {
    return this.form.get('idDepartamento');
  }

  guardar() {
    if(this.form.valid)
      {
      const data = new Prospecto();
      data.nombres = this.form.value.nombre;
      data.apellidos = this.form.value.apellido;
      data.tipoDocumentoId = this.form.value.idTipoDocumento;
      data.departamentoId = this.form.value.idDepartamento;
      data.email = this.form.value.email;
      data.numeroDocumento = this.form.value.numeroDocumento;
      data.numeroCelular =  this.form.value.celular;
      this.prospectoService.save(data).subscribe( () => {
        Swal.fire({
          position: 'center',
          icon: 'success',
          title: 'Su informacion fue enviada',
          text: 'Por favor espere a que le contactemos, gracias.',
          showConfirmButton: true
        }).then((result) => {
          this.router.navigate(['/home']);
        });
      });
    }
    else{
      Swal.fire("Por favor llene los campos correctamente.");
      return;
    }
  }

  loadDocumento(){
    this.tipoDocumento = [
      {label: 'Seleccione..', value: null},
      {label: 'DNI', value: 1},
      {label: 'Carnet Extranjeria', value: 2 }
    ];
  }

  loadDepartamento(){
    this.departamentoService.listar().subscribe(data => {
      this.departamentos = [
        { label: 'Seleccione..', value: null }
      ];
      //this.departamentos = data;
      this.departamentos = this.departamentos.concat(data);
    });
    /*
    this.departamento = [
      {label: 'Seleccione..', value: null},
      {label: 'Amazonas', value: 1},
      {label: 'Áncash', value: 2 },
      {label: 'Apurímac', value: 3},
      {label: 'Arequipa', value: 4},
      {label: 'Ayacucho', value: 5},
      {label: 'Cajamarca', value: 6},
      {label: 'Cusco', value: 7},
      {label: 'Huancavelica', value: 8},
      {label: 'Huánuco', value: 9},
      {label: 'Ica', value: 10},
      {label: 'Junín', value: 11},
      {label: 'La Libertad', value: 12},
      {label: 'Lambayeque', value: 13},
      {label: 'Lima', value: 14},
      {label: 'Loreto', value: 15},
      {label: 'Pasco', value: 16},
      {label: 'Piura', value: 17},
      {label: 'Tacna', value: 18}
  ];
  */
  }
}
