import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AlbumEditComponent } from './album-edit.component';
import { AlbumEditRoutingModule } from './album-edit-routing.module';
import { FormsModule } from '@angular/forms'; // <--- Importa este módulo

@NgModule({
  declarations: [
    AlbumEditComponent
  ],
  imports: [
    CommonModule,AlbumEditRoutingModule,FormsModule
  ]
})
export class AlbumEditModule { }
