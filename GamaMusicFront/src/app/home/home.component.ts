import { Component, OnInit } from '@angular/core';
import { ShowData } from './home.services';


@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
  providers: [ShowData]
})
export class HomeComponent implements OnInit {
  
 
  constructor(private _ShowData: ShowData) {
    songs: Array<any>();
    albums: Array<any>();
    artists: Array<any>();
    //var songs: Array<any> = [];
    //songs: Array<any>();
   }
   songs = null;
   albums = null;
   artist = null;

  

  ngOnInit(): void {
   
    this.getSongs();
    this.getAlbums();
    this.getArtist();

  }
  
   getSongs(){
    this._ShowData.getSongs().subscribe(res => {
      console.log(res);
      this.songs = res;
      //console.log(this.songs);
  });
  }

  getAlbums(){
    this._ShowData.getAlbums().subscribe(res => {
      console.log(res);
      this.albums = res;
      //console.log(this.songs);
  });
  }

  getArtist(){
    this._ShowData.getArtists().subscribe(res => {
      console.log(res);
      this.artist = res;
      //console.log(this.songs);
  });
  }

}
