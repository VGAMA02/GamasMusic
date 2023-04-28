import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SongAddComponent } from './song-add.component';
import { SongAddRoutingModule } from './song-add-routing.module';
import { FormsModule } from '@angular/forms'; // <--- Importa este módulo

@NgModule({
  declarations: [
    SongAddComponent
  ],
  imports: [
    CommonModule,SongAddRoutingModule,FormsModule
  ]
})
export class SongAddModule { }
