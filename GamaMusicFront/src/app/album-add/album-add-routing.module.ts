import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AlbumAddComponent } from './album-add.component';
import {  Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    component: AlbumAddComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class AlbumAddRoutingModule { }
