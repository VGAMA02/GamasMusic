import { Component, OnInit } from '@angular/core';
import { provideRoutes } from '@angular/router';
import { AlbumData } from './album.services';
import { Router, NavigationExtras } from '@angular/router';
@Component({
  selector: 'app-album',
  templateUrl: './album.component.html',
  styleUrls: ['./album.component.css'],
  providers:[AlbumData]
})
export class AlbumComponent implements OnInit {

  constructor(private _Router: Router, private _AlbumData: AlbumData) {
    albums: Array<any>();
   }
   albums = null;
  ngOnInit(): void {
    this.getAlbums();
  }

  getAlbums(){
    this._AlbumData.getAlbums().subscribe(res => {
      console.log(res);
      this.albums = res;
      //console.log(this.songs);
  });
  }


  
  DeleteAlbum(Name:string,FK_Artist:string,year:number){
    console.log("Eliminando Album");
    console.log(Name + "," + FK_Artist + "," + year);
    this._AlbumData.deleteAlbum(Name,FK_Artist,year).subscribe(res => {
      console.log(res);
      if(res[0].resultado == "OK"){
        alert("Album Eliminado");
      }
      //console.log(this.songs);
    this.getAlbums();
    });
  }

  editAlbum(Name:string,FK_Artist:string,year:number){
    // Crea un objeto con la información que deseas enviar
    console.log("Editar cancion");
    const datos = {
      BfName: Name,
      BfFK_Artist:FK_Artist,
      BfYear:year
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
    this._Router.navigate(['/albumedit'], navigationExtras);
  }

}
