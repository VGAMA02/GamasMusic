import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AlbumComponent } from './album.component';
import { AlbumRoutingModule } from './album-routing.module';
import {MatIconModule} from '@angular/material/icon';
import {MatTableModule} from '@angular/material/table';
@NgModule({
  declarations: [
    AlbumComponent
  ],
  imports: [
    CommonModule, AlbumRoutingModule, MatIconModule,MatTableModule
  ]
})
export class AlbumModule { }
