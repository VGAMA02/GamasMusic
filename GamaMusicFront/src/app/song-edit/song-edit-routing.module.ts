import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SongEditComponent } from './song-edit.component';
import {  Routes, RouterModule } from '@angular/router';
const routes: Routes = [
  {
    path: '',
    component: SongEditComponent
  }
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SongEditRoutingModule { }
