import { Injectable } from '@angular/core';
import 'rxjs';
import { Config } from '../config';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class AlbumsEditData {

    apiEndpoint: string;
    constructor(private _http: HttpClient, public config: Config) {
        this.apiEndpoint = this.config.API_MAIN;
        console.log("Endpoint: " + this.apiEndpoint);
    }
    editAlbum(Name:string,FK_Artist:string,year:number,BfName:string,BfFK_Artist:string,Bfyear:number): Observable<any> {
        let data = {Name,FK_Artist,year,BfName,BfFK_Artist,Bfyear};
        return this._http.post(this.apiEndpoint +'Album/PostUpdAlbum',data);
    }

   

}