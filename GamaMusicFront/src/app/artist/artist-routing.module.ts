import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ArtistComponent } from './artist.component';
import {  Routes, RouterModule } from '@angular/router';
const routes: Routes = [
  {
    path: '',
    component: ArtistComponent
  }
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ArtistRoutingModule { }
