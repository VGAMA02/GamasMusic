import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path:'home',
    loadChildren: () => import('./home/home.module').then (m => m.HomeModule)
  },
  {
    path:'songs',
    loadChildren: () => import('./songs/songs.module').then (m => m.SongsModule)
  },
  {
    path:'songsedit',
    loadChildren: () => import('./song-edit/song-edit.module').then (m => m.SongEditModule)
  },
  {
    path:'songsadd',
    loadChildren: () => import('./song-add/song-add.module').then (m => m.SongAddModule)
  },
  {
    path:'artist',
    loadChildren: () => import('./artist/artist.module').then (m => m.ArtistModule)
  },
  {
    path:'artistadd',
    loadChildren: () => import('./artist-add/artist-add.module').then (m => m.ArtistAddModule)
  },
  {
    path:'artistedit',
    loadChildren: () => import('./artist-edit/artist-edit.module').then (m => m.ArtistEditModule)
  },
  {
    path:'album',
    loadChildren: () => import('./album/album.module').then (m => m.AlbumModule)
  },
  {
    path:'albumadd',
    loadChildren: () => import('./album-add/album-add.module').then (m => m.AlbumAddModule)
  },
  {
    path:'albumedit',
    loadChildren: () => import('./album-edit/album-edit.module').then (m => m.AlbumEditModule)
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
