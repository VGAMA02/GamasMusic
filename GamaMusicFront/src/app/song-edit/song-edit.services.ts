import { Injectable } from '@angular/core';
import 'rxjs';
import { Config } from '../config';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class SongsEditData {

    apiEndpoint: string;
    constructor(private _http: HttpClient, public config: Config) {
        this.apiEndpoint = this.config.API_MAIN;
        console.log("Endpoint: " + this.apiEndpoint);
    }
    editSong(Name:string,FK_Album:string,year:number,Gender:string,Length:string,
        BfName:string,BfFK_Album:string,Bfyear:number,BfGender:string,BfLength:string): Observable<any> {
        let data = {Name,FK_Album,year,Gender,Length,BfName,BfFK_Album,Bfyear,BfGender,BfLength};
        return this._http.post(this.apiEndpoint +'api/Song/PostUpdateSong',data);
    }

   

}