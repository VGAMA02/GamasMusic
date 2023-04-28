import { Injectable } from '@angular/core';
import 'rxjs';
import { Config } from '../config';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class ArtistData {

    apiEndpoint: string;
    constructor(private _http: HttpClient, public config: Config) {
        this.apiEndpoint = this.config.API_MAIN;
        console.log("Endpoint: " + this.apiEndpoint);
    }
    deleteArtist(Name:string,Nationality:string,year:number): Observable<any> {
        let data = {Name,Nationality,year};
        return this._http.post(this.apiEndpoint +'Artist/PostDeleteArtist',data);
    }
    getArtist(): Observable<any> {
        return this._http.get(this.apiEndpoint +'Artist/GetAllAvailableArtist');
    }

   

}