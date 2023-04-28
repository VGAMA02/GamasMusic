import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms'; // <--- Importa este módulo
import { empty } from 'rxjs';
import { SongsAddData } from './song-add.services';
import { Router, NavigationExtras } from '@angular/router';
@Component({
  selector: 'app-song-add',
  templateUrl: './song-add.component.html',
  styleUrls: ['./song-add.component.css'],
  providers:[SongsAddData]
})
export class SongAddComponent implements OnInit {
  formArray: any[] = [];
  constructor(private _Router: Router, private _SongsAddData: SongsAddData) { 
  }
  ngOnInit(): void {
    
  }
  guardarInformacion(form: NgForm) {
    // Aquí puedes procesar los datos del formulario como quieras

    let formData = form;
    this.formArray.push(formData);
    console.log('data: ' + this.formArray[0].Name);
    console.log("inforForm: ");
    console.log(form);
    //this.songData = form.form;
    //console.log(this.formArray);
    this._SongsAddData.addSong(this.formArray[0].Name,this.formArray[0].FK_Album,this.formArray[0].year,this.formArray[0].Gender,this.formArray[0].Length).subscribe(res => {
    console.log(res);
    console.log(res[0].resultado);
    if(res[0].resultado == "OK"){
      alert("cancion agregada");
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
