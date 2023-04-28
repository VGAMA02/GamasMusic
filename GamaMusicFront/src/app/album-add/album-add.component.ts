import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms'; // <--- Importa este módulo
import { AlbumsAddData } from './album-add.services';
import { Router, NavigationExtras } from '@angular/router';
@Component({
  selector: 'app-album-add',
  templateUrl: './album-add.component.html',
  styleUrls: ['./album-add.component.css'],
  providers:[AlbumsAddData]
})
export class AlbumAddComponent implements OnInit {
  formArray: any[] = [];
  constructor(private _Router: Router,private _AlbumsAddData : AlbumsAddData) { }

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
    this._AlbumsAddData.addAlbum(this.formArray[0].Name,this.formArray[0].FK_Artist,this.formArray[0].year).subscribe(res => {
    console.log(res);
    console.log(res[0].resultado);
    if(res[0].resultado == "OK"){
      alert("album agregado");
    }
    else if(res[0].resultado == "El Album ya existe"){
      alert("El Album ya existe");
    }
    else if(res[0].resultado == "No se encontro artista"){
      alert("No se encontro al artista posiblemente no exista, agregelo o coloque un artista existente");
    }
    else{

    }
      //console.log(this.songs);
    
  });
    this.formArray.pop();
    form.reset;
    form.resetForm;
    this._Router.navigate(['/album']);
    
    }

}
