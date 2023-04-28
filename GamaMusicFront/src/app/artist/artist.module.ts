import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ArtistComponent } from './artist.component';
import { ArtistRoutingModule } from './artist-routing.module';
import {MatIconModule} from '@angular/material/icon';
import {MatTableModule} from '@angular/material/table';

@NgModule({
  declarations: [
    ArtistComponent
  ],
  imports: [
    CommonModule,ArtistRoutingModule, MatIconModule,MatTableModule
  ]
})
export class ArtistModule { }
