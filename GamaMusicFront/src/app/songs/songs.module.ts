import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SongsComponent } from './songs.component';
import { SongsRoutingModule } from './songs-routing.module';
import {MatIconModule} from '@angular/material/icon';
import {MatTableModule} from '@angular/material/table';
@NgModule({
  declarations: [
    SongsComponent
  ],
  imports: [
    CommonModule, SongsRoutingModule,MatIconModule,MatTableModule
  ],
})
export class SongsModule { }
