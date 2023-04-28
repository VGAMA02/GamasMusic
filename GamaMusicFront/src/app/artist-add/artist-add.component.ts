import { Component, OnInit } from '@angular/core';
import { ArtistAddData } from './artist.services';
import { NgForm } from '@angular/forms'; // <--- Importa este módulo
import { Router, NavigationExtras } from '@angular/router';
@Component({
  selector: 'app-artist-add',
  templateUrl: './artist-add.component.html',
  styleUrls: ['./artist-add.component.css'],
  providers: [ArtistAddData]
})
export class ArtistAddComponent implements OnInit {
  formArray: any[] = [];
  constructor(private _Router: Router,private _ArtistAddData: ArtistAddData ) { }

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
    this._ArtistAddData.addArtist(this.formArray[0].Name,this.formArray[0].Nationality,this.formArray[0].year,).subscribe(res => {
    console.log(res);
    console.log(res[0].resultado);
    if(res[0].resultado == "OK"){
      alert("El artista fue agregado");
    }
    else if(res[0].resultado == "La cancion ya existe"){
      alert("El artista ya existe");
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
