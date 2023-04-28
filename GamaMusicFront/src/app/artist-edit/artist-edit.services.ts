import { Injectable } from '@angular/core';
import 'rxjs';
import { Config } from '../config';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class ArtistEditData {

    apiEndpoint: string;
    constructor(private _http: HttpClient, public config: Config) {
        this.apiEndpoint = this.config.API_MAIN;
        console.log("Endpoint: " + this.apiEndpoint);
    }
    editArtist(Name:string,Nationality:string,year:number,
        BfName:string,BfNationality:string,Bfyear:number,): Observable<any> {
        let data = {Name,Nationality,year,BfName,BfNationality,Bfyear};
        return this._http.post(this.apiEndpoint +'Artist/PostUpdateArtist',data);
    }

   

}