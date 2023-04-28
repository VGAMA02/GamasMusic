import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SongEditComponent } from './song-edit.component';
import { SongEditRoutingModule } from './song-edit-routing.module';
import { FormsModule } from '@angular/forms'; // <--- Importa este módulo

@NgModule({
  declarations: [
    SongEditComponent
  ],
  imports: [
    CommonModule,SongEditRoutingModule,FormsModule
  ]
})
export class SongEditModule { }
