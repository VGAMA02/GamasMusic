import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ArtistEditComponent } from './artist-edit.component';
import { ArtistEditRoutingModule } from './artist-edit-routing.module';
import { FormsModule } from '@angular/forms'; // <--- Importa este módulo

@NgModule({
  declarations: [
    ArtistEditComponent
  ],
  imports: [
    CommonModule,ArtistEditRoutingModule, FormsModule
  ]
})
export class ArtistEditModule { }
