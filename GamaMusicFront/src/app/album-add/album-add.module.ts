import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AlbumAddComponent } from './album-add.component';
import { AlbumAddRoutingModule } from './album-add-routing.module';
import { FormsModule } from '@angular/forms'; // <--- Importa este módulo

@NgModule({
  declarations: [
    AlbumAddComponent
  ],
  imports: [
    CommonModule,AlbumAddRoutingModule,FormsModule
  ]
})
export class AlbumAddModule { }
