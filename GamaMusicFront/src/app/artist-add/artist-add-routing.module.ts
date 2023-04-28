import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ArtistAddComponent } from './artist-add.component';
import {  Routes, RouterModule } from '@angular/router';
const routes: Routes = [
  {
    path: '',
    component: ArtistAddComponent
  }
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ArtistAddRoutingModule { }
