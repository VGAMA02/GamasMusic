import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SongAddComponent } from './song-add.component';
import {  Routes, RouterModule } from '@angular/router';
const routes: Routes = [
  {
    path: '',
    component: SongAddComponent
  }
];


@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SongAddRoutingModule { }
