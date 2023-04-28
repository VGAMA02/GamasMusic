import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {  Routes, RouterModule } from '@angular/router';
import { AlbumEditComponent } from './album-edit.component';
const routes: Routes = [
  {
    path: '',
    component: AlbumEditComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class AlbumEditRoutingModule { }
