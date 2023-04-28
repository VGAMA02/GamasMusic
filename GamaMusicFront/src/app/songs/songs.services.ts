import { Injectable } from '@angular/core';
import 'rxjs';
import { Config } from '../config';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class SongsData {

    apiEndpoint: string;
    constructor(private _http: HttpClient, public config: Config) {
        this.apiEndpoint = this.config.API_MAIN;
        console.log("Endpoint: " + this.apiEndpoint);
    }
    deleteSong(Name:string,FK_Album:string,year:number,Gender:string): Observable<any> {
        let data = {Name,FK_Album,year,Gender};
        return this._http.post(this.apiEndpoint +'api/Song/PostDeleteSong',data);
    }
    getSongs(): Observable<any> {
        return this._http.get(this.apiEndpoint +'api/Song/GetAllAvailableSongs');
    }

   

}