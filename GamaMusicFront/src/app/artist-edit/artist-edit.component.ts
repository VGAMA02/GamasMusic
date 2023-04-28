import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Router, NavigationExtras } from '@angular/router';
import { ArtistEditData } from './artist-edit.services';
import { Form, FormsModule, NgForm } from '@angular/forms'; // <--- Importa este módulo
@Component({
  selector: 'app-artist-edit',
  templateUrl: './artist-edit.component.html',
  styleUrls: ['./artist-edit.component.css'],
  providers: [ArtistEditData]
})
export class ArtistEditComponent implements OnInit {
  formArray: any[] = [];
  datos: any;
  Viejos: any;
  constructor(private _ArtistEditData: ArtistEditData,private _Route: ActivatedRoute,private _Router: Router) { }

  ngOnInit(): void {
    this._Route.queryParams.subscribe(params => {
      console.log(params['datos']);
      if (params['datos']) {
        this.datos = JSON.parse(params['datos']);
        this.Viejos = JSON.parse(params['datos']);
      }
    }).unsubscribe;
    console.log("---------");
    console.log('Data recien traida: ');
    console.log(this.Viejos);
  }

  editarInformacion(form: NgForm) {
    // Aquí puedes procesar los datos del formulario como quieras
    console.log("data vieja: " + this.Viejos.BfName);
    let formData = form;
    this.formArray.push(formData);
    console.log('data: ' + this.formArray[0].Name);
    console.log("inforForm: ");
    console.log(form);
    console.log("infoDatosViejos: ");
    
    //this.songData = form.form;
    //console.log(this.formArray);
    this._ArtistEditData.editArtist(this.formArray[0].Name,this.formArray[0].Nationality,this.formArray[0].year,
    this.Viejos.BfName,this.Viejos.BfNationality,this.Viejos.BfYear).subscribe(res => {
    console.log(res);
    console.log(res[0].resultado);
    if(res[0].resultado == "OK"){
      alert("Artista Editado");
    }
    else if(res[0].resultado == "La cancion ya existe"){
      alert("La cancion ya existe");
    }
    else if(res[0].resultado == "No se encontro album"){
      alert("No se encontro album posiblemente no exista, agregelo o coloque un album existente");
    }
    else{

    }

      //console.log(this.songs);
    
  });
    this.formArray.pop();
    form.reset;
    form.resetForm;
    this._Router.navigate(['/artist']);
    
    }

}
