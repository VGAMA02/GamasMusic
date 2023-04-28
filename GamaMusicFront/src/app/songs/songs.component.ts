import { ThisReceiver } from '@angular/compiler';
import { Component, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { Console } from 'console';
import * as internal from 'stream';
import { SongsData } from './songs.services';
import { Router, NavigationExtras } from '@angular/router';
import { generate } from 'rxjs';
@Component({
  selector: 'app-songs',
  templateUrl: './songs.component.html',
  styleUrls: ['./songs.component.css'],
  providers:[SongsData]
})
export class SongsComponent implements OnInit {

  constructor(private _Router: Router, private _SongsData: SongsData) { 
    songs: Array<any>();
  }
  songs = null;
  ngOnInit(): void {
    this.getSongs();
  }

  NewSong(){
    console.log("Generando cancion");
    
  }
  dele( ){

  }
  DeleteSong(Name:string,FK_Album:string,Year:number,Gender:string ){
    console.log("Eliminando cancion");
    console.log(Name + "," + FK_Album + "," + Year + "," + Gender);
    this._SongsData.deleteSong(Name,FK_Album,Year,Gender).subscribe(res => {
      console.log(res);
      if(res[0].resultado == "OK"){
        alert("cancion Eliminada");
      }
      //console.log(this.songs);
    this.getSongs();
  });
  }

  getSongs(){
    this._SongsData.getSongs().subscribe(res => {
      console.log(res);
      this.songs = res;
      //console.log(this.songs);
  });
  }



  EditSong(Name:string,FK_Album:string,Year:number,Gender:string,Length:string) {
    // Crea un objeto con la información que deseas enviar
    console.log("Editar cancion");
    const datos = {
      BfName: Name,
      BfFK_Album:FK_Album,
      BfYear:Year,
      BfGender:Gender,
      BfLength:Length
    };
  
    // Define las opciones de navegación
    let navigationExtras: NavigationExtras = {
      queryParams: {
        // Agrega la información como parte del estado de navegación
        datos: JSON.stringify(datos)
      }
    };
    console.log("info a mandar");
    console.log(navigationExtras);
    // Navega a la página de ComponenteDestino con las opciones definidas
    this._Router.navigate(['/songsedit'], navigationExtras);
  }


}
