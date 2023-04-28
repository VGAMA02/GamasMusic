import { Component, OnInit } from '@angular/core';
import { ArtistData } from './artist.services';
import { Router, NavigationExtras } from '@angular/router';
@Component({
  selector: 'app-artist',
  templateUrl: './artist.component.html',
  styleUrls: ['./artist.component.css'],
  providers:[ArtistData]
})
export class ArtistComponent implements OnInit {

  constructor(private _Router: Router, private _ArtistData: ArtistData) { 
    artists: Array<any>();
  }
  artists = null;
  ngOnInit(): void {
    this.getArtist();
  }

  DeleteArtist(Name:string,Nationality:string,Year:number ){
    console.log("Eliminando Artista");
    console.log(Name + "," + Nationality + "," + Year);
    this._ArtistData.deleteArtist(Name,Nationality,Year).subscribe(res => {
      console.log(res);
      if(res[0].resultado == "OK"){
        alert("Artista Eliminado");
      }
      else{
        alert("Algo salio mal");
      }
      //console.log(this.songs);
    this.getArtist();
  });
  }

  getArtist(){
    this._ArtistData.getArtist().subscribe(res => {
      console.log(res);
      this.artists = res;
      //console.log(this.songs);
  });
}

EditArtist(Name:string,Nationality:string,Year:number) {
    // Crea un objeto con la información que deseas enviar
    console.log("Editar cancion");
    const datos = {
      BfName: Name,
      BfNationality:Nationality,
      BfYear:Year,
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
    this._Router.navigate(['/artistedit'], navigationExtras);
  }



}
