import { Component, OnInit } from '@angular/core';
import { Form, FormsModule, NgForm } from '@angular/forms'; // <--- Importa este módulo
import { empty } from 'rxjs';
import { SongsEditData } from './song-edit.services';
import { ActivatedRoute } from '@angular/router';
import { Router, NavigationExtras } from '@angular/router';
@Component({
  selector: 'app-song-edit',
  templateUrl: './song-edit.component.html',
  styleUrls: ['./song-edit.component.css'],
  providers: [SongsEditData]
})

export class SongEditComponent implements OnInit {
  formArray: any[] = [];
  datos: any;
  Viejos: any;
  
  constructor(private _SongsEditData: SongsEditData,private _Route: ActivatedRoute,private _Router: Router) {
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
    
  ngOnInit(): void {
    
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
    this._SongsEditData.editSong(this.formArray[0].Name,this.formArray[0].FK_Album,this.formArray[0].year,this.formArray[0].Gender,this.formArray[0].Length,
    this.Viejos.BfName,this.Viejos.BfFK_Album,this.Viejos.BfYear,this.Viejos.BfGender,this.Viejos.BfLength).subscribe(res => {
    console.log(res);
    console.log(res[0].resultado);
    if(res[0].resultado == "OK"){
      alert("cancion editada");
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
    this._Router.navigate(['/songs']);
    
    }
}
