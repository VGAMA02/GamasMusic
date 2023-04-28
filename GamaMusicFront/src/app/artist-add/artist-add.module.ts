import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ArtistAddComponent } from './artist-add.component';
import { ArtistAddRoutingModule } from './artist-add-routing.module';
import { FormsModule } from '@angular/forms'; // <--- Importa este módulo

@NgModule({
  declarations: [
    ArtistAddComponent
  ],
  imports: [
    CommonModule,ArtistAddRoutingModule,FormsModule
  ]
})
export class ArtistAddModule { }
