import { Injectable } from '@angular/core';
import 'rxjs';
import { Config } from '../config';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';


@Injectable()
export class ShowData {

    apiEndpoint: string;
    constructor(private _http: HttpClient, public config: Config) {
        this.apiEndpoint = this.config.API_MAIN;
        console.log("Endpoint: " + this.apiEndpoint);
    }

    /*getSongs(id : any): Observable<any> {
        let data = {id}
        return this._http.post(this.apiEndpoint +'api/Song/GetAllSongs',data);
    }*/

    getSongs(): Observable<any> {
        return this._http.get(this.apiEndpoint +'api/Song/GetAllAvailableSongs');
    }

    getAlbums(): Observable<any> {
        return this._http.get(this.apiEndpoint +'Album/GetAllAvailableAlbums');
    }

    getArtists(): Observable<any> {
        return this._http.get(this.apiEndpoint +'Artist/GetAllAvailableArtist');
    }

    /*prueba(data){
        this.http.get('https://tu-api.com/api/mi-endpoint').subscribe(data => {
            console.log(data);
          });
    }*/

}