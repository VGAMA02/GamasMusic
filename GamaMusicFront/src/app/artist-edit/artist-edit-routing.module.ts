import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ArtistEditComponent } from './artist-edit.component';
import {  Routes, RouterModule } from '@angular/router';
const routes: Routes = [
  {
    path: '',
    component: ArtistEditComponent
  }
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ArtistEditRoutingModule { }
